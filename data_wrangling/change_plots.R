
site<- i

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
                             "month") 
twelve_mths_ago <- ceiling_date(latest_full_mth %m-% months(12), 
                                "month") - days(1)
eighteen_mths_ago <- ceiling_date(latest_full_mth %m-% months(18), 
                                  "month")

num_days <- as.numeric(difftime(latest_full_mth,six_mths_ago,units='days'))

latest_full_mth_pretty <- format(latest_full_mth, '%b %y')
six_mths_ago_pretty <- format(six_mths_ago, '%b %y')
twelve_mths_ago_pretty <- format(twelve_mths_ago, '%b %y')
eighteen_mths_ago_pretty <- format(eighteen_mths_ago, '%b %y')

# last 6 months for site

#site <- 'TORBAY HOSPITAL'
#site <- 'THE GREAT WESTERN HOSPITAL'

sum_intro <- attend_pat_cln |>
  filter(hospital_name == site,
         #chiefcomplaintgrouping ==  chief_compl,
         arrival_date > six_mths_ago,
         arrival_date <= latest_full_mth) |>
  mutate(aa_time = if_else(isAvoidable == T, Resource_Time, 0),
         non_aa_res_time = if_else(non_aa_resource == 1, Resource_Time, 0),
         admit_time = if_else(discharged == 0, Resource_Time, 0),
         approp_time = if_else(appropriate == 1, Resource_Time, 0)) |>
  summarise(tot = n(),
            avoid_attend = sum(isAvoidable, na.rm=T),
            non_aa_res = sum(non_aa_resource, na.rm=T),
            admits = sum(if_else(discharged== 0,1,0)),
            approp = sum(appropriate, na.rm=T),
            tot_t = sum(Resource_Time),
            avoid_attend_t = sum(aa_time, na.rm=T),
            non_aa_res_t = sum(non_aa_res_time, na.rm=T),
            admits_t = sum(admit_time, na.rm=T),
            approp_t = sum(approp_time, na.rm=T),
            .by = chiefcomplaintgrouping) |>
  mutate(mean_t = non_aa_res_t / non_aa_res,
         num_divert_day = non_aa_res /  num_days,
         mean_t_day = non_aa_res_t / num_days) |>
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
         mean_t,
         num_divert_day,
         mean_t_day)


data_summary_table <-sum_intro |> 
  gt() |>
  tab_header(
    title = paste0("Type 1 walk in attendances by chief complaint: ", 
                   six_mths_ago_pretty, 
                   " to ",
                   latest_full_mth_pretty),
    subtitle = md("Split by Avoidable Attendances, Divertable Attendances, Appropriate Attendances and Admissions")
  ) |>
  tab_footnote(
    footnote = md("*Data taken from ECDS* : **NOTE** Numbers are rounded for clarity")
  ) |>
  fmt_number(
    columns = everything(),
    decimals = 0,
    sep_mark =','
  ) |>  fmt_number(
    columns = c(mean_t,num_divert_day ,mean_t_day ),
    decimals = 1,
    sep_mark =','
  ) |>
  
  data_color(
    columns = c("non_aa_res", 
                "non_aa_res_t", 
                "mean_t", 
                "num_divert_day", 
                "mean_t_day"),
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
  tab_spanner(label = "Divertable attendances \n (Total time - wait time)", columns = c(
    mean_t,
    num_divert_day,
    mean_t_day
  )) |>
  cols_label(
    chiefcomplaintgrouping = "Chief Complaint",
    tot = "Total Attendances",
    avoid_attend = "Avoidable Attendances",
    non_aa_res	 = "Divertable Attendances",
    approp = "Appropriate Attendances",
    admits = "Admissions",
    tot_t = "Total Attendances (Mins)",
    avoid_attend_t = "Avoidable Attendances (Mins)",
    non_aa_res_t	 = "Divertable Attendances (Mins)",
    approp_t = "Appropriate Attendances (Mins)",
    admits_t = "Admissions (Mins)",
    mean_t = "Mean time per divertable attendance per day",
    num_divert_day = "Mean number of divertable attendances per day",
    mean_t_day = "Mean minutes divertable attendances per day"
  ) |>
  tab_options(table.font.size =  12) |>
  tab_style(
    style = cell_borders(
      sides = c("right"),
      color = "blue",
      weight = px(1.5),
      style = "solid"
    ),
    locations = cells_body(
      columns = c(tot, tot_t)
  ))



###


flow <- DiagrammeR("
  graph LR
    Attendance(Attendance)-->Avoidable
    Attendance-->Divertible
    Attendance-->Appropriate
    Attendance-->Admission
    Avoidable-->Notes_AA(Avoidable attendances, patients not requiring an emergency attendance)
    Divertible-->Notes_DI(Patients reciving minor invesitgations and treatments that could be diverted to other services)
    Appropriate-->Notes_AP(Appropriate patients that are discharged)
    Admission-->Notes_AD(Appropriate patients that are admitted)
    
style Divertible fill:#FFB81C;
style Notes_DI fill:#FFB81C;
")





# create a filtered dataset to presentation type
# add tags for 6,12 & 18 mths




#unique(attend_pat$chiefcomplaintgrouping)

# give a tag number to all to give total attendances
#and count appropriate  attendances



filter_presentation_tag_dates <- function(data, presentation) {
  dat_sum <- data |>
    filter(
      chiefcomplaintgrouping == presentation,
      arrival_date <= latest_full_mth
    ) |>
    mutate(mths_ago = case_when(
      arrival_date > six_mths_ago ~ "a6_mths",
      arrival_date > twelve_mths_ago ~ "b12_mths",
      arrival_date > eighteen_mths_ago ~ "c18_mths",
      .default = "outside_18_mths"
    )) |>
    filter(mths_ago != "outside_18_mths")
  dat_sum
}

#dat_sum <- filter_presentation_tag_dates(attend_pat_cln, 'Trauma / musculoskeletal')
#unique(dat_sum$isAvoidable)



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
    mutate(col = if_else(hospital_name == hospital, 'blue', 'grey'),
           perc_change = if_else(perc_change> 120, 120, perc_change))
  change_sum
}
# 
# change_sum<- change_summary(attend_pat,
#                             'Trauma / musculoskeletal',
#                             'appropriate',
#                             '1',
#                             i)


change_plot <- function(data, presentation, feature, var, hospital, title) {

  change_sum <- change_summary (data, presentation, feature, var, hospital)
  
  change_sum |>
    mutate(hospital_name = if_else(hospital_name == 'BRISTOL ROYAL HOSPITAL FOR CHILDREN', 'BRISTOL CHILDREN', hospital_name),
           hospital_name = str_remove(hospital_name, 'HOSPITAL'),
           hospital_name = str_remove(hospital_name, 'THE'),
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
# change_plot(
#  data,
#  presentaion_popular_site$chiefcomplaintgrouping[1],
#  feature, val,
#  site,
#  paste0(presentaion_popular_site$chiefcomplaintgrouping[1]))



plot_change <- function(data, site, feature, val) {
  presentaion_popular_site <- presentaion_popular |>
    filter(hospital_name == site)

  a <- change_plot(
    data,
    presentaion_popular_site$chiefcomplaintgrouping[1],
    feature, val,
    site,
    paste0(presentaion_popular_site$chiefcomplaintgrouping[1])
  )

  b <- change_plot(
    data,
    presentaion_popular_site$chiefcomplaintgrouping[2],
    feature, val,
    site,
    paste0(presentaion_popular_site$chiefcomplaintgrouping[2])
  )

  c <- change_plot(
    data,
    presentaion_popular_site$chiefcomplaintgrouping[3],
    feature, val,
    site,
    paste0(presentaion_popular_site$chiefcomplaintgrouping[3])
  )

  d <- change_plot(
    data,
    presentaion_popular_site$chiefcomplaintgrouping[4],
    feature, val,
    site,
    paste0(presentaion_popular_site$chiefcomplaintgrouping[4])
  )

  e <- change_plot(
    data,
    presentaion_popular_site$chiefcomplaintgrouping[5],
    feature, val,
    site,
    paste0(presentaion_popular_site$chiefcomplaintgrouping[5])
  )

  f <- change_plot(
    data,
    presentaion_popular_site$chiefcomplaintgrouping[6],
    feature, val,
    site,
    paste0(presentaion_popular_site$chiefcomplaintgrouping[6])
  )

  plot_grid(a, b, c, d, e, f, label_y = 1, rel_heights = c(0.2, .20, .60), nrow = 2)
}

bench_da <- plot_change(attend_pat_cln, i, 'non_aa_resource', '1')
bench_aa <- plot_change(attend_pat_cln, i, 'isAvoidable', 'TRUE')
bench_ad <- plot_change(attend_pat_cln, i, 'discharged', '0')
bench_to <- plot_change(attend_pat_cln, i, 'total', '1')
bench_ap <- plot_change(attend_pat_cln, i, 'appropriate', '1')

