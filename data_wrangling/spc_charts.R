
# Resource Time dataframe

data_time_filtered_resource <- attend_pat |>
  filter(non_aa_resource == 1)


#tidy hospital name
data_time_filtered_resource <- data_time_filtered_resource %>%
  mutate(colour = if_else(hospital_name  == site, 0, 1),
         hospital_name = str_remove(hospital_name,'THE '),
    hospital_name = if_else(hospital_name == 'BRISTOL ROYAL HOSPITAL FOR CHILDREN', 'BRISTOL CHILDREN', hospital_name),
         hospital_name = str_remove(hospital_name, 'HOSPITAL'),
         hospital_name = if_else(str_count(hospital_name, pattern = ' ') > 1, word(hospital_name,1,2), hospital_name))



#si version
boxplot_allsites <- data_time_filtered_resource %>%
  ggplot(aes(x=reorder(hospital_name, -Resource_Time, na.rm = T), y= Resource_Time , group = site_name, fill = colour)) +
  geom_boxplot(outlier.shape=NA) +
  
  labs(title = "Resource Time (Time to discharge - minus time to treatment)",
       subtitle = "",
       caption = "For resource times outliers beyond 4th quartile have been removed.",
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


# 
# 
# ##box plot by site
# boxplot_allsites <- data_time_filtered_resource %>%
#   ggplot(aes(x=hospital_name, y= Resource_Time , group = site_name)) +
#   geom_boxplot(fill = "#41B6E6") +
#   
#   labs(title = "Resource Time (Time to discharge - minus time to treatment)",
#        subtitle = "",
#        caption = "For resource times within the 95th Percentile to account for extreme outliers",
#        x = "",  
#        y = "Time in minutes") +
#   theme_minimal(base_size = 12)+
#   theme(strip.text.x = element_text(size = 11, colour = "Black", face ="bold"))+
#   theme(panel.grid.minor = element_blank())+
#   theme(panel.border=element_blank())+
#   theme( panel.grid.major = element_blank ())+ 
#   theme(plot.title = element_text(size = 13,
#                                   face = "bold",
#                                   margin = margin(10,0,10,0),
#                                   family = "sans"))+
#   theme(axis.line = element_line(color = "grey"))+
#   theme(axis.text.x = element_text(angle = 90))+
#   theme(legend.position = "")


# filter for site

data_time_filtered_resource <- data_time_filtered_resource %>%
  filter(site_name == i) 

##box plot by site and month split - only works properly in loop
boxplot_month <- data_time_filtered_resource %>%
  ggplot(aes(x=mths_ago, y= Resource_Time , group = mths_ago,fill=mths_ago)) +
  geom_boxplot() +
  scale_fill_manual(values = c("#005EB8","#41B6E6","#0072CE","grey"))+
  
  labs(title = "Resource Time (Time to discharge - minus time to treatment)",
       subtitle = "",
       caption = "For resource times within the 95th Percentile to account for extreme outliers",
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


### Site level SPC chart for resource time

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


plot_SPC_Resource_Median <- ptd_create_ggplot(
  plot_obj,
  icons_position = 'none',
  x_axis_date_format = "%b-%y",
  x_axis_breaks = "3 months",
  percentage_y_axis = FALSE,
  point_size = 4,
  y_axis_label = 'Time in minutes',
  x_axis_label = "",
  main_title    = "Median Resource Time"
)

plot_SPC_Resource_Median <- plot_SPC_Resource_Median+ 
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
  labs(caption="")


#######################
### Chief Complaint ###
#######################

# data complain datset
data_CC <- attend_pat |>
  filter(non_aa_resource == 1,
         arrival_date <=  latest_full_mth,
         chiefcomplaintgrouping %in% chief_compaints_list)

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


# filter for site
sub_setdata_CC <- sub_setdata_CC %>%
  filter(site_name == i)


### SW SPC plots

plot_obj <- ptd_spc(
  sub_setdata_CC ,
  value_field = Total_Attendances_by_Group,
  date_field = der_activity_month,
  facet_field = chiefcomplaintgrouping,
  improvement_direction =  "decrease"
)



CG_SPC<- ptd_create_ggplot(
  plot_obj,
  icons_position = 'none',
  x_axis_date_format = "%b-%y",
  x_axis_breaks = "2 months",
  percentage_y_axis = FALSE,
  fixed_y_axis_multiple = FALSE,
  point_size = 4,
  y_axis_label = 'Attendances',
  x_axis_label = NULL,
  main_title    = "Attendances by Chief Complaint Group"
)

CG_SPC <- CG_SPC+ 
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
  labs(caption="")
