
# three largest attendance types per hospital

presentaion_popular <- attend_pat |>
  #filter(!!sym(feature) == var) |>
  filter(arrival_week > six_mths_ago,
         non_aa_resource == 1) |>
  summarise(
    attends = n(),
    .by = c(chiefcomplaintgrouping, hospital_name)
  ) |>
  mutate(rank = dense_rank(-attends),
         .by = hospital_name) |>
  filter(rank <= 6)


#  summary for benchmark

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

# last 6 months for site

site <- 'TORBAY HOSPITAL'
site <- 'THE GREAT WESTERN HOSPITAL'

chief_compl <- 'Trauma / musculoskeletal'





sum_intro <- attend_pat |>
  filter(hospital_name == site,
         #chiefcomplaintgrouping ==  chief_compl,
         arrival_week > six_mths_ago) |>
  mutate(aa_time = if_else(isAvoidable == T, Resource_Time, 0),
         non_aa_res_time = if_else(non_aa_resource == 1, Resource_Time, 0),
         admit_time = if_else(discharged == 0, Resource_Time, 0),
         approp_time = Resource_Time - aa_time -non_aa_res_time -  admit_time) |>
  summarise(tot = n(),
            avoid_attend = sum(isAvoidable, na.rm=T),
            non_aa_res = sum(non_aa_resource, na.rm=T),
            admits = sum(if_else(discharged== 0,1,0)),
            approp = sum(tot - non_aa_res - admits - avoid_attend),
            tot_t = sum(Resource_Time),
            avoid_attend_t = sum(aa_time, na.rm=T),
            non_aa_res_t = sum(non_aa_res_time, na.rm=T),
            admits_t = sum(admit_time, na.rm=T),
            approp_t = sum(approp_time, na.rm=T),
            .by = chiefcomplaintgrouping) |>
  mutate(mean_t = non_aa_res_t / non_aa_res) |>
  arrange(-non_aa_res) |>
  select(chiefcomplaintgrouping,
         avoid_attend,
         non_aa_res,
         approp,
         admits,
         tot,
         avoid_attend_t,
         non_aa_res_t,
         approp_t,
         admits_t,
         tot_t,
         mean_t)


sum_intro |> gt() |>
  tab_header(
    title = paste0("Type 1 walk in attendances by chief complaint: ", 
                   six_mths_ago_pretty, 
                   " to ",
                   latest_full_mth_pretty),
    subtitle = md("Split by Avoidable Attendances, Divertable Attendances, Appropriate Attendances and Admissions")
  ) |>
  tab_footnote(
    footnote = md("*Data taken from ECDS*")
  ) |>
  fmt_number(
    columns = everything(),
    decimals = 0,
    sep_mark =','
  ) |>
  data_color(
    columns = c("non_aa_res", "non_aa_res_t", "mean_t"),
    alpha = 0.5,
    palette = "#FFB81C"
  ) |>
  tab_spanner(label = "Number of attendances", columns = c(
    avoid_attend,
    non_aa_res,
    approp,
    admits,
    tot
    )) |>
  tab_spanner(label = "Time on ward (Total time - wait time)", columns = c(
    avoid_attend_t,
    non_aa_res_t,
    approp_t,
    admits_t,
    tot_t
  )) |>
  cols_label(
    chiefcomplaintgrouping = "Chief Complaint",
    tot = "Total Attendances",
    avoid_attend = "Avoidable Attendances",
    non_aa_res	 = "Divertable Attendances",
    approp = "Appropriate Attendances",
    admits = "Admissions",
    tot_t = "Total Attendances",
    avoid_attend_t = "Avoidable Attendances",
    non_aa_res_t	 = "Divertable Attendances",
    approp_t = "Appropriate Attendances",
    admits_t = "Admissions",
    mean_t = "Mean time per divertable attendance"
  ) 



###


library(DiagrammeR)
DiagrammeR("
  graph LR
    Attendance(Attendance)-->Avoidable
    Attendance-->Divertable
    Attendance-->Appropriate
    Attendance-->Admission
    Avoidable-->Notes_AA(Avoidable attendances, patients not requiring an emergency attendance)
    Divertable-->Notes_DI(Patients reciving minor invesitgations and treatments that could be diverted to other services)
    Appropriate-->Notes_AP(Appropriate patients that are discharged)
    Admission-->Notes_AD(Appropriate patients that are admitted)
    
style Divertable fill:#FFB81C;
style Notes_DI fill:#FFB81C;
")












# create a filtered dataset to presentation type
# add tags for 6,12 & 18 mths




#unique(attend_pat$chiefcomplaintgrouping)


filter_presentation_tag_dates <- function(data, presentation) {
  dat_sum <- data |>
    filter(
      chiefcomplaintgrouping == presentation,
      arrival_date <= latest_full_mth
    ) |>
    mutate(mths_ago = case_when(mth > six_mths_ago ~ "a6_mths",
      mth > twelve_mths_ago ~ "b12_mths",
      mth > eighteen_mths_ago ~ "c18_mths",
      .default = "outside_18_mths"
    )) |>
    filter(mths_ago != "outside_18_mths")
  dat_sum
}

dat_sum <- filter_presentation_tag_dates(attend_pat, 'Trauma / musculoskeletal')






# quick plot to eyeball change
# dat_sum |>
#   filter(hospital_name == 'DERRIFORD HOSPITAL') |>
#   summarise(tot_add = n(),
#             .by = mth) |>
#   ggplot(aes(x= mth, y= tot_add)) +
#   geom_line()

# function to produce change summary
change_summary <- function(data, presentation, feature, var, hospital) {
  dat_sum <- filter_presentation_tag_dates(data, presentation)

  change_sum <- dat_sum |>
    filter(!!sym(feature) == var) |>
    summarise(
      attends = n(),
      .by = c(mths_ago, hospital_name)
    ) |>
    arrange(hospital_name, mths_ago) |>
    mutate(perc_change = (attends - lead(attends, 2)) / lead(attends, 2) * 100,
      .by = hospital_name) |>
    filter(!is.na(perc_change)) |>
    mutate(col = if_else(hospital_name == hospital, 'blue', 'grey'))
  change_sum
}

# change_sum<- change_summary(attend_pat, 
#                             'Trauma / musculoskeletal', 
#                             'non_aa_resource', 
#                             '1', 
#                             'DERRIFORD HOSPITAL')

# function to produce change summary
change_summary <- function(data, presentation, feature, var, hospital) {
  dat_sum <- filter_presentation_tag_dates(data, presentation)
  
  change_sum <- dat_sum |>
    filter(!!sym(feature) == var) |>
    summarise(
      attends = n(),
      .by = c(mths_ago, hospital_name)
    ) |>
    arrange(hospital_name, mths_ago) |>
    mutate(perc_change = (attends - lead(attends, 2)) / lead(attends, 2) * 100,
           .by = hospital_name) |>
    filter(!is.na(perc_change)) |>
    mutate(col = if_else(hospital_name == hospital, 'blue', 'grey'))
  change_sum
}




change_plot <- function(data, presentation, feature, var, hospital, title) {

  change_summary (data, presentation, feature, var, hospital) |>
    mutate(hospital_name = if_else(hospital_name == 'BRISTOL ROYAL HOSPITAL FOR CHILDREN', 'BRISTOL CHILDREN', hospital_name),
           hospital_name = str_remove(hospital_name, 'HOSPITAL'),
           hospital_name = if_else(str_count(hospital_name, pattern = ' ') > 1, word(hospital_name,1,2), hospital_name)) |>
  ggplot(aes(x = perc_change, 
           y = reorder(hospital_name, 
                       perc_change), 
           fill = col)) +
  geom_col() + 
  theme_minimal() + 
  ggtitle(title) +
  theme(legend.position = 'NA') +
  ylab('') +
    xlab('Percentage change') +
    scale_x_continuous(labels = label_percent(scale = 1)) +
    labs(caption = 
           glue('Chart shows percentage change from {eighteen_mths_ago_pretty} - {twelve_mths_ago_pretty} to {six_mths_ago_pretty} - {latest_full_mth_pretty}')
    )

}

# 
# a<- change_plot(attend_pat, 
#             'General / minor / admin', 
#             'isAvoidable', 
#             'TRUE', 
#             'POOLE HOSPITAL',
#             'Change in avoidable attendances')  
# 
# b <- change_plot(attend_pat, 
#             'General / minor / admin', 
#             'non_aa_resource', 
#             '1', 
#             'POOLE HOSPITAL',
#             'Change in divertable attendances') 
# 
# plot_grid(a, b,  nrow = 1)
# 
# library(cowplot)
# 
# 
# 


plot_change <- function(site) {
presentaion_popular_site <- presentaion_popular |>
  filter(hospital_name == site)

a<- change_plot(attend_pat, 
            presentaion_popular_site$chiefcomplaintgrouping[1], 
            'non_aa_resource', 
            '1', 
            site,
            paste0(
                   presentaion_popular_site$chiefcomplaintgrouping[1])) 

b<- change_plot(attend_pat, 
            presentaion_popular_site$chiefcomplaintgrouping[2], 
            'non_aa_resource', 
            '1', 
            site,
            paste0(
                   presentaion_popular_site$chiefcomplaintgrouping[2])) 

c <- change_plot(attend_pat, 
            presentaion_popular_site$chiefcomplaintgrouping[3], 
            'non_aa_resource', 
            '1', 
            site,
            paste0(
                   presentaion_popular_site$chiefcomplaintgrouping[3])) 

d <- change_plot(attend_pat, 
            presentaion_popular_site$chiefcomplaintgrouping[4], 
            'non_aa_resource', 
            '1', 
            site,
            paste0(
                   presentaion_popular_site$chiefcomplaintgrouping[4])) 

e <- change_plot(attend_pat, 
            presentaion_popular_site$chiefcomplaintgrouping[5], 
            'non_aa_resource', 
            '1', 
            site,
            paste0(
                   presentaion_popular_site$chiefcomplaintgrouping[5])) 

f <- change_plot(attend_pat, 
            presentaion_popular_site$chiefcomplaintgrouping[6], 
            'non_aa_resource', 
            '1', 
            site,
            paste0(presentaion_popular_site$chiefcomplaintgrouping[6])) 

plot_grid(a, b, c, d, e, f, label_y = 1, rel_heights = c(0.2,.20,.60), nrow = 2)

}


plot_change('POOLE HOSPITAL')


attend_pat$tot_attend <- 1

a <- change_plot(attend_pat, 
            'Trauma / musculoskeletal', 
            'tot_attend', 
            '1', 
            'TORBAY HOSPITAL',
            'Change in resource attendances') 

b <- change_summary(attend_pat, 
               'Trauma / musculoskeletal', 
               'tot_attend', 
               '1', 
               'TORBAY HOSPITAL') 

c <- change_plot(attend_pat, 
            'Gastrointestinal', 
            'tot_attend', 
            '1', 
            'WESTON GENERAL HOSPITAL',
            'Change in avoidable attendances') 

plot_grid(a, a, a, a, nrow = 1)


change_plot(attend_pat, 
            '82271004', 
            'discharged', 
            '0', 
            'DERRIFORD HOSPITAL',
            'Change in admissions') 



discharged == 0


library(cowplot)


a <- change_plot(attend_pat, 
            '82271004', 
            'non_aa_resource', 
            '1', 
            'DERRIFORD HOSPITAL',
            'Change in resource attendances') 


b <- change_plot(attend_pat, 
            '82271004', 
            'isAvoidable', 
            'TRUE', 
            'DERRIFORD HOSPITAL',
            'Change in avoidable attendances') 

c <- change_plot(attend_pat, 
            '82271004', 
            'discharged', 
            '0', 
            'DERRIFORD HOSPITAL',
            'Change in admissions') 

plot_grid(a, b, c, nrow = 1)



  change_summary(attend_pat, 
                 '82271004', 
                 'non_aa_resource', 
                 '1', 
                 'DERRIFORD HOSPITAL')  |>
    ggplot(aes(x = perc_change, 
               y = reorder(hospital_name, 
                           perc_change), 
               fill = col)) +
    geom_col() + 
    theme_minimal() + 
    ggtitle('title monkey') +
    theme(legend.position = 'NA') +
    ylab('')
  
  
  
  
total_attend <- dat_sum |>
  summarise(attends = n(),
            .by = c(mths_ago, hospital_name)) |>
  arrange(hospital_name, mths_ago) |>
  mutate(perc_change = PercChange(data = ., Var = attends, GroupVar = hospital_name, slideBy = -1))



sum_12 <-change(data = total_attend, Var = 'attends', 
                GroupVar = 'hospital_name', slideBy = 2, type = 'percent', NewVar = 'perc_change_12')

sum_12 <- sum_12 |>
  filter(!is.na(perc_change_12)) |>
  mutate(col = if_else(hospital_name == org_code, 'blue', 'grey'))

sum_12 |> ggplot(aes(x = perc_change_12, y = reorder(hospital_name, perc_change_12), fill = col)) +
  geom_col(fill = col) + theme_minimal() + ggtitle('6 ')


#################

dat_sum <- dat_sum |>
  mutate(hospital_name = str_remove(hospital_name, 'HOSPITAL'))

org_code <- str_remove(org_code, 'HOSPITAL')    

total_attend_aa <- dat_sum |>
  filter(isAvoidable == TRUE) |>
  summarise(attends = n(),
            .by = c(mths_ago, hospital_name)) |>
  arrange(hospital_name, mths_ago) 

sum_12 <-change(data = total_attend_aa, Var = 'attends', 
                GroupVar = 'hospital_name', slideBy = 2, type = 'percent', NewVar = 'perc_change_12')

sum_12 <- sum_12 |>
  filter(!is.na(perc_change_12)) |>
  mutate(col = if_else(hospital_name == org_code, 'blue', 'grey'))

p_aa<- sum_12 |> ggplot(aes(x = perc_change_12, y = reorder(hospital_name, perc_change_12), fill = col)) +
  geom_col() + theme_minimal() + ggtitle('Avoidable attendances ')+
  theme(legend.position = 'NA') +
  ylab('')

####################



total_attend_resource <- dat_sum |>
  filter(non_aa_resource == 1) |>
  summarise(attends = n(),
            .by = c(mths_ago, hospital_name)) |>
  arrange(hospital_name, mths_ago) 

sum_12 <-change(data = total_attend_resource, Var = 'attends', 
                GroupVar = 'hospital_name', slideBy = 2, type = 'percent', NewVar = 'perc_change_12')

sum_12 <- sum_12 |>
  filter(!is.na(perc_change_12)) |>
  mutate(col = if_else(hospital_name == org_code, 'blue', 'grey'))

p_res <- sum_12 |> ggplot(aes(x = perc_change_12, y = reorder(hospital_name, perc_change_12), fill = col)) +
  geom_col() + theme_minimal() + ggtitle('Resource ')+
  theme(legend.position = 'NA') +
  ylab('')

################


total_attend_admit <- dat_sum |>
  filter(discharged == 0) |>
  summarise(attends = n(),
            .by = c(mths_ago, hospital_name)) |>
  arrange(hospital_name, mths_ago) 

sum_12a <- total_attend_admit |>
  mutate(per_change = (attends - lead(attends,2))/lead(attends,2 ) * 100,
         .by = hospital_name)


sum_12 <- sum_12 |>
  filter(!is.na(perc_change_12)) |>
  mutate(col = if_else(hospital_name == org_code, 'blue', 'grey'))

p_ad<- sum_12 |> ggplot(aes(x = perc_change_12, 
                            y = reorder(hospital_name, 
                                        perc_change_12), 
                            fill = col)) +
  geom_col() + 
  theme_minimal() + 
  ggtitle('Admissions') +
  theme(legend.position = 'NA') +
  ylab('')

library(cowplot)


plot_grid(p_aa, p_res, p_ad, nrow = 1)


#############################

# acuity

total_attend_acu <- dat_sum |>
  #filter(acuity == 'acuity_minor') |>
  summarise(attends = n(),
            .by = c(mths_ago, hospital_name, acuity)) |>
  arrange(hospital_name, mths_ago) |>
  mutate(per_change = (attends - lead(attends,2))/lead(attends,2 ) * 100,
         .by = c(hospital_name, acuity))



