## load 'here' package to make filepaths ----
install.packages(setdiff(, rownames(installed.packages())))
invisible(lapply('here', library, character.only=TRUE))


path_lib <- paste0(here(),'/libraries/')
path_data_load <- paste0(here(),'/data_load/')
path_data_wrang <- paste0(here(),'/data_wrangling/')
path_output <- paste0(here(),'/output/')
path_output_rpts <- paste0(here(),'/output_rpts/')

# load libraries ----
source(paste0(path_lib,'libs.R'))

# load data_wrang  ----
source(paste0(path_data_wrang,'data_wrang_update travel.R'))


#saveRDS(attend_pat, 'attend_pat.rds')


#attend_pat <- readRDS('attend.rds')

# this is the site list to create reports for
# either comment or uncomment sites to run reports for
site_list <- c(#"ROYAL DEVON & EXETER HOSPITAL (WONFORD)",
               #"WESTON GENERAL HOSPITAL",
               #"CHELTENHAM GENERAL HOSPITAL",
               #"ROYAL CORNWALL HOSPITAL (TRELISKE)",
               #"TORBAY HOSPITAL",
               #"NORTH DEVON DISTRICT HOSPITAL",
               #"GLOUCESTERSHIRE ROYAL HOSPITAL",
               #"DORSET COUNTY HOSPITAL",
               #"POOLE HOSPITAL",
               #"SALISBURY DISTRICT HOSPITAL",
               #"ROYAL BOURNEMOUTH HOSPITAL",
               #"ROYAL UNITED HOSPITAL",
               #"YEOVIL DISTRICT HOSPITAL",
               "BRISTOL ROYAL INFIRMARY")
               #"DERRIFORD HOSPITAL",
               #"THE GREAT WESTERN HOSPITAL",
               #"BRISTOL ROYAL HOSPITAL FOR CHILDREN",
               #"SOUTHMEAD HOSPITAL",
               #"MUSGROVE PARK HOSPITAL")


options(dplyr.summarise.inform = FALSE)

for (i in site_list) {
  print(paste("Generating report for site :", i))
  params <- list(site_name = i)

}

site_name <- i


source(paste0(path_data_wrang,'change_plots.R'))

source(paste0(path_data_wrang,'cluster.R'))

source(paste0(path_data_wrang,'spc_charts.R'))

rmarkdown::render(paste0(path_output,"fin_report.Rmd"),
                  output_file = paste0("ed_attendance_", i,'_', format(latest_full_mth, '%y%m'), '.html'),
                  output_dir = paste0(path_output_rpts),
                  params = params,
                  envir = new.env())















