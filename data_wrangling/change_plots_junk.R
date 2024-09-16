# change plot junk


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



