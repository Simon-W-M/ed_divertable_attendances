#clustering


# filter data

clust_data_filter <- function (data, site, present) {
  data <- data |>
    filter (site_name == site  ,
            #chiefcomplaintgrouping == present ,
    #zzz        non_aa_resource == 1,
            acuity == 'acuity_minor') |>
    mutate(age_group = case_when (age_at_arrival < 19 ~ '0-18',
                                  age_at_arrival < 46 ~ '19-45',
                                  age_at_arrival < 66 ~ '45-65',
                                  age_at_arrival < 86 ~ '66-85',
                                  age_at_arrival < 106 ~ '86 +',
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
    select(age_group,
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

##filtered_data <- clust_data_filter(attend_pat,
  #                                 'ROYAL DEVON & EXETER HOSPITAL (WONFORD)',
  #                                 'Trauma / musculoskeletal') |>
 #   distinct(.keep_all = TRUE)

filtered_data <- clust_data_filter(attend_pat,
                                   'TORBAY HOSPITAL',
                                   '127279002') |>
  distinct(.keep_all = TRUE)


filtered_sum2 <- filtered_data |>
  mutate(age_count = 1) |>
  pivot_wider(names_from = c(age_group), values_from = age_count) |>
  mutate(arriv_count = 1) |>
  pivot_wider(names_from = c(arrival_time_consol), values_from = arriv_count) |>
  mutate(trav_count = 1) |>
  pivot_wider(names_from = c(travel_30), 
              values_from = trav_count,
              names_prefix = "trav_count_") |>
  summarise(across(everything(),
                   ~sum(., na.rm= T)))

a <- bind_rows(filtered_sum2, filtered_sum)

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

k_clusters <- 7


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
                ~ round(sum(. / tot)*100,1),
                .names = "perc_{.col}")) |>
  arrange(-tot)

library(tidymodels)


filtered_data <- clust_data_filter(attend_pat,
                                   'DERRIFORD HOSPITAL',
                                   '127279002') |>
  distinct(.keep_all = TRUE)



# convert to data.table so that things are faster
filtered_data <- as.data.table(filtered_data)

# one hot encode features
filtered_data <- one_hot(filtered_data)

filtered_data <- filtered_data |>
  mutate(arrival_time_consol_ooo = as.factor(arrival_time_consol_ooo))


iris_split <- initial_split(select(filtered_data, -pat_id))

iris_split %>%
  training() %>%
  glimpse()


iris_recipe <- training(iris_split) %>%
  recipe(arrival_time_consol_ooo ~.) %>%
  step_corr(all_predictors()) %>%
  step_center(all_predictors(), -all_outcomes()) %>%
  step_scale(all_predictors(), -all_outcomes()) %>%
  prep()

iris_testing <- iris_recipe %>%
  bake(testing(iris_split)) 


glimpse(iris_testing)


iris_training <- juice(iris_recipe)

glimpse(iris_training)


iris_ranger <- rand_forest(trees = 100, mode = "classification") %>%
  set_engine("ranger") %>%
  fit(arrival_time_consol_ooo ~ ., data = iris_training)


predict(iris_ranger, iris_testing)


iris_ranger %>%
  predict(iris_testing) %>%
  bind_cols(iris_testing) %>%
  glimpse()