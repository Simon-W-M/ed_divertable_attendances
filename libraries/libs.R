
devtools::install_github('NHSEngland/ESA_Avoidable_ED_Attendances')

# Package names - add any new ones to this list
packages <- c('lubridate',
              #'readxl',
              #'hms',
              #'kableExtra',
              #'dplyr',
              #'formattable',
              #'xlsx',
              'odbc',
              'cluster',
              'mltools',
              'DBI',
              #'rstudioapi',
              #'knitr',
              #'zoo',
              #'easypackages',
              #'ggplot2',
              #'sjmisc',
              'data.table',
              'geomtextpath',
              'gridextra',
              'timeDate',
              'tidyverse',
              'scales',
              'gt',
              #'plotly',
              #'quarto',
              'here',
              'glue',
              #'readr',
              #'DT',
              #'rmarkdown',
              #'rlist',
              #'openxlsx',
              #'viridis',
              #'fontawesome',
              #'officer',
              #'flextable',
              #'ggrepel',
              'NHSRplotthedots',
              'janitor',
              'CausalImpact',
              'ESAAvoidableAtt',
              'cowplot',
              'DiagrammeR',
              'gtExtras',
              'glue'
              
              
              #'stringi'
)

# Install packages not yet installed
install.packages(setdiff(packages, rownames(installed.packages())))

#Load packages
invisible(lapply(packages, library, character.only=TRUE))   # Load all packages

