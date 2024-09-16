#clustering
site <- i
# filter data

library(gtExtras)

clust_data_filter <- function (data, site, chief_com) {
  data <- data |>
    filter (site_name == site,
            chiefcomplaintgrouping == chief_com,
            arrival_date > six_mths_ago,
            arrival_date <= latest_full_mth) |>
    mutate(age_group = case_when (age_at_arrival < 19 ~ '0-18',
                                  age_at_arrival < 46 ~ '19-45',
                                  age_at_arrival < 66 ~ '45-65',
                                  age_at_arrival < 86 ~ '66-85',
                                  age_at_arrival < 1000 ~ '86 +',
                                  .default = 'NA'),
           travel_30 = if_else(is.na(travel_30), 2, travel_30),
           imd_quint = case_when(index_of_multiple_deprivation_decile %in% c('1', '2') ~ '1-2',
                                 index_of_multiple_deprivation_decile %in% c('3', '4') ~ '3-4',
                                 index_of_multiple_deprivation_decile %in% c('5', '6') ~ '5-6',
                                 index_of_multiple_deprivation_decile %in% c('7', '8') ~ '7-8',
                                 index_of_multiple_deprivation_decile %in% c('9', '10') ~ '9-10',
                                 .default = 'NK')) |>
          # Investigation_1 = if_else(is.na(Investigation_1),'0', Investigation_1),
          # Treatment_1 = if_else(is.na(Treatment_1),'0', Treatment_1)) |>
    select(non_aa_resource,
           age_group,
           #imd_quint,
           #sex,
           travel_30,
          # chiefcomplaintgrouping,
           #Investigation_1,
          #Treatment_1,
          arrival_time_consol) |>
    mutate (across(everything(),
                                 ~  as.factor(.),
                                 .names = "{.col}")) |>
    mutate(pat_id = row_number())

  data}

chief_compaints_list <- presentaion_popular$chiefcomplaintgrouping[presentaion_popular$hospital_name == i]



table_cluster <- function(chief_com) {


filtered_data <- clust_data_filter(attend_pat_cln,
                                   i,
                                   chief_com) |>
  distinct(.keep_all = TRUE)


overall_sum <- filtered_data |>
  mutate(age_count = 1) |>
  pivot_wider(names_from = c(age_group), values_from = age_count) |>
  mutate(arriv_count = 1) |>
  pivot_wider(names_from = c(arrival_time_consol), values_from = arriv_count) |>
  mutate(non_aa_count = 1) |>
  pivot_wider(names_from = c(non_aa_resource), 
              values_from = non_aa_count,
              names_prefix = "non_aa_resource_") |>
  mutate(trav_count = 1) |>
  pivot_wider(names_from = c(travel_30), 
              values_from = trav_count,
              names_prefix = "trav_count_") |>
  #mutate(imd_count = 1) |>
  # pivot_wider(names_from = c(imd_quint), 
  #             values_from = imd_count,
  #             names_prefix = "imd_count_") |>
  # mutate(sex_count = 1) |>
  # pivot_wider(names_from = c(sex), 
  #             values_from = sex_count,
  #             names_prefix = "sex_count_") |>
  select(-c(pat_id, non_aa_resource_0, non_aa_resource_1, non_aa_resource_NA)) |>
  summarise(across(everything(),
                   ~sum(., na.rm= T))) |>
  mutate(tot = ooo + open + wkend) |>
  mutate (across(everything(),
                    ~sum(. /tot, na.rm= T),
                 .names ="perc_{.col}")) |>
  select(-perc_tot)


divert_sum <- filtered_data |>
  filter(non_aa_resource == 1) |>
  mutate(age_count = 1) |>
  pivot_wider(names_from = c(age_group), values_from = age_count) |>
  mutate(arriv_count = 1) |>
  pivot_wider(names_from = c(arrival_time_consol), values_from = arriv_count) |>
  mutate(non_aa_count = 1) |>
  pivot_wider(names_from = c(non_aa_resource), 
              values_from = non_aa_count,
              names_prefix = "non_aa_resource_") |>
  mutate(trav_count = 1) |>
  pivot_wider(names_from = c(travel_30), 
              values_from = trav_count,
              names_prefix = "trav_count_") |>
  #mutate(imd_count = 1) |>
  # pivot_wider(names_from = c(imd_quint), 
  #             values_from = imd_count,
  #             names_prefix = "imd_count_") |>
  # mutate(sex_count = 1) |>
  # pivot_wider(names_from = c(sex), 
  #             values_from = sex_count,
  #             names_prefix = "sex_count_") |>
  select(-c(pat_id,non_aa_resource_1)) |>
  summarise(across(everything(),
                   ~sum(., na.rm= T))) |>
  mutate(tot = ooo + open + wkend) |>
  mutate (across(everything(),
                 ~sum(. /tot, na.rm= T),
                 .names ="perc_{.col}")) |>
  select(-perc_tot)


#################
#clustering bit #
#################

# remove_non divertable
filtered_data <- filtered_data |>
  filter(non_aa_resource == 1) |>
  select(-non_aa_resource)

# convert to data.table so that things are faster
filtered_data <- as.data.table(filtered_data)

# one hot encode features
filtered_data <- one_hot(filtered_data)

# calculate distance
d_dist <- daisy(filtered_data, 
                metric = "gower", 
                warnType = FALSE)

# hierarchical clustering
hc <- hclust(d_dist, 
             method = "complete")

k_clusters <- 3


# cut tree to k clusters (5)
cluster <- cutree(hc, 
                  k=k_clusters)

# add the columns with cluster info back into the main dataset
data <- cbind(filtered_data, 
              as.factor(cluster))


# create summary data per cluster
res_sum <- data |>
  dplyr::select(-pat_id) |>
  group_by(V2) |>
  mutate(tot = as.character(n())) |>
  group_by(V2, tot) |>
  summarise(across(where(is.numeric), ~ sum(.x, na.rm = TRUE))) |>
  mutate(tot = as.numeric(tot)) |>
  mutate(across(where(is.integer),
                ~ round(sum(. / tot),1),
                .names = "perc_{.col}")) |>
  arrange(-tot) |>
  ungroup() |>
  select(-V2)

res_sum <- res_sum |>
  rename(tot = 'tot',
         '0-18' = `age_group_0-18`,
         '19-45' = `age_group_19-45`,
         '45-65' = `age_group_45-65`,
         '66-85' = `age_group_66-85`,
         '86 +' = `age_group_86 +`,
         'wkend' = `arrival_time_consol_wkend`,
         'open' = `arrival_time_consol_open`,
         'ooo' = `arrival_time_consol_ooo`,
         'trav_count_0' = `travel_30_0`,
         'trav_count_1' = `travel_30_1`,
         'trav_count_2' = `travel_30_2`,
         'perc_0-18' = `perc_age_group_0-18`,
         'perc_19-45' = `perc_age_group_19-45`,
         'perc_45-65' = `perc_age_group_45-65`,
         'perc_66-85' = `perc_age_group_66-85`,
         'perc_86 +' = `perc_age_group_86 +`,
         'perc_wkend' = `perc_arrival_time_consol_wkend`,
         'perc_open' = `perc_arrival_time_consol_open`,
         'perc_ooo' = `perc_arrival_time_consol_ooo`,
         'perc_trav_count_0' = `perc_travel_30_0`,
         'perc_trav_count_1' = `perc_travel_30_1`,
         'perc_trav_count_2' = `perc_travel_30_2`,
         )

gran_tab <- bind_rows(overall_sum,
                      divert_sum,
                      res_sum) |>
  mutate(`xperc_0-18_c` = `perc_0-18` *100,
         `xperc_19-45_c` = `perc_19-45`*100,
         `xperc_45-65_c` = `perc_45-65`*100,
         `xperc_66-85_c` = `perc_66-85` *100,
         `xperc_86 +_c` = `perc_86 +`*100,
         `xperc_open_c` = `perc_open`*100,
         `xperc_ooo_c` = `perc_ooo`*100 ,
         `xperc_wkend_c` = `perc_wkend`*100,
         `xperc_trav_count_0_c` = `perc_trav_count_0`*100,
         `xperc_trav_count_1_c` = `perc_trav_count_1`*100,
         `xperc_trav_count_2_c` = `perc_trav_count_2` *100 ) |> 
  select(tot,
         '0-18',
         'perc_0-18',
         'xperc_0-18_c',
         '19-45',
         'perc_19-45',
         'xperc_19-45_c',
         '45-65',
         'perc_45-65',
         'xperc_45-65_c',
         '66-85',
         'perc_66-85' ,
         'xperc_66-85_c' ,
         '86 +',
         'perc_86 +',
         'xperc_86 +_c',
         'open',
         'perc_open',
         'xperc_open_c',
         'ooo',
         'perc_ooo' ,
         'xperc_ooo_c' ,
         'wkend',
         'perc_wkend',
         'xperc_wkend_c',
         'trav_count_0',
         'perc_trav_count_0',
         'xperc_trav_count_0_c',
         'trav_count_1',
         'perc_trav_count_1',
         'xperc_trav_count_1_c',
         'trav_count_2',
         'perc_trav_count_2',
         'xperc_trav_count_2_c'  ) 

groups_com <- c('Total across all attendance types for comparison',
                'Total for divertable attendances',
                'Cluster groups for divertable attendances to identify correlations',
                'Cluster groups for divertable attendances to identify correlations',
                'Cluster groups for divertable attendances to identify correlations')

groups_com <- data.frame(groups_com)

gran_tab <- bind_cols(groups_com, gran_tab)

gran_tab
}



create_cluster_table <- function(chief_com){
  
  gran_tab <- table_cluster(chief_com)   
  
table_clust <- gran_tab |>
  gt(groupname_col = 'groups_com') |>
  fmt_percent(
    columns = starts_with('perc'),
    decimals = 1
    ) |>
  cols_merge(
    columns = c(`0-18`, 
                `perc_0-18`),
    pattern = "{2} ({1})") |>
  gt_plt_bar_pct(
    column = `xperc_0-18_c`, 
    scaled = TRUE,
    fill = "#005EB8", 
    background = "#E8EDEE"
  ) |>
  cols_merge(
    columns = c(`19-45`, 
                `perc_19-45`),
    pattern = "{2} ({1})") |>
  gt_plt_bar_pct(
    column = `xperc_19-45_c`, 
    scaled = TRUE,
    fill = "#005EB8", 
    background = "#E8EDEE"
  ) |>
  cols_merge(
    columns = c(`45-65`, 
                `perc_45-65`),
    pattern = "{2} ({1})") |>
  gt_plt_bar_pct(
    column = `xperc_45-65_c`, 
    scaled = TRUE,
    fill = "#005EB8", 
    background = "#E8EDEE"
  ) |>
  cols_merge(
    columns = c(`66-85`, 
                `perc_66-85`),
    pattern = "{2} ({1})") |>
  gt_plt_bar_pct(
    column = `xperc_66-85_c`, 
    scaled = TRUE,
    fill = "#005EB8", 
    background = "#E8EDEE"
  ) |>
  cols_merge(
    columns = c(`86 +`, 
                `perc_86 +`),
    pattern = "{2} ({1})") |>
  gt_plt_bar_pct(
    column = `xperc_86 +_c`, 
    scaled = TRUE,
    fill = "#005EB8", 
    background = "#E8EDEE"
  ) |>
  cols_merge(
    columns = c(`open`, 
                `perc_open`),
    pattern = "{2} ({1})") |>
  gt_plt_bar_pct(
    column = `xperc_open_c`, 
    scaled = TRUE,
    fill = "#ED8B00", 
    background = "#E8EDEE"
  ) |>
  cols_merge(
    columns = c(`ooo`, 
                `perc_ooo`),
    pattern = "{2} ({1})") |>
  gt_plt_bar_pct(
    column = `xperc_ooo_c`, 
    scaled = TRUE,
    fill = "#ED8B00", 
    background = "#E8EDEE"
  ) |>
  cols_merge(
    columns = c(`wkend`, 
                `perc_wkend`),
    pattern = "{2} ({1})") |>
  gt_plt_bar_pct(
    column = `xperc_wkend_c`, 
    scaled = TRUE,
    fill = "#ED8B00", 
    background = "#E8EDEE"
  ) |>
  cols_merge(
    columns = c(`trav_count_0`, 
                `perc_trav_count_0`),
    pattern = "{2} ({1})") |>
  gt_plt_bar_pct(
    column = `xperc_trav_count_0_c`, 
    scaled = TRUE,
    fill = "#009639", 
    background = "#E8EDEE"
  ) |>
  cols_merge(
    columns = c(`trav_count_1`, 
                `perc_trav_count_1`),
    pattern = "{2} ({1})") |>
  gt_plt_bar_pct(
    column = `xperc_trav_count_1_c`, 
    scaled = TRUE,
    fill = "#009639", 
    background = "#E8EDEE"
  ) |>
  cols_merge(
    columns = c(`trav_count_2`, 
                `perc_trav_count_2`),
    pattern = "{2} ({1})") |>
  gt_plt_bar_pct(
    column = `xperc_trav_count_2_c`, 
    scaled = TRUE,
    fill = "#009639", 
    background = "#E8EDEE"
  )  |>
  tab_spanner(
    label =  md('**Travel Time to Hospital**'),
    columns = contains('trav')
  ) |>
  tab_spanner(
    label =  md('**Arrival Time at Hospital**'),
    columns = c('open',
                'perc_open',
                'xperc_open_c',
                'ooo',
                'perc_ooo' ,
                'xperc_ooo_c' ,
                'wkend',
                'perc_wkend',
                'xperc_wkend_c')
  ) |>
  tab_spanner(
    label =  md('**Age Group of Patient**'),
    columns = c( '0-18',
                 'perc_0-18',
                 'xperc_0-18_c',
                 '19-45',
                 'perc_19-45',
                 'xperc_19-45_c',
                 '45-65',
                 'perc_45-65',
                 'xperc_45-65_c',
                 '66-85',
                 'perc_66-85' ,
                 'xperc_66-85_c' ,
                 '86 +',
                 'perc_86 +',
                 'xperc_86 +_c')
  ) |>
  tab_style(
    style = cell_borders(
      sides = c("right"),
      color = "blue",
      weight = px(2),
      style = "solid"
    ),
    locations = cells_body(
      columns = c(`xperc_86 +_c`, `xperc_wkend_c`)
    )) |>

  cols_label(
    tot = "Total",
    `xperc_0-18_c` = "Chart",
    `xperc_19-45_c`= "Chart",
    `xperc_45-65_c`= "Chart",
    `xperc_66-85_c` = "Chart",
    `xperc_86 +_c`= "Chart",
    `open` = "Wkday 9am - 6pm",
    `xperc_open_c`= "Chart",
    `ooo` = "Wkday Ouside Hrs",
    `xperc_ooo_c` = "Chart",
    `wkend` = "Weekend",
    `xperc_wkend_c`= "Chart",
    `trav_count_0` = "Under 30 mins",
    `xperc_trav_count_0_c`= "Chart",
    `trav_count_1` = "Over 30 mins",
    `xperc_trav_count_1_c`= "Chart",
    `trav_count_2` = "Unknown",
    `45-65` = "46-65",
    `xperc_trav_count_2_c`  = "Chart") |>
  tab_style(
    style = list(
      cell_fill(color = "lightgrey")
    ),
    locations = cells_body(
      rows = (2)
    )
  ) |> tab_style(
    style = list(
      cell_fill(color = "#DADEDF")
    ),
    locations = cells_body(
      rows = (3:5)
    )
  ) |>
  # add title
  tab_header(
    title = paste0("Cluster analysis of divertable attendances"),
    subtitle = md("Shows benchmark of all attendance types, the entire cohort and then clustered breakdowns")
  ) |>
  tab_footnote(
    footnote = md("*Data taken from ECDS*")
  ) |>
  tab_options(table.font.size =  12) 

table_clust

}


#create_cluster_table(chief_compaints_list[1]) 

#tst <- chief_compaints_list[1]

comments <- function(complaint)  {

comment <- table_cluster(complaint)   

comment <- comment |>
  tail(3)

comment_no_tot <- comment |>
  select (-c(tot, groups_com)) 

comment_no_tot <- comment_no_tot[1,]

comm <- comment_no_tot |>
  select(-contains('perc')) |>
  pivot_longer(everything()) |>
  arrange(-value)

comm <- comm |>
  mutate(comment = case_when (name == 'trav_count_1' ~ 'live more than 30 minutes travel time away',
                           name == 'trav_count_0' ~ 'live less than 30 minutes travel time away',
                           name == 'trav_count_2' ~ 'travel time is not known',
                           name == '0-18' ~ 'are children (0-18)',
                           name == '19-45' ~ 'are young adults (19-45)',
                           name == '45-65' ~ 'are older adults (46-65)',
                           name == '66-85' ~ 'are older people (66-85)',
                           name == '86 +' ~ 'are older people (86+)',
                           name == 'open' ~ 'arrive Monday / Friday  9am to 6pm',
                           name == 'ooo' ~ 'arrive Monday / Friday  outside of 9am to 6pm',
                           name == 'wkend' ~ 'arrive at the weekend',
                           .default = 'error'))

comment_one <- glue('The largest cluster of this cohort is made of **{comment$tot[1]}** patients who strongest feature is that they **{comm$comment[1]}** and that they **{comm$comment[2]}** and **{comm$comment[3]}**. ')

comment <- comment |>
  tail(3)

comment_no_tot <- comment |>
  select (-c(tot, groups_com)) 

comment_no_tot <- comment_no_tot[2,]

comm <- comment_no_tot |>
  select(-contains('perc')) |>
  pivot_longer(everything()) |>
  arrange(-value)

comm <- comm |>
  mutate(comment = case_when (name == 'trav_count_1' ~ 'live more than 30 minutes travel time away',
                              name == 'trav_count_0' ~ 'live less than 30 minutes travel time away',
                              name == 'trav_count_2' ~ 'travel time is not known',
                              name == '0-18' ~ 'are children (0-18)',
                              name == '19-45' ~ 'are young adults (19-45)',
                              name == '45-65' ~ 'are older adults (46-65)',
                              name == '66-85' ~ 'are older people (66-85)',
                              name == '86 +' ~ 'are older people (86+)',
                              name == 'open' ~ 'arrive Monday / Friday  9am to 6pm',
                              name == 'ooo' ~ 'arrive Monday / Friday  outside of 9am to 6pm',
                              name == 'wkend' ~ 'arrive at the weekend',
                              .default = 'error'))

comment_two <- glue('The second largest cluster of this cohort is made of **{comment$tot[2]}** patients who strongest feature is that they **{comm$comment[1]}** and that they **{comm$comment[2]}** and **{comm$comment[3]}**. ')

comment <- comment |>
  tail(3)

comment_no_tot <- comment |>
  select (-c(tot, groups_com)) 

comment_no_tot <- comment_no_tot[3,]

comm <- comment_no_tot |>
  select(-contains('perc')) |>
  pivot_longer(everything()) |>
  arrange(-value)

comm <- comm |>
  mutate(comment = case_when (name == 'trav_count_1' ~ 'live more than 30 minutes travel time away',
                              name == 'trav_count_0' ~ 'live less than 30 minutes travel time away',
                              name == 'trav_count_2' ~ 'travel time is not known',
                              name == '0-18' ~ 'are children (0-18)',
                              name == '19-45' ~ 'are young adults (19-45)',
                              name == '45-65' ~ 'are older adults (46-65)',
                              name == '66-85' ~ 'are older people (66-85)',
                              name == '86 +' ~ 'are older people (86+)',
                              name == 'open' ~ 'arrive Monday / Friday  9am to 6pm',
                              name == 'ooo' ~ 'arrive Monday / Friday  outside of 9am to 6pm',
                              name == 'wkend' ~ 'arrive at the weekend',
                              .default = 'error'))

comment_three <- glue('The final cluster of this cohort is made of **{comment$tot[3]}** patients who strongest feature is that they **{comm$comment[1]}** and that they **{comm$comment[2]}** and **{comm$comment[3]}**. ')

comb_com <- c(comment_one, comment_two, comment_three)

comb_com
}

comments(chief_compaints_list[1])

# 
# 
# 
# library(tidymodels)
# 
# filtered_data <- clust_data_filter(attend_pat,
#                                    'DERRIFORD HOSPITAL',
#                                    '127279002') |>
#   distinct(.keep_all = TRUE)
# 
# 
# 
# # convert to data.table so that things are faster
# filtered_data <- as.data.table(filtered_data)
# 
# # one hot encode features
# filtered_data <- one_hot(filtered_data)
# 
# filtered_data <- filtered_data |>
#   mutate(arrival_time_consol_ooo = as.factor(arrival_time_consol_ooo))
# 
# 
# iris_split <- initial_split(select(filtered_data, -pat_id))
# 
# iris_split %>%
#   training() %>%
#   glimpse()
# 
# iris_recipe <- training(iris_split) %>%
#   recipe(arrival_time_consol_ooo ~.) %>%
#   step_corr(all_predictors()) %>%
#   step_center(all_predictors(), -all_outcomes()) %>%
#   step_scale(all_predictors(), -all_outcomes()) %>%
#   prep()
# 
# iris_testing <- iris_recipe %>%
#   bake(testing(iris_split)) 
# 
# glimpse(iris_testing)
# 
# iris_training <- juice(iris_recipe)
# 
# glimpse(iris_training)
# 
# iris_ranger <- rand_forest(trees = 100, mode = "classification") %>%
#   set_engine("ranger") %>%
#   fit(arrival_time_consol_ooo ~ ., data = iris_training)
# 
# predict(iris_ranger, iris_testing)
# 
# iris_ranger %>%
#   predict(iris_testing) %>%
#   bind_cols(iris_testing) %>%
#   glimpse()