data <- starwars

data <- mtcars


library(openxlsx)

wbb <- loadWorkbook("test.xlsx")

removeWorksheet(wbb,  "dataz")

addWorksheet(wbb, "dataz")

writeData(wbb, "dataz", data)

rpt_date <-format(Sys.Date(), '%b%y')

i <- 'Devon'

filename <- paste0('data_pack_',i, rpt_date)

saveWorkbook(wbb, file=filename, overwrite = FALSE)