



#convert year column to a factor
data_time_filtered <- attend_pat %>%
  mutate(attendance_year = as.factor(attendance_year))

##box plot by year
data_time_filtered %>%
  ggplot(aes(x=attendance_year, y= Time_to_Treat, group = attendance_year,fill = attendance_year)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#005EB8","#41B6E6"))+
  
  labs(title = "Time to Treat",
       subtitle = "",
       caption = "For treatment times within the 95th Percentile to account for extreme outliers",
       x = "",  
       y = "Time to treat in minutes") +
  theme_minimal(base_size = 12)+
  theme(strip.text.x = element_text(size = 11, colour = "Black", face ="bold"))+
  theme(panel.grid.minor = element_blank())+
  theme(panel.border=element_blank())+
  theme( panel.grid.major = element_blank ())+ 
  theme(plot.title = element_text(size = 13,
                                  face = "bold",
                                  margin = margin(10,0,10,0),
                                  family = "sans"))+
  theme(axis.line = element_line(color = "grey"))+
  theme(legend.position = "")


####################
##box plot by month period#
data_time_filtered %>%
  ggplot(aes(x=mths_ago, y= Time_to_Treat, group = mths_ago,fill = mths_ago)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#005EB8","#41B6E6","#0072CE","Grey"))+
  
  labs(title = "Time to Treat",
       subtitle = "",
       caption = "For treatment times within the 95th Percentile to account for extreme outliers",
       x = "",  
       y = "Time to treat in minutes") +
  theme_minimal(base_size = 12)+
  theme(strip.text.x = element_text(size = 11, colour = "Black", face ="bold"))+
  theme(panel.grid.minor = element_blank())+
  theme(panel.border=element_blank())+
  theme( panel.grid.major = element_blank ())+ 
  theme(plot.title = element_text(size = 13,
                                  face = "bold",
                                  margin = margin(10,0,10,0),
                                  family = "sans"))+
  theme(axis.line = element_line(color = "grey"))+
  theme(legend.position = "")


# Resource Time dataframe

data_time_filtered_resource <- filter (attend_pat)

##box plot by site
data_time_filtered_resource %>%
  ggplot(aes(x=site_name, y= Resource_Time , group = site_name)) +
  geom_boxplot(fill = "#41B6E6") +
  
  labs(title = "Resource Time (Time to discharge - minus time to treatment)",
       subtitle = "",
       caption = "For treatment times within the 95th Percentile to account for extreme outliers",
       x = "",  
       y = "Time in minutes") +
  theme_minimal(base_size = 12)+
  theme(strip.text.x = element_text(size = 11, colour = "Black", face ="bold"))+
  theme(panel.grid.minor = element_blank())+
  theme(panel.border=element_blank())+
  theme( panel.grid.major = element_blank ())+ 
  theme(plot.title = element_text(size = 13,
                                  face = "bold",
                                  margin = margin(10,0,10,0),
                                  family = "sans"))+
  theme(axis.line = element_line(color = "grey"))+
  theme(axis.text.x = element_text(angle = 90))+
  theme(legend.position = "")

##box plot by site and month split - only works properly in loop
data_time_filtered_resource %>%
  ggplot(aes(x=mths_ago, y= Resource_Time , group = mths_ago,fill=mths_ago)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#005EB8","#41B6E6","#0072CE","grey"))+
  
  labs(title = "Resource Time (Time to discharge - minus time to treatment)",
       subtitle = "",
       caption = "For treatment times within the 95th Percentile to account for extreme outliers",
       x = "",  
       y = "Time in minutes") +
  theme_minimal(base_size = 12)+
  theme(strip.text.x = element_text(size = 11, colour = "Black", face ="bold"))+
  theme(panel.grid.minor = element_blank())+
  theme(panel.border=element_blank())+
  theme( panel.grid.major = element_blank ())+ 
  theme(plot.title = element_text(size = 13,
                                  face = "bold",
                                  margin = margin(10,0,10,0),
                                  family = "sans"))+
  theme(axis.line = element_line(color = "grey"))+
  theme(axis.text.x = element_text(angle = 90))+
  theme(legend.position = "")


### South West Level run chart for Resource time
data_time_resource_runchart <-  data_time_filtered_resource %>%
  group_by(arrival_week)%>%
  summarise(median(Resource_Time))

# Plot
ggplot(data_time_resource_runchart, aes(x = arrival_week, y = `median(Resource_Time)`)) +
  geom_line() +
  geom_point() +
  
  #labels and formatting
  
  labs(
    title="Median Resource time across the South West",
    x="",
    y="Time in Minutes",
    caption="Source:SUS ECDS")+
  theme_minimal(base_size = 12)+
  theme(strip.text.x = element_text(size = 12, colour = "Black", face ="bold"))+
  theme(panel.grid.minor = element_blank())+
  theme(panel.grid.major = element_blank())+
  theme(plot.title = element_text(size = 12,
                                  face = "bold",
                                  margin = margin(10,0,10,0),
                                  family = "sans"))+
  theme(axis.line = element_line(color = "grey"))+
  theme(axis.text.x = element_text(angle = 90))+
  theme(legend.position = "top")


### SPC plots

plot_obj <- ptd_spc(
  data_time_resource_runchart ,
  value_field = `median(Resource_Time)`,
  date_field = arrival_week,
    improvement_direction =  "decrease"
)


plot <- ptd_create_ggplot(
  plot_obj,
  icons_position = 'none',
  x_axis_date_format = "%b-%y",
  x_axis_breaks = "3 months",
  percentage_y_axis = FALSE,
  point_size = 4,
  y_axis_label = '',
  x_axis_label = NULL,
  main_title    = "Median Resource time"
)

plot+ 
  theme_minimal(base_size = 16)+
  #theme(strip.text.x = element_text(size = 15, colour = "Black", face ="bold"))
  theme(panel.grid.minor = element_blank())+
  theme(panel.border=element_blank())+
  theme(plot.title = element_text(size = 13,
                                  face = "bold",
                                  margin = margin(10,0,10,0),
                                  family = "sans"))+
  theme(axis.line = element_line(color = "grey"))+
  theme(axis.text.x = element_text(angle = 90))+
  theme(legend.position = "top")+
  labs(caption="Source NHSE SUS Plus Live")


### Site Level run chart for Resource time
data_time_resource_runchart_site <-  data_time_filtered_resource %>%
  group_by(site_name, arrival_week)%>%
  summarise(median(Resource_Time))


### SPC plots

plot_obj <- ptd_spc(
  data_time_resource_runchart_site,
  value_field = `median(Resource_Time)`,
  date_field = arrival_week,
  facet_field = site_name,
  improvement_direction =  "decrease"
)


plot <- ptd_create_ggplot(
  plot_obj,
  icons_position = 'none',
  x_axis_date_format = "%b-%y",
  x_axis_breaks = "3 months",
  percentage_y_axis = FALSE,
  point_size = 4,
  y_axis_label = 'Time in minutes',
  x_axis_label = "",
  main_title    = "ED attendances"
)

plot+ 
  theme_minimal(base_size = 16)+
  #theme(strip.text.x = element_text(size = 15, colour = "Black", face ="bold"))
  theme(panel.grid.minor = element_blank())+
  theme(panel.border=element_blank())+
  theme(plot.title = element_text(size = 13,
                                  face = "bold",
                                  margin = margin(10,0,10,0),
                                  family = "sans"))+
  theme(axis.line = element_line(color = "grey"))+
  theme(axis.text.x = element_text(angle = 90))+
  theme(legend.position = "top")+
  labs(caption="Source NHSE SUS Plus Live")


#######################
### Chief Complaint ###
#######################

# data complain datset

data_CC <- attend_pat

#change der month to date
data_CC$der_activity_month <- as.Date(paste0(as.character(data_CC$der_activity_month), '01'), format='%Y%m%d')


#filter out two unsuitable CC groups
data_CC <- filter(data_CC, !chiefcomplaintgrouping %in% c("See notes", "Not applicable to child terms"))

## summarise data at site level
sub_setdata_CC <- data_CC %>%
  group_by(site_name, der_activity_month, chiefcomplaintgrouping) %>%
  summarise(Total_Attendances_by_Group = n()) %>%
  group_by(site_name, der_activity_month) %>%
  mutate(Total_Attendances_Monthly = sum(Total_Attendances_by_Group)) %>%
  mutate(Percent = Total_Attendances_by_Group / Total_Attendances_Monthly*100)


## At South West Level

sub_setdata_SW_CC <- data_CC  %>%
  group_by(der_activity_month, chiefcomplaintgrouping) %>%
  summarise(Total_Attendances_by_Group = n()) %>%
  group_by( der_activity_month) %>%
  mutate(Total_Attendances_Monthly = sum(Total_Attendances_by_Group)) %>%
  mutate(Percent = Total_Attendances_by_Group / Total_Attendances_Monthly*100)


# Plot at SW level.
ggplot(sub_setdata_SW_CC, aes(x = der_activity_month, y = Percent, group = chiefcomplaintgrouping,colour=chiefcomplaintgrouping)) +
  geom_line(linewidth =1)+
  geom_point()+
  
  
  #labels and formatting
  
  labs(
    title="Chief Complaint type over time",
    x="",
    y="Percent",
    caption="Source:SUS APCS")+
  theme_minimal(base_size = 12)+
  theme(strip.text.x = element_text(size = 12, colour = "Black", face ="bold"))+
  theme(panel.grid.minor = element_blank())+
  theme(panel.grid.major = element_blank())+
  theme(plot.title = element_text(size = 12,
                                  face = "bold",
                                  margin = margin(10,0,10,0),
                                  family = "sans"))+
  theme(axis.line = element_line(color = "grey"))+
  theme(axis.text.x = element_text(angle = 90))+
  theme(legend.position = "top")



### SW SPC plots

plot_obj <- ptd_spc(
  sub_setdata_SW_CC ,
  value_field = Total_Attendances_by_Group,
  date_field = der_activity_month,
  facet_field = chiefcomplaintgrouping,
  improvement_direction =  "decrease"
)



plot <- ptd_create_ggplot(
  plot_obj,
  icons_position = 'none',
  x_axis_date_format = "%b-%y",
  x_axis_breaks = "3 months",
  percentage_y_axis = FALSE,
  point_size = 4,
  y_axis_label = 'Attendances',
  x_axis_label = NULL,
  main_title    = "Attendances by Chief Complaint Group"
)



plot+ 
  theme_minimal(base_size = 16)+
  #theme(strip.text.x = element_text(size = 15, colour = "Black", face ="bold"))
  theme(panel.grid.minor = element_blank())+
  theme(panel.border=element_blank())+
  theme(plot.title = element_text(size = 13,
                                  face = "bold",
                                  margin = margin(10,0,10,0),
                                  family = "sans"))+
  theme(axis.line = element_line(color = "grey"))+
  theme(axis.text.x = element_text(angle = 90))+
  theme(legend.position = "top")+
  labs(caption="Source: NHSE SUS Plus Live")

## At South West Level split by travel

sub_setdata_SW_CC_travel <- data_CC  %>%
  group_by(chiefcomplaintgrouping,travel_30 ) %>%
  summarise(Total_Attendances_by_Group = n()) %>%
  group_by(travel_30) %>%
  mutate(Total_Attendances_Monthly = sum(Total_Attendances_by_Group)) %>%
  mutate(Percent = Total_Attendances_by_Group / Total_Attendances_Monthly*100)

#filter out NA
sub_setdata_SW_CC_travel <- filter (sub_setdata_SW_CC_travel, !travel_30 %in% c(NA))



#### summary table
#filter to a site (just for testing)
attend_pat_ds <- filter (attend_pat,site_name == "WESTON GENERAL HOSPITAL")

#filter to latest six months
attend_pat_ds <- filter (attend_pat_ds,mths_ago == "a. Latest six mths")

# SEX


# Count occurrences of each category
sex_table <- table(attend_pat_ds$sex)
sex_proportions <- prop.table(sex_table)
sex_df <- as.data.frame(sex_proportions) 
sex_df <- sex_df %>%
  mutate(Freq = Freq * 100) %>%
  mutate(Freq = paste0(Freq, "%"))

#filter to just M&F
sex_df <- sex_df%>% filter(Var1 %in% c("1", "2"))


# Rename variables
sex_df <- sex_df %>%
  rename(sex = Var1,  # Rename VAr1 to sex
         Proportion = Freq)  # Rename Freq to Proportion

# Change numeric codes to labels (if applicable)
sex_df <- sex_df %>%
  mutate(sex= case_when(
    sex == "1" ~ "Male",
    sex == "2" ~ "Female",
    TRUE ~ sex  # Keep other values unchanged
  ))



# AGE

# Count occurrences of each category
attend_pat_ds<- attend_pat_ds %>%
mutate(Age_cat = case_when(age_at_arrival >= 0 & age_at_arrival<= 18 ~ "0-18",
                           age_at_arrival >= 19 & age_at_arrival <= 30 ~ "19-30", 
                           age_at_arrival >= 31 & age_at_arrival <= 60 ~ "31-60",
                           age_at_arrival >= 60 & age_at_arrival <= 80 ~ "61-80",
                           age_at_arrival >= 80 ~ "80+",
                           TRUE ~ NA_character_))


age_table <- table(attend_pat_ds$Age_cat)
age_proportions <- prop.table(age_table)
age_df <- as.data.frame(age_proportions) 
age_df <- age_df %>%
  mutate(Freq = Freq * 100) %>%
  mutate(Freq = paste0(Freq, "%"))

# Weekends
weekday_table <- table(attend_pat_ds$weekday)
weekday_proportions <- prop.table(weekday_table )
weekday_df <- as.data.frame(weekday_proportions) 
weekday_df <- weekday_df %>%
  mutate(Freq = Freq * 100) %>%
  mutate(Freq = paste0(Freq, "%"))

# Rename variables
weekday_df <- weekday_df%>%
  rename(Weekday = Var1,  # Rename VAr1 to sex
         Proportion = Freq)  # Rename Freq to Proportion


# Travel Distance
# Weekends
travel_table <- table(attend_pat_ds$travel_30)
travel_proportions <- prop.table(travel_table)
travel_df<- as.data.frame(travel_proportions) 
travel_df<- travel_df %>%
  mutate(Freq = Freq * 100) %>%
  mutate(Freq = paste0(Freq, "%"))


# Ethnicity


# Count occurrences of each category
ethnicCat_table <- table(attend_pat_ds$ethnic_category)
ethnicCat_proportions <- prop.table(ethnicCat_table)
ethnicCat_df <- as.data.frame(sex_proportions) 
ethnicCat_df <- ethnicCat_df %>%
  mutate(Freq = Freq * 100) %>%
  mutate(Freq = paste0(Freq, "%"))

# Rename variables
ethnicCat_df <- ethnicCat_df %>%
  rename(Ethnic_Category = Var1,  # Rename VAr1 to sex
         Proportion = Freq)  # Rename Freq to Proportion


