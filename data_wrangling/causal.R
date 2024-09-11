

att <- attend_pat |>
  filter (EC_Chief_Complaint_SNOMED_CT %in% c('127278005', '127279002', '29857009', '82271004', '21522001'),
          Provider_Code == 'RA7') |>
  summarise(tot_wk = n(),
            .by = c(Arrival_week, EC_Chief_Complaint_SNOMED_CT, )) |>
  pivot_wider(names_from = EC_Chief_Complaint_SNOMED_CT,
              values_from = tot_wk)

att |> ggplot(aes(x=Arrival_week, y=`127278005`)) +
  geom_line()



pre.period <- as.Date(c("2017-12-31", "2019-03-31"))
post.period <- as.Date(c("2019-04-07", "2024-08-04"))

attd <- zoo(cbind(att$`127278005`, att$`21522001`, att$`29857009`), as.Date(att$Arrival_week))
head(data)


impact <- CausalImpact(attd, pre.period, post.period)

plot(impact)
