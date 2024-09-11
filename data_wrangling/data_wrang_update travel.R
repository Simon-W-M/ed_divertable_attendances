

# set udal connection ----
server <- "udalsyndataprod.sql.azuresynapse.net"
database <- "UDAL_Warehouse"

con <- DBI::dbConnect(
  odbc::odbc(), 
  #  UID = rstudioapi::askForPassword("Username"),
  Driver="ODBC Driver 17 for SQL Server",
  Server = server, 
  Database = database,
  Authentication = "ActiveDirectoryInteractive"
)

attend_pat_raw_ad <- DBI::dbGetQuery(con,
                          statement = readr::read_file(paste0(path_data_load, 
                                                              "pat_level_with_admits.sql"))
)


#attend_pat_raw <- DBI::dbGetQuery(con,
#                                  statement = readr::read_file(paste0(path_data_load, 
#                                                                      "pat_level.sql"))
#)




#saveRDS(attend_pat_raw.rds, 'attend_pat_raw.rds')
#attend_pat_raw <- readRDS('attend_pat_raw.rds')

attend_pat <- clean_names(attend_pat_raw_ad)



# add flags and tags
attend_pat <- attend_pat |>
  mutate(acuity = case_when(ec_acuity_snomed_ct == '1077241000000103' ~ 'acuity_minor',
                            ec_acuity_snomed_ct == '1064911000000105' ~ 'acuity_resus',
                            ec_acuity_snomed_ct == '1077251000000100' ~ 'acuity_minor',
                            ec_acuity_snomed_ct == '1064891000000107' ~ 'acuity_resus',
                            ec_acuity_snomed_ct == '1064901000000108' ~ 'acuity_major',
                            .default = 'acuity_not_known'),
         travel_30 = if_else(travel_time_car < 30, 1, 0),
         weekday = isWeekday(arrival_date, wday=1:5) ,
         arrival_hr = as.integer(substr(arrival_time,1,2)),
         arrival_ooo = if_else(between(arrival_hr,9,18),0,1),
         arrival_time_consol = case_when (weekday == 0 ~ 'wkend',
                                          arrival_ooo == 1 ~ 'ooo',
                                          .default = 'open'),
         discharged = if_else(discharge_destination_snomed_ct %in% c('306689006',
                                                                     '306691003',
                                                                     '306694006',
                                                                     '306705005',
                                                                     '50861005'),
                              1,0),
         arrival_method = case_when (ec_arrival_mode_snomed_ct == '1048071000000103' ~ 'Walk',
                                     ec_arrival_mode_snomed_ct == '1048031000000100' ~ 'Ambulance',
                                     ec_arrival_mode_snomed_ct == '1048061000000105' ~ 'Walk',
                                     ec_arrival_mode_snomed_ct == '1048041000000109' ~ 'Ambulance',
                                     ec_arrival_mode_snomed_ct == '1048001000000106' ~ 'Walk',
                                     ec_arrival_mode_snomed_ct == '1048041000000109' ~ 'Ambulance',
                                     ec_arrival_mode_snomed_ct == '1048021000000102' ~ 'Walk',
                                     ec_arrival_mode_snomed_ct == '1048051000000107' ~ 'Ambulance',
                                     ec_arrival_mode_snomed_ct == '1047991000000102' ~ 'Walk',
                                     ec_arrival_mode_snomed_ct == '1048081000000101' ~ 'Ambulance',
                                     .default = 'Walk'
                                     ))

non_discharges <- attend_pat |>
  filter(discharged == 0)

########
# add AA flag
df_two <- attend_pat |>
  filter(discharged == 1) |>
  rename(
    Department_Type = ec_department_type,
    Discharge_Status = ec_discharge_status_snomed_ct,
    AttendanceCategory = ec_attendance_category,
    Arrival_Mode = ec_arrival_mode_snomed_ct,
    Investigation = der_ec_investigation_all,
    Treatment = der_ec_treatment_all
  )

### Investigations

cols <- seq(0:24)
df_three <- df_two |>
  separate_wider_delim(Investigation,  
                       delim = ",", 
                       names = c(paste0('Investigation_',cols)),
                       too_few = 'align_start')


##treatment

cols2 <- seq(0:24)
df_three <- df_three |>
  separate_wider_delim(Treatment,  
                       delim = ",", 
                       names = c(paste0('Treatment_',cols2)),
                       too_few = 'align_start')

## all columns for the look up need to be strings. which they appear to be.
isAvoidable <- calculateAvoidableEDAtt(df_three, 
                                       "Department_Type", 
                                       "Discharge_Status", 
                                       "AttendanceCategory", 
                                       "Arrival_Mode", 
                                       paste0("Investigation_", 1:24),
                                       paste0("Treatment_", 1:24),
                                       "snomed")

attend_pat <- cbind(df_three,isAvoidable)

attend_pat <- bind_rows(attend_pat,
                    non_discharges)


minor_treats <- c('182692007',
                  '88140007',
                  '392231009',
                  '430824005',
                  '103744005',
                  '182660006',
                  '386761002',
                  '427035008',
                  '27372005',
                  '18629005',
                  '266712008',
                  '226871000000103',
                  '87750000',
                  '178016006',
                  '178012008',
                  '15631002',
                  '71810007',
                  '284182000',
                  '50015006',
                  '30549001',
                  '127786006',
                  '180289009',
                  '180291001',
                  '79321009',
                  '52037006',
                  '243751002',
                  '35807001',
                  '81733005',
                  '49999004',
                  '266740003',
                  '413334001',
                  '371585000',
                  '410267000',
                  '391027005',
                  '430481008',
                  '182836005',
                  '183964008',
                  '572261000119106'
)

minor_invest <- c('27171005', 
                  '167252002',
                  '29303009',  
                  '104686004',
                  '29893006',  
                  '61911006',
                  '60170009',
                  '270982000',
                  '165320004',
                  '252167001',
                  '26958001',
                  '89659001',
                  '271232007',
                  '105000003',
                  '167036008',
                  '67900009',
                  '16254007',
                  '43396009',
                  '55235003', 
                  '397798009',
                  '35650009',
                  '62847008',
                  '108829100000101',
                  '74500006',  # PBR cat 2 starts here
                  '269874008',
                  '252375001',
                  '68793005',  
                  '26604007',
                  '3116009',    
                  '252316009',
                  '70648006',   
                  '416838001',
                  '56027003', 
                  '168338000',
                  '401294003',    
                  '30088009',
                  '16830007', 
                  '164729009',
                  '86944008',       
                  '363255004',
                  '392010000',    
                  '282096008',
                  '53115007',     
                  '168537006',
                  '179929004')



attend_pat <- attend_pat |>
  # select(starts_with('dis') | starts_with('eth') )
  mutate(across(starts_with("Treatment"),
    ~ case_when(. %in% minor_treats ~ 0,
      is.na(.) ~ 0,
      .default = 1
    ),
    .names = "{.col}_min_t_flag"
  )) |>
  mutate(across(starts_with("Investigation"),
                ~ case_when(. %in% minor_invest ~ 0,
                            is.na(.) ~ 0,
                            .default = 1
                ),
                .names = "{.col}_min_i_flag"
  )) |>
  mutate(
    cohort_score = rowSums(across(contains("_min_t_flag") | contains("_min_i_flag"))),
    resource_flag = if_else(cohort_score == 0, 1, 0),
    non_aa_resource = if_else(resource_flag == 1 & 
                                isAvoidable == FALSE & 
                                acuity == 'acuity_minor', 1, 0)
  )

###### Chief Complaint group #######

## load in the chief complaint group
ChiefComplaintGroup_Lookup <- read_csv(paste0(path_data_load, "/20240805 ChiefComplaintGroup.csv"), col_types = cols(ChiefComplaintCode = "c"))

###Utilise look up for Chief Complaint
attend_pat<- attend_pat %>% 
  left_join(ChiefComplaintGroup_Lookup, by = c("ec_chief_complaint_snomed_ct" = "ChiefComplaintCode")) 



####### Time ########

### TTT Clean

attend_pat <- attend_pat %>% rename(Time_to_Treat= ec_seen_for_treatment_time_since_arrival,
                                  Time_to_Discharge=ec_departure_time_since_arrival)


# Calculate the 95th percentile TTT
percentile_95_TTT <- quantile(attend_pat $Time_to_Treat, 0.95, na.rm = TRUE)

# remove these probable data errors in attendance
attend_pat <- filter(attend_pat ,Time_to_Treat <=percentile_95_TTT)

#Convert column to numeric
attend_pat <- attend_pat %>%
  mutate(Time_to_Treat = as.numeric(Time_to_Treat))

### TTD clean

# Calculate the 95th percentile TTD
percentile_95_TTD <- quantile(attend_pat $Time_to_Discharge, 0.95, na.rm = TRUE)

# remove these probable data errors in attendance
attend_pat <- filter(attend_pat ,Time_to_Discharge <=percentile_95_TTD)

#Convert column to numeric
attend_pat <- attend_pat %>%
  mutate(Time_to_Discharge = as.numeric(Time_to_Discharge))



### RESOURCE Clean and Calculation

attend_pat<- attend_pat%>%
  mutate(Resource_Time = Time_to_Discharge - Time_to_Treat) %>%
  select(Time_to_Treat, Resource_Time, everything())

# Calculate the 95th percentile 
percentile_95_resource<- quantile(attend_pat$Resource_Time, 0.95, na.rm = TRUE)

# remove these probable data errors in attendance
attend_pat<- filter(attend_pat,Resource_Time <=percentile_95_resource)

#Convert column to numeric
attend_pat <- attend_pat%>%
  mutate(Resource_Time = as.numeric(Resource_Time))

# remove any values which are negative as it means the discharge time was before treatment time

attend_pat <- filter (attend_pat,Resource_Time>= 0)


######### add months ago flag ######## 

#  6, 12 and 18 month flags

latest_full_mth <- ceiling_date(max(attend_pat$mth) %m-% months(1), 
                                "month") - days(1)
six_mths_ago <- ceiling_date(latest_full_mth %m-% months(6), 
                             "month") - days(1)
twelve_mths_ago <- ceiling_date(latest_full_mth %m-% months(12), 
                                "month") - days(1)
eighteen_mths_ago <- ceiling_date(latest_full_mth %m-% months(18), 
                                  "month") - days(1)

latest_full_mth_pretty <- format(latest_full_mth, '%b %y')
six_mths_ago_pretty <- format(six_mths_ago, '%b %y')
twelve_mths_ago_pretty <- format(twelve_mths_ago, '%b %y')
eighteen_mths_ago_pretty <- format(eighteen_mths_ago, '%b %y')



attend_pat<- attend_pat %>%
  mutate(mths_ago = case_when(mth > six_mths_ago ~ "a. Latest six mths",
                              mth > twelve_mths_ago ~ "b. Six to 12 mths",
                              mth > eighteen_mths_ago ~ "c.12 to 18 mths",
                              .default = "outside_18_mths"
  )) 

attend_pat <- attend_pat |>
  mutate(appropriate = if_else(isAvoidable == F & discharged == 1 & non_aa_resource == 0 ,1,0 ),
         total = 1,
         isAvoidable = is.na(isAvoidable), FALSE, isAvoidable,
         chiefcomplaintgrouping = if_else(is.na(chiefcomplaintgrouping), 'Not Specified', chiefcomplaintgrouping))

attend_pat_cln <- attend_pat |>
  select ( "chiefcomplaintgrouping",
           "mth",
           "Time_to_Treat",
           "arrival_date",
           "ec_acuity_snomed_ct",
           "ec_chief_complaint_snomed_ct",
           "site_name",
           "hospital_name",
           "Department_Type",
           "Discharge_Status",
           "AttendanceCategory",
           "arrival_week",
           "travel_time_car",
           "age_at_arrival",
           "index_of_multiple_deprivation_decile",
           "arrival_time",
           "sex",
           "ethnic_category",
           "discharge_destination_snomed_ct",
           "acuity",
           "travel_30",
           "weekday",
           "arrival_hr",
           "arrival_ooo",
           "arrival_time_consol",
           "Resource_Time",
           "discharged",
           "isAvoidable",
           "non_aa_resource",
           "appropriate",
           "total")      
