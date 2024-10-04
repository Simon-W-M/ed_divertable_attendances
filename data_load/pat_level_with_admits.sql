

select distinct
Provider_Code,
Arrival_Date,
EC_Acuity_SNOMED_CT, 
EC_Chief_Complaint_SNOMED_CT, 
[Site_Code_of_Treatment],
DATEPART(YEAR, [Arrival_Date]) AS [Attendance_Year],
[Arrival_Month],
EC_Departure_Time_Since_Arrival, 
[EC_Seen_For_Treatment_Time_Since_Arrival],
SITE.[Site_Name],
CASE 
WHEN SITE.[Site_Name] like 'POOLE GENERAL HOSPITAL' THEN 'POOLE HOSPITAL'
WHEN SITE.[Site_Name] like 'BOURNEMOUTH GENERAL HOSPITAL' THEN 'BOURNEMOUTH HOSPITAL'
ELSE SITE.[Site_Name]
END as [Hospital_Name],
[Der_Activity_Month],
[Der_EC_Investigation_All],
[Der_EC_Treatment_All],
[EC_Department_Type],
[EC_Discharge_Status_SNOMED_CT],
[EC_Attendance_Source_SNOMED_CT],
[EC_Arrival_Mode_SNOMED_CT],
EC_AttendanceCategory,

DATEADD(dd, -(DATEPART(dw, arrival_date)-1), arrival_date) as  Arrival_week,
      [travel_time_car],
      [travel_time_pt_peak],
      [travel_time_pt_nonpeak],
	  der_postcode_LSOA_code,
	  age_at_arrival,
	  index_of_multiple_deprivation_decile,
	  arrival_time,
	  sex,
	  ethnic_category,
	  Discharge_Destination_SNOMED_CT,
	  eomonth(arrival_date) as mth

FROM [Reporting_MESH_ECDS].[EC_Core] as core
LEFT JOIN [Reporting_UKHD_ODS].[Provider_Site]as SITE
ON core.Site_Code_of_Treatment  = SITE.[Site_Code]


left Join [AGEM_TravelTime].[LSOA_to_Site] as trav
on core.Site_Code_of_Treatment = trav.destination_name and 
core.der_postcode_LSOA_code =  trav.origin_name

where Arrival_Date  >= CONVERT(DATETIME, '2018-01-01 00:00:00', 102) 



--AND (NOT (EC_Discharge_Status_SNOMED_CT IN ('1077031000000103', '1077781000000101', '63238001'))) 
AND (EC_AttendanceCategory <> '4') 
AND (EC_Department_Type = '01')  -- Just type 1 (query why Weston is still showing).
--and EC_Chief_Complaint_SNOMED_CT IN ('127278005', '127279002', '29857009',  '21522001',  '82271004',  '267036007', '386661006', '10601006', '312608009')
and provider_code in ('RH5','RTE','RA7','RDZ','R1J','R0D','RBZ','RNZ','REF','RDY','RA4','AXG','F7H7R','RA9','RD3','RBD','RTE03','RD1','RTE01','RH8',
'RN3','RVJ','RK9','RTQ','RA3','NQT5H','NTPH1', 'RBA', 'RA4')
--AND [Discharge_Destination_SNOMED_CT] in ('306689006','306691003','306694006','306705005','50861005') -- This is just patients who are discharged
