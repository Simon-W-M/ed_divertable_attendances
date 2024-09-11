## load 'here' package to make filepaths ----
install.packages(setdiff(, rownames(installed.packages())))
invisible(lapply('here', library, character.only=TRUE))


path_lib <- 'C:/Users/chris.brownett/OneDrive - NHS England/Documents - SouthWest Analytics Team/UEC/UEC Attendnace Analysis/Time series analysis/libraries/'
path_data_load <-'C:/Users/chris.brownett/OneDrive - NHS England/Documents - SouthWest Analytics Team/UEC/UEC Attendnace Analysis/Time series analysis/data_load/'
path_data_wrang <-'C:/Users/chris.brownett/OneDrive - NHS England/Documents - SouthWest Analytics Team/UEC/UEC Attendnace Analysis/Time series analysis/data_wrangling/'
path_data_output <-'C:/Users/chris.brownett/OneDrive - NHS England/Documents - SouthWest Analytics Team/UEC/UEC Attendnace Analysis/Time series analysis/output/'


# load libraries ----
source(paste0(path_lib,'libs.R'))

# load data_wrang  ----
source(paste0(path_data_wrang,'data_wrang_update travel.R'))


#saveRDS(attend_pat, 'attend_pat.rds')


#attend_pat <- readRDS('attend.rds')


### RMD RUN 
period <- format(Sys.Date(), '%d%b%y')


# make a list of unique sites to loop though
site_list <- unique(attend_pat$site_name)

# loop through each of the sites in the list
for (site_name in site_list) {
  
  # render the markdown report and pass 'site_name' to it - it can then be used to filter the data
  
  rmarkdown::render(
    (paste0(path_data_output,'fin_report.Rmd')), 
    output_file = paste0( site_name, "_", format(period, format = "%d_%b_%Y"), '.html'),
    params = list(site_name = site_name)
  )
  
}


print(' ***All done, the markdowns do not automatically open, check your directory ***')






















