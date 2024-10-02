---
title: "ED Attendance report: Cheltenham General Hospital"
output:
   html_document:
    toc: yes
    toc_depth: 3
    toc_float: 
     collapsed: false     
date: "2024-09-02"
theme: Cerulean
params: 
  site_name: site_name
editor_options: 
  markdown: 
    wrap: 72
---



<style type="text/css">
.main-container {
  max-width: 80% !important;
  margin: auto;
}
</style>


## Abstract

This report identifies changes in presentations over time at this site for emergency department attendances who were not conveyed by ambulance. Patients were categorised into one of four cohorts; the report focuses primarily on the cohort who could potentially be diverted from emergency department care if alternative services were available. 

The patients are split into those categorised as **avoidable attendances**, **divertible attendances**, **appropriate attendances** and **admissions**. 

The report benchmarks the last 6 months to the same  6 months a year ago (so that we do not compare summer to winter), and explores the increases or decreases by presentation for each of the above categories.

A further breakdown and cluster analysis focuses on the **divertible attendances** to see if there is any insight within the demographic, temporal and geographic characteristics of those patients that may support developing alternative pathways or identification of these patients.

## Method

Data was taken from ECDS for the last 18 months of non ambulance conveyances. The top 6 presentations per site were identified by number of attendances using chief complaint based on SNOMED codes. 

The attendances were then classified as follows:



```{=html}
<div class="DiagrammeR html-widget html-fill-item" id="htmlwidget-b2e424ceb3970dc9e359" style="width:1536px;height:576px;"></div>
<script type="application/json" data-for="htmlwidget-b2e424ceb3970dc9e359">{"x":{"diagram":"\n  graph LR\n    Attendance(Attendance)-->Avoidable\n    Attendance-->Divertible\n    Attendance-->Appropriate\n    Attendance-->Admission\n    Avoidable-->Notes_AA(Avoidable attendances, patients not requiring an emergency attendance)\n    Divertible-->Notes_DI(Patients reciving minor invesitgations and treatments that could be diverted to other services)\n    Appropriate-->Notes_AP(Appropriate patients that are discharged)\n    Admission-->Notes_AD(Appropriate patients that are admitted)\n    \nstyle Divertible fill:#FFB81C;\nstyle Notes_DI fill:#FFB81C;\n"},"evals":[],"jsHooks":[]}</script>
```


-  **Avoidable attendances** Identified using methodology developed by University of Sheffield's School of Health and Related Research's (ScHARR) definition of 'avoidable' Emergency Department attendances (Mason et al, 2017) with reference to the NHS Digital (2020) adaptation using SNOMED/ECDS coding.

-  **Divertible attendances** These patients are those who are are not avoidable attendances, minor acuity, minor investigations of PbR category 1 or 2, minor treatments of PbR category 1 or 2 and were discharged.

-  **Appropriate attendances** These who were discharged and did not meet the above 2 criteria.

-  **Admissions** These are patients who were admitted.

In addition to pure numbers of attendances we used a proxy for a measure of active or resource utilisation time for these patients.  So all time calculations take their total time in ward minus their wait time.  The study appreciates that this may not be completely active time with a clinician, but tries to account for the time they utilise that is not wait time.

Geo spacial analysis utilsed a travel time to department based on the patients home LSOA and utilised the average day car journey time.  The cohort was split to within 30 minutes travel time and over 30 minutes.  

## Comparison to pre covid levels

There are two parts to this and the graphs demonstrate the difference.  The first is simply the count by number of attendances.  This metric shows that broadly this metric of activity is in line with pre covid levels.

What is more diverse is the change of 'time in department'.  For this metric we took the total time in department minus the waiting time.  This was served as a proxy metric for time utilsing department resource.  The majority of sites have seen a sharper increase in this metric, which may be part of the reason that departments are reporting as busier.  This additional time may also correlate with more complex patient presentations, however this analysis does not explore that hypothesis.

We can also observe that this change is different across different presentation types.

## Comparison of increase of number of attendances and time (total - wait) {.tabset .tabset-fade .tabset-pills}

### Total type 1 walk in
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-2-1.png" width="1536" />

### Trauma / musculoskeletal

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-3-1.png" width="1536" />

### Circulation / chest

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-4-1.png" width="1536" />

### Gastrointestinal

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-5-1.png" width="1536" />

### Skin

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-6-1.png" width="1536" />

### General / minor / admin

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-7-1.png" width="1536" />

### Neurological

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-8-1.png" width="1536" />

### Genitourinary

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-9-1.png" width="1536" />

### Head and neck

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-10-1.png" width="1536" />

### Not Specified
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-11-1.png" width="1536" />

### Eye

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-12-1.png" width="1536" />

### Airway / breathing

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-13-1.png" width="1536" />

### Psychosocial / Behaviour change

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-14-1.png" width="1536" />

### ObGyn

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-15-1.png" width="1536" />

### Environmental

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

```
## Warning: There was 1 warning in `filter()`.
## ℹ In argument: `mth == max(mth)`.
## Caused by warning in `max.default()`:
## ! no non-missing arguments to max; returning -Inf
```

```
## Warning in min.default(structure(numeric(0), class = "Date"), na.rm = FALSE): no non-missing arguments to
## min; returning Inf
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-16-1.png" width="1536" />


## Benchmarking change over time {.tabset .tabset-fade .tabset-pills}

These charts look at the last 6 months of attendances and compare them to the same 6 months pre covid.  The percentage change is then calculated.  This is broken down across the various attendance types we have identified.  Each chart shows one of the top 6 chief complain presentation types.

We are most interested in this study for the change in divertible attendances.The other types are provided for context.  Further in the report we can see this in a more traditional time series for this individual site.

This broadly matches the previous charts, except the previous charts are accumulated the 6 month average whilst these charts are based on the aggregate for the 6 months. 

**NOTE** *Percentage change has been capped at 120% in these graphs in order to maintain scale*

### Total Attendances
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-17-1.png" width="1536" />


###  Trauma / musculoskeletal
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-18-1.png" width="1536" />


###  Circulation / chest
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-19-1.png" width="1536" />


###  Gastrointestinal
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-20-1.png" width="1536" />

###  Skin
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-21-1.png" width="1536" />

###  General / minor / admin
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-22-1.png" width="1536" />

###  Neurological
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-23-1.png" width="1536" />

###  Genitourinary
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-24-1.png" width="1536" />

###  Head and neck
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-25-1.png" width="1536" />

###  Not Specified
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-26-1.png" width="1536" />

###  Eye
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-27-1.png" width="1536" />

###  Airway / breathing
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-28-1.png" width="1536" />

###  Psychosocial / Behaviour change
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-29-1.png" width="1536" />

###  ObGyn
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-30-1.png" width="1536" />

###  Environmental
<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-31-1.png" width="1536" />


<style>
div.blue { background-color:#e6f0ff; border-radius: 5px; padding: 20px;}
</style>
<div class = "blue">

! *There are some data quality issues in some of the sites that may mean some of the cohorts may not be clearly identified.*   

</div>


## Overview by site - patient cohorts

As noted above we have further explored the data and split these patients into further cohorts. 

This tables breaks down the last 6 months of attendances into these cohorts to identify, the 'avoidable', 'divertable', 'appropriate' and 'admissions'.


```{=html}
<div id="rbqnikjmry" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#rbqnikjmry table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#rbqnikjmry thead, #rbqnikjmry tbody, #rbqnikjmry tfoot, #rbqnikjmry tr, #rbqnikjmry td, #rbqnikjmry th {
  border-style: none;
}

#rbqnikjmry p {
  margin: 0;
  padding: 0;
}

#rbqnikjmry .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 12px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#rbqnikjmry .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#rbqnikjmry .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#rbqnikjmry .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#rbqnikjmry .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rbqnikjmry .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rbqnikjmry .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#rbqnikjmry .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#rbqnikjmry .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#rbqnikjmry .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#rbqnikjmry .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#rbqnikjmry .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#rbqnikjmry .gt_spanner_row {
  border-bottom-style: hidden;
}

#rbqnikjmry .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#rbqnikjmry .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#rbqnikjmry .gt_from_md > :first-child {
  margin-top: 0;
}

#rbqnikjmry .gt_from_md > :last-child {
  margin-bottom: 0;
}

#rbqnikjmry .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#rbqnikjmry .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#rbqnikjmry .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#rbqnikjmry .gt_row_group_first td {
  border-top-width: 2px;
}

#rbqnikjmry .gt_row_group_first th {
  border-top-width: 2px;
}

#rbqnikjmry .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rbqnikjmry .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#rbqnikjmry .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#rbqnikjmry .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rbqnikjmry .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#rbqnikjmry .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#rbqnikjmry .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#rbqnikjmry .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#rbqnikjmry .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#rbqnikjmry .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rbqnikjmry .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#rbqnikjmry .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#rbqnikjmry .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#rbqnikjmry .gt_left {
  text-align: left;
}

#rbqnikjmry .gt_center {
  text-align: center;
}

#rbqnikjmry .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#rbqnikjmry .gt_font_normal {
  font-weight: normal;
}

#rbqnikjmry .gt_font_bold {
  font-weight: bold;
}

#rbqnikjmry .gt_font_italic {
  font-style: italic;
}

#rbqnikjmry .gt_super {
  font-size: 65%;
}

#rbqnikjmry .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#rbqnikjmry .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#rbqnikjmry .gt_indent_1 {
  text-indent: 5px;
}

#rbqnikjmry .gt_indent_2 {
  text-indent: 10px;
}

#rbqnikjmry .gt_indent_3 {
  text-indent: 15px;
}

#rbqnikjmry .gt_indent_4 {
  text-indent: 20px;
}

#rbqnikjmry .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <thead>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_title gt_font_normal" style>Type 1 walk in attendances by chief complaint: Mar 24 to Aug 24</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="14" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Split by Avoidable Attendances, Divertable Attendances, Appropriate Attendances and Admissions</td>
    </tr>
    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="2" colspan="1" scope="col" id="Chief Complaint">Chief Complaint</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="5" scope="colgroup" id="Number of attendances">
        <span class="gt_column_spanner">Number of attendances</span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="5" scope="colgroup" id="Time on ward (Total time - wait time)">
        <span class="gt_column_spanner">Time on ward (Total time - wait time)</span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="3" scope="colgroup" id="Divertable attendances &#10; (Total time - wait time)">
        <span class="gt_column_spanner">Divertable attendances 
 (Total time - wait time)</span>
      </th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Avoidable Attendances">Avoidable Attendances</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Divertable Attendances">Divertable Attendances</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Appropriate Attendances">Appropriate Attendances</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Admissions">Admissions</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Total Attendances">Total Attendances</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Avoidable Attendances (Mins)">Avoidable Attendances (Mins)</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Divertable Attendances (Mins)">Divertable Attendances (Mins)</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Appropriate Attendances (Mins)">Appropriate Attendances (Mins)</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Admissions (Mins)">Admissions (Mins)</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Total Attendances (Mins)">Total Attendances (Mins)</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Mean time per divertable attendance per day">Mean time per divertable attendance per day</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Mean number of divertable attendances per day">Mean number of divertable attendances per day</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Mean minutes divertable attendances per day">Mean minutes divertable attendances per day</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Trauma / musculoskeletal</td>
<td headers="avoid_attend" class="gt_row gt_right">405</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">108</td>
<td headers="approp" class="gt_row gt_right">6,152</td>
<td headers="admits" class="gt_row gt_right">405</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">8,313</td>
<td headers="avoid_attend_t" class="gt_row gt_right">88,018</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">3,680</td>
<td headers="approp_t" class="gt_row gt_right">516,759</td>
<td headers="admits_t" class="gt_row gt_right">88,018</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">665,559</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">34.1</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.6</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">20.1</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Eye</td>
<td headers="avoid_attend" class="gt_row gt_right">44</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">70</td>
<td headers="approp" class="gt_row gt_right">393</td>
<td headers="admits" class="gt_row gt_right">44</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">754</td>
<td headers="avoid_attend_t" class="gt_row gt_right">3,622</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">2,860</td>
<td headers="approp_t" class="gt_row gt_right">30,604</td>
<td headers="admits_t" class="gt_row gt_right">3,622</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">47,318</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">40.9</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.4</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">15.6</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Head and neck</td>
<td headers="avoid_attend" class="gt_row gt_right">143</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">49</td>
<td headers="approp" class="gt_row gt_right">248</td>
<td headers="admits" class="gt_row gt_right">143</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">943</td>
<td headers="avoid_attend_t" class="gt_row gt_right">24,693</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">1</td>
<td headers="approp_t" class="gt_row gt_right">30,420</td>
<td headers="admits_t" class="gt_row gt_right">24,693</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">64,749</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.3</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">General / minor / admin</td>
<td headers="avoid_attend" class="gt_row gt_right">284</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">48</td>
<td headers="approp" class="gt_row gt_right">570</td>
<td headers="admits" class="gt_row gt_right">284</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">1,523</td>
<td headers="avoid_attend_t" class="gt_row gt_right">141,157</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">1,380</td>
<td headers="approp_t" class="gt_row gt_right">103,473</td>
<td headers="admits_t" class="gt_row gt_right">141,157</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">262,697</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">28.8</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.3</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">7.5</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Skin</td>
<td headers="avoid_attend" class="gt_row gt_right">149</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">48</td>
<td headers="approp" class="gt_row gt_right">662</td>
<td headers="admits" class="gt_row gt_right">149</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">1,523</td>
<td headers="avoid_attend_t" class="gt_row gt_right">18,003</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">786</td>
<td headers="approp_t" class="gt_row gt_right">49,400</td>
<td headers="admits_t" class="gt_row gt_right">18,003</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">88,863</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">16.4</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.3</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">4.3</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Gastrointestinal</td>
<td headers="avoid_attend" class="gt_row gt_right">724</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">20</td>
<td headers="approp" class="gt_row gt_right">699</td>
<td headers="admits" class="gt_row gt_right">724</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">1,872</td>
<td headers="avoid_attend_t" class="gt_row gt_right">183,060</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">470</td>
<td headers="approp_t" class="gt_row gt_right">153,901</td>
<td headers="admits_t" class="gt_row gt_right">183,060</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">348,416</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">23.5</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.1</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">2.6</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Genitourinary</td>
<td headers="avoid_attend" class="gt_row gt_right">268</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">10</td>
<td headers="approp" class="gt_row gt_right">548</td>
<td headers="admits" class="gt_row gt_right">268</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">1,208</td>
<td headers="avoid_attend_t" class="gt_row gt_right">98,520</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">420</td>
<td headers="approp_t" class="gt_row gt_right">89,060</td>
<td headers="admits_t" class="gt_row gt_right">98,520</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">204,626</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">42.0</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.1</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">2.3</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Circulation / chest</td>
<td headers="avoid_attend" class="gt_row gt_right">861</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">9</td>
<td headers="approp" class="gt_row gt_right">1,141</td>
<td headers="admits" class="gt_row gt_right">861</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">2,244</td>
<td headers="avoid_attend_t" class="gt_row gt_right">235,991</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">155</td>
<td headers="approp_t" class="gt_row gt_right">287,857</td>
<td headers="admits_t" class="gt_row gt_right">235,991</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">531,974</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">17.2</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.8</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Neurological</td>
<td headers="avoid_attend" class="gt_row gt_right">434</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">6</td>
<td headers="approp" class="gt_row gt_right">668</td>
<td headers="admits" class="gt_row gt_right">434</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">1,400</td>
<td headers="avoid_attend_t" class="gt_row gt_right">203,680</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0</td>
<td headers="approp_t" class="gt_row gt_right">183,848</td>
<td headers="admits_t" class="gt_row gt_right">203,680</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">400,061</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Psychosocial / Behaviour change</td>
<td headers="avoid_attend" class="gt_row gt_right">32</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">5</td>
<td headers="approp" class="gt_row gt_right">81</td>
<td headers="admits" class="gt_row gt_right">32</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">178</td>
<td headers="avoid_attend_t" class="gt_row gt_right">16,606</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">68</td>
<td headers="approp_t" class="gt_row gt_right">25,230</td>
<td headers="admits_t" class="gt_row gt_right">16,606</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">46,225</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">13.6</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.4</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Not Specified</td>
<td headers="avoid_attend" class="gt_row gt_right">135</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">3</td>
<td headers="approp" class="gt_row gt_right">478</td>
<td headers="admits" class="gt_row gt_right">135</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">783</td>
<td headers="avoid_attend_t" class="gt_row gt_right">57,124</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">188</td>
<td headers="approp_t" class="gt_row gt_right">36,809</td>
<td headers="admits_t" class="gt_row gt_right">57,124</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">99,859</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">62.7</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">1.0</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Not applicable to child terms</td>
<td headers="avoid_attend" class="gt_row gt_right">107</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">2</td>
<td headers="approp" class="gt_row gt_right">192</td>
<td headers="admits" class="gt_row gt_right">107</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">380</td>
<td headers="avoid_attend_t" class="gt_row gt_right">43,691</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">134</td>
<td headers="approp_t" class="gt_row gt_right">39,664</td>
<td headers="admits_t" class="gt_row gt_right">43,691</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">89,270</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">67.0</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.7</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Environmental</td>
<td headers="avoid_attend" class="gt_row gt_right">21</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">1</td>
<td headers="approp" class="gt_row gt_right">53</td>
<td headers="admits" class="gt_row gt_right">21</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">92</td>
<td headers="avoid_attend_t" class="gt_row gt_right">10,110</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0</td>
<td headers="approp_t" class="gt_row gt_right">15,005</td>
<td headers="admits_t" class="gt_row gt_right">10,110</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">26,223</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">ObGyn</td>
<td headers="avoid_attend" class="gt_row gt_right">33</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">1</td>
<td headers="approp" class="gt_row gt_right">31</td>
<td headers="admits" class="gt_row gt_right">33</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">119</td>
<td headers="avoid_attend_t" class="gt_row gt_right">2,373</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0</td>
<td headers="approp_t" class="gt_row gt_right">2,758</td>
<td headers="admits_t" class="gt_row gt_right">2,373</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">6,154</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Airway / breathing</td>
<td headers="avoid_attend" class="gt_row gt_right">240</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0</td>
<td headers="approp" class="gt_row gt_right">263</td>
<td headers="admits" class="gt_row gt_right">240</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">585</td>
<td headers="avoid_attend_t" class="gt_row gt_right">148,917</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0</td>
<td headers="approp_t" class="gt_row gt_right">79,273</td>
<td headers="admits_t" class="gt_row gt_right">148,917</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">230,151</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">0.0</td></tr>
    <tr><td headers="chiefcomplaintgrouping" class="gt_row gt_left">Total</td>
<td headers="avoid_attend" class="gt_row gt_right">3,880</td>
<td headers="non_aa_res" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">380</td>
<td headers="approp" class="gt_row gt_right">12,179</td>
<td headers="admits" class="gt_row gt_right">3,880</td>
<td headers="tot" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">21,917</td>
<td headers="avoid_attend_t" class="gt_row gt_right">1,275,565</td>
<td headers="non_aa_res_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">10,142</td>
<td headers="approp_t" class="gt_row gt_right">1,644,061</td>
<td headers="admits_t" class="gt_row gt_right">1,275,565</td>
<td headers="tot_t" class="gt_row gt_right" style="background-color: rgba(232,237,238,0.5); color: #000000; border-right-width: 1.5px; border-right-style: solid; border-right-color: blue;">3,112,145</td>
<td headers="mean_t" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">346.1</td>
<td headers="num_divert_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">2.1</td>
<td headers="mean_t_day" class="gt_row gt_right" style="background-color: rgba(255,184,28,0.5); color: #000000;">55.4</td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="14"> <em>Data taken from ECDS</em> : <strong>NOTE</strong> Numbers are rounded for clarity</td>
    </tr>
  </tfoot>
</table>
</div>
```

## Resource time {.tabset .tabset-fade .tabset-pills}

We further break this down to look at the range in time these patients utilise in department.  We have compared this range of time to the previous 6 and 12 months and to a similar pre covid period. 

### Resource time site comparison

The below chart shows the average resource time per patient for each
site over the last 18 months.

*'Resource time' is defined as total time in ward minus wait time.*

Guide for interpreting the box plot:

**Key Components of a Box Plot:**

**Box:** The central rectangle represents the interquartile range (IQR),
which contains the middle 50% of the data.

**Median:** The line within the box indicates the median value,
separating the lower and upper halves of the data.

**Whiskers:** The lines extending from the box are called whiskers. They
typically reach to the minimum and maximum values excluding outliers.

**Outliers:** Data points that fall outside of the whiskers, represented
by the dots, are considered outliers.


```
## Warning: Removed 5848 rows containing non-finite outside the scale range (`stat_boxplot()`).
```

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-33-1.png" width="1152" />

### Resource time site level time comparison for 'divertible patients'

This shows the distribution of resource time over six month time periods.

Not has time utilised by these patients has increased in comparison to pre covid numbers.

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-34-1.png" width="1152" />



## Chief Complaint

The below SPC chart shows the number of attendances by 
complaint types over the latest 18 month for this site.

Statistical Process Control charts use statistics to identify patterns and anomalies that may be worth investigating as they are not caused by common cause variation within the data. 

This will help us identify if there are any trend in our divertable attendances, to see if this co hort is increasing,  decreasing or static.  

Where we see yellow dots, this indicates an increasing trend and blue dots indicate a decreasing trend, or the they can represent unusual activity levels.

<img src="C:\Users\simon.wellesley-mill\OneDrive - NHS\Desktop\Repos\ed_divertable_attendances\output_rpts\ed_attendance_CHELTENHAM GENERAL HOSPITAL_2408_files/figure-html/unnamed-chunk-35-1.png" width="1152" />

<style>
div.blue { background-color:#e6f0ff; border-radius: 5px; padding: 20px;}
</style>
<div class = "blue">
*Please note that Y axis scales are different for each graph.*
</div>

## Clustering

We have explored the divertible attendances and by running correlation models across the features of the patients, we have identified the three strongest characteristics of these patients.  These are their age, the time that they attend A&E and their travel time to the hospital.

These tables give a baseline of the all the attendances for patients for the chief complaint, we then compare this to the characteristics of the divertible attendance group, further we explore if these features are further correlated nd have employed a clustering algorithm  to group the patients into similar cohorts.  This pulls together into groups where features are most strongly correlated.

### Breakdown by chief complaint  {.tabset .tabset-fade .tabset-pills}

#### Trauma / musculoskeletal

```{=html}
<div id="tmoratplvd" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#tmoratplvd table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#tmoratplvd thead, #tmoratplvd tbody, #tmoratplvd tfoot, #tmoratplvd tr, #tmoratplvd td, #tmoratplvd th {
  border-style: none;
}

#tmoratplvd p {
  margin: 0;
  padding: 0;
}

#tmoratplvd .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 12px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#tmoratplvd .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#tmoratplvd .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#tmoratplvd .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#tmoratplvd .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tmoratplvd .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tmoratplvd .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#tmoratplvd .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#tmoratplvd .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#tmoratplvd .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#tmoratplvd .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#tmoratplvd .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#tmoratplvd .gt_spanner_row {
  border-bottom-style: hidden;
}

#tmoratplvd .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#tmoratplvd .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#tmoratplvd .gt_from_md > :first-child {
  margin-top: 0;
}

#tmoratplvd .gt_from_md > :last-child {
  margin-bottom: 0;
}

#tmoratplvd .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#tmoratplvd .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#tmoratplvd .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#tmoratplvd .gt_row_group_first td {
  border-top-width: 2px;
}

#tmoratplvd .gt_row_group_first th {
  border-top-width: 2px;
}

#tmoratplvd .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tmoratplvd .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#tmoratplvd .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#tmoratplvd .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tmoratplvd .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#tmoratplvd .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#tmoratplvd .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#tmoratplvd .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#tmoratplvd .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#tmoratplvd .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tmoratplvd .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#tmoratplvd .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#tmoratplvd .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#tmoratplvd .gt_left {
  text-align: left;
}

#tmoratplvd .gt_center {
  text-align: center;
}

#tmoratplvd .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#tmoratplvd .gt_font_normal {
  font-weight: normal;
}

#tmoratplvd .gt_font_bold {
  font-weight: bold;
}

#tmoratplvd .gt_font_italic {
  font-style: italic;
}

#tmoratplvd .gt_super {
  font-size: 65%;
}

#tmoratplvd .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#tmoratplvd .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#tmoratplvd .gt_indent_1 {
  text-indent: 5px;
}

#tmoratplvd .gt_indent_2 {
  text-indent: 10px;
}

#tmoratplvd .gt_indent_3 {
  text-indent: 15px;
}

#tmoratplvd .gt_indent_4 {
  text-indent: 20px;
}

#tmoratplvd .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" style="table-layout: fixed;" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <colgroup>
    <col/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
  </colgroup>
  <thead>
    <tr class="gt_heading">
      <td colspan="23" class="gt_heading gt_title gt_font_normal" style>Cluster analysis of divertable attendances</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="23" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Shows benchmark of all attendance types, the entire cohort and then clustered breakdowns</td>
    </tr>
    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="Total">Total</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="10" scope="colgroup" id="&lt;strong&gt;Age Group of Patient&lt;/strong&gt;">
        <span class="gt_column_spanner"><strong>Age Group of Patient</strong></span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="&lt;strong&gt;Arrival Time at Hospital&lt;/strong&gt;">
        <span class="gt_column_spanner"><strong>Arrival Time at Hospital</strong></span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="&lt;strong&gt;Travel Time to Hospital&lt;/strong&gt;">
        <span class="gt_column_spanner"><strong>Travel Time to Hospital</strong></span>
      </th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="0-18">0-18</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="19-45">19-45</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="46-65">46-65</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="66-85">66-85</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="86 +">86 +</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Wkday 9am - 6pm">Wkday 9am - 6pm</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Wkday Ouside Hrs">Wkday Ouside Hrs</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Weekend">Weekend</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Under 30 mins">Under 30 mins</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Over 30 mins">Over 30 mins</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Unknown">Unknown</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="23" class="gt_group_heading" scope="colgroup" id="Total across all attendance types for comparison">Total across all attendance types for comparison</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Total across all attendance types for comparison  tot" class="gt_row gt_right">8313</td>
<td headers="Total across all attendance types for comparison  0-18" class="gt_row gt_right">25.5% (2122)</td>
<td headers="Total across all attendance types for comparison  xperc_0-18_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:25.5262841332852%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  19-45" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_19-45_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  45-65" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_45-65_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  66-85" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_66-85_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  86 +" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  open" class="gt_row gt_right">53.4% (4437)</td>
<td headers="Total across all attendance types for comparison  xperc_open_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:53.3742331288344%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  ooo" class="gt_row gt_right">19.5% (1618)</td>
<td headers="Total across all attendance types for comparison  xperc_ooo_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:19.4634909178395%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  wkend" class="gt_row gt_right">27.2% (2258)</td>
<td headers="Total across all attendance types for comparison  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:27.1622759533261%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  trav_count_0" class="gt_row gt_right">14.5% (1203)</td>
<td headers="Total across all attendance types for comparison  xperc_trav_count_0_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:14.4713099963912%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  trav_count_1" class="gt_row gt_right">82.7% (6873)</td>
<td headers="Total across all attendance types for comparison  xperc_trav_count_1_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:82.6777336701552%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  trav_count_2" class="gt_row gt_right">2.9% (237)</td>
<td headers="Total across all attendance types for comparison  xperc_trav_count_2_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:2.85095633345363%;height:16px;'></div></div></td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="23" class="gt_group_heading" scope="colgroup" id="Total for divertable attendances">Total for divertable attendances</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Total for divertable attendances  tot" class="gt_row gt_right" style="background-color: #D3D3D3;">108</td>
<td headers="Total for divertable attendances  0-18" class="gt_row gt_right" style="background-color: #D3D3D3;">38.0% (41)</td>
<td headers="Total for divertable attendances  xperc_0-18_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:37.962962962963%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  19-45" class="gt_row gt_right" style="background-color: #D3D3D3;">38.0% (41)</td>
<td headers="Total for divertable attendances  xperc_19-45_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:37.962962962963%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  45-65" class="gt_row gt_right" style="background-color: #D3D3D3;">11.1% (12)</td>
<td headers="Total for divertable attendances  xperc_45-65_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:11.1111111111111%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  66-85" class="gt_row gt_right" style="background-color: #D3D3D3;">12.0% (13)</td>
<td headers="Total for divertable attendances  xperc_66-85_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:12.037037037037%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  86 +" class="gt_row gt_right" style="background-color: #D3D3D3;">0.9% (1)</td>
<td headers="Total for divertable attendances  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0.925925925925926%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  open" class="gt_row gt_right" style="background-color: #D3D3D3;">44.4% (48)</td>
<td headers="Total for divertable attendances  xperc_open_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:44.4444444444444%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  ooo" class="gt_row gt_right" style="background-color: #D3D3D3;">17.6% (19)</td>
<td headers="Total for divertable attendances  xperc_ooo_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:17.5925925925926%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  wkend" class="gt_row gt_right" style="background-color: #D3D3D3;">38.0% (41)</td>
<td headers="Total for divertable attendances  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:37.962962962963%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  trav_count_0" class="gt_row gt_right" style="background-color: #D3D3D3;">16.7% (18)</td>
<td headers="Total for divertable attendances  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:16.6666666666667%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  trav_count_1" class="gt_row gt_right" style="background-color: #D3D3D3;">81.5% (88)</td>
<td headers="Total for divertable attendances  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:81.4814814814815%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  trav_count_2" class="gt_row gt_right" style="background-color: #D3D3D3;">1.9% (2)</td>
<td headers="Total for divertable attendances  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:1.85185185185185%;height:16px;'></div></div></td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="23" class="gt_group_heading" scope="colgroup" id="Cluster groups for divertable attendances to identify correlations">Cluster groups for divertable attendances to identify correlations</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Cluster groups for divertable attendances to identify correlations  tot" class="gt_row gt_right" style="background-color: #DADEDF;">74</td>
<td headers="Cluster groups for divertable attendances to identify correlations  0-18" class="gt_row gt_right" style="background-color: #DADEDF;">40.0% (26)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_0-18_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:40%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  19-45" class="gt_row gt_right" style="background-color: #DADEDF;">40.0% (28)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_19-45_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:40%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  45-65" class="gt_row gt_right" style="background-color: #DADEDF;">10.0% (8)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_45-65_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:10%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  66-85" class="gt_row gt_right" style="background-color: #DADEDF;">10.0% (11)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_66-85_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:10%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  86 +" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  open" class="gt_row gt_right" style="background-color: #DADEDF;">50.0% (39)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_open_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:50%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  ooo" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_ooo_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  wkend" class="gt_row gt_right" style="background-color: #DADEDF;">50.0% (34)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:50%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_0" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_1" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (74)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_2" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td></tr>
    <tr><td headers="Cluster groups for divertable attendances to identify correlations  tot" class="gt_row gt_right" style="background-color: #DADEDF;">18</td>
<td headers="Cluster groups for divertable attendances to identify correlations  0-18" class="gt_row gt_right" style="background-color: #DADEDF;">30.0% (6)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_0-18_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:30%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  19-45" class="gt_row gt_right" style="background-color: #DADEDF;">30.0% (6)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_19-45_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:30%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  45-65" class="gt_row gt_right" style="background-color: #DADEDF;">20.0% (4)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_45-65_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:20%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  66-85" class="gt_row gt_right" style="background-color: #DADEDF;">10.0% (2)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_66-85_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:10%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  86 +" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  open" class="gt_row gt_right" style="background-color: #DADEDF;">50.0% (9)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_open_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:50%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  ooo" class="gt_row gt_right" style="background-color: #DADEDF;">10.0% (2)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_ooo_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:10%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  wkend" class="gt_row gt_right" style="background-color: #DADEDF;">40.0% (7)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:40%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_0" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (18)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_1" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_2" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td></tr>
    <tr><td headers="Cluster groups for divertable attendances to identify correlations  tot" class="gt_row gt_right" style="background-color: #DADEDF;">16</td>
<td headers="Cluster groups for divertable attendances to identify correlations  0-18" class="gt_row gt_right" style="background-color: #DADEDF;">60.0% (9)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_0-18_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:60%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  19-45" class="gt_row gt_right" style="background-color: #DADEDF;">40.0% (7)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_19-45_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:40%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  45-65" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_45-65_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  66-85" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_66-85_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  86 +" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  open" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_open_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  ooo" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (16)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_ooo_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  wkend" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_0" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_1" class="gt_row gt_right" style="background-color: #DADEDF;">90.0% (14)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:90%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_2" class="gt_row gt_right" style="background-color: #DADEDF;">10.0% (2)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:10%;height:16px;'></div></div></td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="23"> <em>Data taken from ECDS</em></td>
    </tr>
  </tfoot>
</table>
</div>
```

*Explanation of cluster groups.*  


The largest cluster of this cohort is made of **74** patients whose strongest feature is that they **live more than 30 minutes travel time away** and that they **arrive Monday / Friday  9am to 6pm** and **arrive at the weekend**.   

The second largest cluster of this cohort is made of **18** patients whose strongest feature is that they **live less than 30 minutes travel time away** and that they **arrive Monday / Friday  9am to 6pm** and **arrive at the weekend**.   

The final cluster of this cohort is made of **16** patients whose strongest feature is that they **arrive Monday / Friday  outside of 9am to 6pm** and that they **live more than 30 minutes travel time away** and **are children (0-18)**.   


#### Genitourinary

```{=html}
<div id="giozdhufzu" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#giozdhufzu table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#giozdhufzu thead, #giozdhufzu tbody, #giozdhufzu tfoot, #giozdhufzu tr, #giozdhufzu td, #giozdhufzu th {
  border-style: none;
}

#giozdhufzu p {
  margin: 0;
  padding: 0;
}

#giozdhufzu .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 12px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#giozdhufzu .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#giozdhufzu .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#giozdhufzu .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#giozdhufzu .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#giozdhufzu .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#giozdhufzu .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#giozdhufzu .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#giozdhufzu .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#giozdhufzu .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#giozdhufzu .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#giozdhufzu .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#giozdhufzu .gt_spanner_row {
  border-bottom-style: hidden;
}

#giozdhufzu .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#giozdhufzu .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#giozdhufzu .gt_from_md > :first-child {
  margin-top: 0;
}

#giozdhufzu .gt_from_md > :last-child {
  margin-bottom: 0;
}

#giozdhufzu .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#giozdhufzu .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#giozdhufzu .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#giozdhufzu .gt_row_group_first td {
  border-top-width: 2px;
}

#giozdhufzu .gt_row_group_first th {
  border-top-width: 2px;
}

#giozdhufzu .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#giozdhufzu .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#giozdhufzu .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#giozdhufzu .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#giozdhufzu .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#giozdhufzu .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#giozdhufzu .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#giozdhufzu .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#giozdhufzu .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#giozdhufzu .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#giozdhufzu .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#giozdhufzu .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#giozdhufzu .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#giozdhufzu .gt_left {
  text-align: left;
}

#giozdhufzu .gt_center {
  text-align: center;
}

#giozdhufzu .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#giozdhufzu .gt_font_normal {
  font-weight: normal;
}

#giozdhufzu .gt_font_bold {
  font-weight: bold;
}

#giozdhufzu .gt_font_italic {
  font-style: italic;
}

#giozdhufzu .gt_super {
  font-size: 65%;
}

#giozdhufzu .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#giozdhufzu .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#giozdhufzu .gt_indent_1 {
  text-indent: 5px;
}

#giozdhufzu .gt_indent_2 {
  text-indent: 10px;
}

#giozdhufzu .gt_indent_3 {
  text-indent: 15px;
}

#giozdhufzu .gt_indent_4 {
  text-indent: 20px;
}

#giozdhufzu .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" style="table-layout: fixed;" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <colgroup>
    <col/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
  </colgroup>
  <thead>
    <tr class="gt_heading">
      <td colspan="23" class="gt_heading gt_title gt_font_normal" style>Cluster analysis of divertable attendances</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="23" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Shows benchmark of all attendance types, the entire cohort and then clustered breakdowns</td>
    </tr>
    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="Total">Total</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="10" scope="colgroup" id="&lt;strong&gt;Age Group of Patient&lt;/strong&gt;">
        <span class="gt_column_spanner"><strong>Age Group of Patient</strong></span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="&lt;strong&gt;Arrival Time at Hospital&lt;/strong&gt;">
        <span class="gt_column_spanner"><strong>Arrival Time at Hospital</strong></span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="&lt;strong&gt;Travel Time to Hospital&lt;/strong&gt;">
        <span class="gt_column_spanner"><strong>Travel Time to Hospital</strong></span>
      </th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="0-18">0-18</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="19-45">19-45</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="46-65">46-65</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="66-85">66-85</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="86 +">86 +</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Wkday 9am - 6pm">Wkday 9am - 6pm</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Wkday Ouside Hrs">Wkday Ouside Hrs</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Weekend">Weekend</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Under 30 mins">Under 30 mins</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Over 30 mins">Over 30 mins</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Unknown">Unknown</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="23" class="gt_group_heading" scope="colgroup" id="Total across all attendance types for comparison">Total across all attendance types for comparison</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Total across all attendance types for comparison  tot" class="gt_row gt_right">1208</td>
<td headers="Total across all attendance types for comparison  0-18" class="gt_row gt_right">4.4% (53)</td>
<td headers="Total across all attendance types for comparison  xperc_0-18_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:4.38741721854305%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  19-45" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_19-45_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  45-65" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_45-65_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  66-85" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_66-85_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  86 +" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  open" class="gt_row gt_right">60.7% (733)</td>
<td headers="Total across all attendance types for comparison  xperc_open_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:60.6788079470199%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  ooo" class="gt_row gt_right">14.1% (170)</td>
<td headers="Total across all attendance types for comparison  xperc_ooo_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:14.0728476821192%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  wkend" class="gt_row gt_right">25.2% (305)</td>
<td headers="Total across all attendance types for comparison  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:25.2483443708609%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  trav_count_0" class="gt_row gt_right">29.8% (360)</td>
<td headers="Total across all attendance types for comparison  xperc_trav_count_0_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:29.8013245033113%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  trav_count_1" class="gt_row gt_right">65.1% (787)</td>
<td headers="Total across all attendance types for comparison  xperc_trav_count_1_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:65.1490066225166%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  trav_count_2" class="gt_row gt_right">5.0% (61)</td>
<td headers="Total across all attendance types for comparison  xperc_trav_count_2_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:5.04966887417219%;height:16px;'></div></div></td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="23" class="gt_group_heading" scope="colgroup" id="Total for divertable attendances">Total for divertable attendances</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Total for divertable attendances  tot" class="gt_row gt_right" style="background-color: #D3D3D3;">10</td>
<td headers="Total for divertable attendances  0-18" class="gt_row gt_right" style="background-color: #D3D3D3;">20.0% (2)</td>
<td headers="Total for divertable attendances  xperc_0-18_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:20%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  19-45" class="gt_row gt_right" style="background-color: #D3D3D3;">10.0% (1)</td>
<td headers="Total for divertable attendances  xperc_19-45_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:10%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  45-65" class="gt_row gt_right" style="background-color: #D3D3D3;">20.0% (2)</td>
<td headers="Total for divertable attendances  xperc_45-65_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:20%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  66-85" class="gt_row gt_right" style="background-color: #D3D3D3;">50.0% (5)</td>
<td headers="Total for divertable attendances  xperc_66-85_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:50%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  86 +" class="gt_row gt_right" style="background-color: #D3D3D3;">0.0% (0)</td>
<td headers="Total for divertable attendances  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  open" class="gt_row gt_right" style="background-color: #D3D3D3;">20.0% (2)</td>
<td headers="Total for divertable attendances  xperc_open_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:20%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  ooo" class="gt_row gt_right" style="background-color: #D3D3D3;">10.0% (1)</td>
<td headers="Total for divertable attendances  xperc_ooo_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:10%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  wkend" class="gt_row gt_right" style="background-color: #D3D3D3;">70.0% (7)</td>
<td headers="Total for divertable attendances  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:70%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  trav_count_0" class="gt_row gt_right" style="background-color: #D3D3D3;">10.0% (1)</td>
<td headers="Total for divertable attendances  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:10%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  trav_count_1" class="gt_row gt_right" style="background-color: #D3D3D3;">70.0% (7)</td>
<td headers="Total for divertable attendances  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:70%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  trav_count_2" class="gt_row gt_right" style="background-color: #D3D3D3;">20.0% (2)</td>
<td headers="Total for divertable attendances  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:20%;height:16px;'></div></div></td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="23" class="gt_group_heading" scope="colgroup" id="Cluster groups for divertable attendances to identify correlations">Cluster groups for divertable attendances to identify correlations</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Cluster groups for divertable attendances to identify correlations  tot" class="gt_row gt_right" style="background-color: #DADEDF;">6</td>
<td headers="Cluster groups for divertable attendances to identify correlations  0-18" class="gt_row gt_right" style="background-color: #DADEDF;">30.0% (2)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_0-18_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:30%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  19-45" class="gt_row gt_right" style="background-color: #DADEDF;">20.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_19-45_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:20%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  45-65" class="gt_row gt_right" style="background-color: #DADEDF;">20.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_45-65_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:20%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  66-85" class="gt_row gt_right" style="background-color: #DADEDF;">30.0% (2)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_66-85_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:30%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  86 +" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  open" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_open_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  ooo" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_ooo_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  wkend" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (6)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_0" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_1" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (6)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_2" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td></tr>
    <tr><td headers="Cluster groups for divertable attendances to identify correlations  tot" class="gt_row gt_right" style="background-color: #DADEDF;">3</td>
<td headers="Cluster groups for divertable attendances to identify correlations  0-18" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_0-18_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  19-45" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_19-45_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  45-65" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_45-65_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  66-85" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (3)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_66-85_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  86 +" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  open" class="gt_row gt_right" style="background-color: #DADEDF;">70.0% (2)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_open_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:70%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  ooo" class="gt_row gt_right" style="background-color: #DADEDF;">30.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_ooo_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:30%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  wkend" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_0" class="gt_row gt_right" style="background-color: #DADEDF;">30.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:30%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_1" class="gt_row gt_right" style="background-color: #DADEDF;">30.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:30%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_2" class="gt_row gt_right" style="background-color: #DADEDF;">30.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:30%;height:16px;'></div></div></td></tr>
    <tr><td headers="Cluster groups for divertable attendances to identify correlations  tot" class="gt_row gt_right" style="background-color: #DADEDF;">1</td>
<td headers="Cluster groups for divertable attendances to identify correlations  0-18" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_0-18_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  19-45" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_19-45_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  45-65" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_45-65_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  66-85" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_66-85_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  86 +" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  open" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_open_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  ooo" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_ooo_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  wkend" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_0" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_1" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_2" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:100%;height:16px;'></div></div></td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="23"> <em>Data taken from ECDS</em></td>
    </tr>
  </tfoot>
</table>
</div>
```

*Explanation of cluster groups.*  

The largest cluster of this cohort is made of **6** patients whose strongest feature is that they **arrive at the weekend** and that they **live more than 30 minutes travel time away** and **are children (0-18)**.   

The second largest cluster of this cohort is made of **3** patients whose strongest feature is that they **are older people (66-85)** and that they **arrive Monday / Friday  9am to 6pm** and **arrive Monday / Friday  outside of 9am to 6pm**.   

The final cluster of this cohort is made of **1** patients whose strongest feature is that they **are older adults (46-65)** and that they **arrive at the weekend** and **travel time is not known**.   

#### Circulation / chest

```{=html}
<div id="klncyctlkj" style="padding-left:0px;padding-right:0px;padding-top:10px;padding-bottom:10px;overflow-x:auto;overflow-y:auto;width:auto;height:auto;">
<style>#klncyctlkj table {
  font-family: system-ui, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji';
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

#klncyctlkj thead, #klncyctlkj tbody, #klncyctlkj tfoot, #klncyctlkj tr, #klncyctlkj td, #klncyctlkj th {
  border-style: none;
}

#klncyctlkj p {
  margin: 0;
  padding: 0;
}

#klncyctlkj .gt_table {
  display: table;
  border-collapse: collapse;
  line-height: normal;
  margin-left: auto;
  margin-right: auto;
  color: #333333;
  font-size: 12px;
  font-weight: normal;
  font-style: normal;
  background-color: #FFFFFF;
  width: auto;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #A8A8A8;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #A8A8A8;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
}

#klncyctlkj .gt_caption {
  padding-top: 4px;
  padding-bottom: 4px;
}

#klncyctlkj .gt_title {
  color: #333333;
  font-size: 125%;
  font-weight: initial;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-color: #FFFFFF;
  border-bottom-width: 0;
}

#klncyctlkj .gt_subtitle {
  color: #333333;
  font-size: 85%;
  font-weight: initial;
  padding-top: 3px;
  padding-bottom: 5px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-color: #FFFFFF;
  border-top-width: 0;
}

#klncyctlkj .gt_heading {
  background-color: #FFFFFF;
  text-align: center;
  border-bottom-color: #FFFFFF;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#klncyctlkj .gt_bottom_border {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#klncyctlkj .gt_col_headings {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
}

#klncyctlkj .gt_col_heading {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 6px;
  padding-left: 5px;
  padding-right: 5px;
  overflow-x: hidden;
}

#klncyctlkj .gt_column_spanner_outer {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: normal;
  text-transform: inherit;
  padding-top: 0;
  padding-bottom: 0;
  padding-left: 4px;
  padding-right: 4px;
}

#klncyctlkj .gt_column_spanner_outer:first-child {
  padding-left: 0;
}

#klncyctlkj .gt_column_spanner_outer:last-child {
  padding-right: 0;
}

#klncyctlkj .gt_column_spanner {
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: bottom;
  padding-top: 5px;
  padding-bottom: 5px;
  overflow-x: hidden;
  display: inline-block;
  width: 100%;
}

#klncyctlkj .gt_spanner_row {
  border-bottom-style: hidden;
}

#klncyctlkj .gt_group_heading {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  text-align: left;
}

#klncyctlkj .gt_empty_group_heading {
  padding: 0.5px;
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  vertical-align: middle;
}

#klncyctlkj .gt_from_md > :first-child {
  margin-top: 0;
}

#klncyctlkj .gt_from_md > :last-child {
  margin-bottom: 0;
}

#klncyctlkj .gt_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  margin: 10px;
  border-top-style: solid;
  border-top-width: 1px;
  border-top-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 1px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 1px;
  border-right-color: #D3D3D3;
  vertical-align: middle;
  overflow-x: hidden;
}

#klncyctlkj .gt_stub {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
}

#klncyctlkj .gt_stub_row_group {
  color: #333333;
  background-color: #FFFFFF;
  font-size: 100%;
  font-weight: initial;
  text-transform: inherit;
  border-right-style: solid;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
  padding-left: 5px;
  padding-right: 5px;
  vertical-align: top;
}

#klncyctlkj .gt_row_group_first td {
  border-top-width: 2px;
}

#klncyctlkj .gt_row_group_first th {
  border-top-width: 2px;
}

#klncyctlkj .gt_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#klncyctlkj .gt_first_summary_row {
  border-top-style: solid;
  border-top-color: #D3D3D3;
}

#klncyctlkj .gt_first_summary_row.thick {
  border-top-width: 2px;
}

#klncyctlkj .gt_last_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#klncyctlkj .gt_grand_summary_row {
  color: #333333;
  background-color: #FFFFFF;
  text-transform: inherit;
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
}

#klncyctlkj .gt_first_grand_summary_row {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-top-style: double;
  border-top-width: 6px;
  border-top-color: #D3D3D3;
}

#klncyctlkj .gt_last_grand_summary_row_top {
  padding-top: 8px;
  padding-bottom: 8px;
  padding-left: 5px;
  padding-right: 5px;
  border-bottom-style: double;
  border-bottom-width: 6px;
  border-bottom-color: #D3D3D3;
}

#klncyctlkj .gt_striped {
  background-color: rgba(128, 128, 128, 0.05);
}

#klncyctlkj .gt_table_body {
  border-top-style: solid;
  border-top-width: 2px;
  border-top-color: #D3D3D3;
  border-bottom-style: solid;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
}

#klncyctlkj .gt_footnotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#klncyctlkj .gt_footnote {
  margin: 0px;
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#klncyctlkj .gt_sourcenotes {
  color: #333333;
  background-color: #FFFFFF;
  border-bottom-style: none;
  border-bottom-width: 2px;
  border-bottom-color: #D3D3D3;
  border-left-style: none;
  border-left-width: 2px;
  border-left-color: #D3D3D3;
  border-right-style: none;
  border-right-width: 2px;
  border-right-color: #D3D3D3;
}

#klncyctlkj .gt_sourcenote {
  font-size: 90%;
  padding-top: 4px;
  padding-bottom: 4px;
  padding-left: 5px;
  padding-right: 5px;
}

#klncyctlkj .gt_left {
  text-align: left;
}

#klncyctlkj .gt_center {
  text-align: center;
}

#klncyctlkj .gt_right {
  text-align: right;
  font-variant-numeric: tabular-nums;
}

#klncyctlkj .gt_font_normal {
  font-weight: normal;
}

#klncyctlkj .gt_font_bold {
  font-weight: bold;
}

#klncyctlkj .gt_font_italic {
  font-style: italic;
}

#klncyctlkj .gt_super {
  font-size: 65%;
}

#klncyctlkj .gt_footnote_marks {
  font-size: 75%;
  vertical-align: 0.4em;
  position: initial;
}

#klncyctlkj .gt_asterisk {
  font-size: 100%;
  vertical-align: 0;
}

#klncyctlkj .gt_indent_1 {
  text-indent: 5px;
}

#klncyctlkj .gt_indent_2 {
  text-indent: 10px;
}

#klncyctlkj .gt_indent_3 {
  text-indent: 15px;
}

#klncyctlkj .gt_indent_4 {
  text-indent: 20px;
}

#klncyctlkj .gt_indent_5 {
  text-indent: 25px;
}
</style>
<table class="gt_table" style="table-layout: fixed;" data-quarto-disable-processing="false" data-quarto-bootstrap="false">
  <colgroup>
    <col/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
    <col/>
    <col style="width:100px;"/>
  </colgroup>
  <thead>
    <tr class="gt_heading">
      <td colspan="23" class="gt_heading gt_title gt_font_normal" style>Cluster analysis of divertable attendances</td>
    </tr>
    <tr class="gt_heading">
      <td colspan="23" class="gt_heading gt_subtitle gt_font_normal gt_bottom_border" style>Shows benchmark of all attendance types, the entire cohort and then clustered breakdowns</td>
    </tr>
    <tr class="gt_col_headings gt_spanner_row">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="2" colspan="1" scope="col" id="Total">Total</th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="10" scope="colgroup" id="&lt;strong&gt;Age Group of Patient&lt;/strong&gt;">
        <span class="gt_column_spanner"><strong>Age Group of Patient</strong></span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="&lt;strong&gt;Arrival Time at Hospital&lt;/strong&gt;">
        <span class="gt_column_spanner"><strong>Arrival Time at Hospital</strong></span>
      </th>
      <th class="gt_center gt_columns_top_border gt_column_spanner_outer" rowspan="1" colspan="6" scope="colgroup" id="&lt;strong&gt;Travel Time to Hospital&lt;/strong&gt;">
        <span class="gt_column_spanner"><strong>Travel Time to Hospital</strong></span>
      </th>
    </tr>
    <tr class="gt_col_headings">
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="0-18">0-18</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="19-45">19-45</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="46-65">46-65</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="66-85">66-85</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="86 +">86 +</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Wkday 9am - 6pm">Wkday 9am - 6pm</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Wkday Ouside Hrs">Wkday Ouside Hrs</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Weekend">Weekend</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Under 30 mins">Under 30 mins</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Over 30 mins">Over 30 mins</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_right" rowspan="1" colspan="1" scope="col" id="Unknown">Unknown</th>
      <th class="gt_col_heading gt_columns_bottom_border gt_left" rowspan="1" colspan="1" scope="col" id="Chart">Chart</th>
    </tr>
  </thead>
  <tbody class="gt_table_body">
    <tr class="gt_group_heading_row">
      <th colspan="23" class="gt_group_heading" scope="colgroup" id="Total across all attendance types for comparison">Total across all attendance types for comparison</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Total across all attendance types for comparison  tot" class="gt_row gt_right">2244</td>
<td headers="Total across all attendance types for comparison  0-18" class="gt_row gt_right">3.9% (87)</td>
<td headers="Total across all attendance types for comparison  xperc_0-18_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:3.87700534759358%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  19-45" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_19-45_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  45-65" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_45-65_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  66-85" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_66-85_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  86 +" class="gt_row gt_right">0.0% (0)</td>
<td headers="Total across all attendance types for comparison  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  open" class="gt_row gt_right">62.5% (1403)</td>
<td headers="Total across all attendance types for comparison  xperc_open_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:62.5222816399287%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  ooo" class="gt_row gt_right">14.4% (324)</td>
<td headers="Total across all attendance types for comparison  xperc_ooo_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:14.4385026737968%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  wkend" class="gt_row gt_right">23.0% (517)</td>
<td headers="Total across all attendance types for comparison  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:23.0392156862745%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  trav_count_0" class="gt_row gt_right">17.3% (388)</td>
<td headers="Total across all attendance types for comparison  xperc_trav_count_0_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:17.2905525846702%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  trav_count_1" class="gt_row gt_right">79.8% (1791)</td>
<td headers="Total across all attendance types for comparison  xperc_trav_count_1_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:79.8128342245989%;height:16px;'></div></div></td>
<td headers="Total across all attendance types for comparison  trav_count_2" class="gt_row gt_right">2.9% (65)</td>
<td headers="Total across all attendance types for comparison  xperc_trav_count_2_c" class="gt_row gt_left"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:2.89661319073084%;height:16px;'></div></div></td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="23" class="gt_group_heading" scope="colgroup" id="Total for divertable attendances">Total for divertable attendances</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Total for divertable attendances  tot" class="gt_row gt_right" style="background-color: #D3D3D3;">9</td>
<td headers="Total for divertable attendances  0-18" class="gt_row gt_right" style="background-color: #D3D3D3;">0.0% (0)</td>
<td headers="Total for divertable attendances  xperc_0-18_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  19-45" class="gt_row gt_right" style="background-color: #D3D3D3;">66.7% (6)</td>
<td headers="Total for divertable attendances  xperc_19-45_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:66.6666666666667%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  45-65" class="gt_row gt_right" style="background-color: #D3D3D3;">11.1% (1)</td>
<td headers="Total for divertable attendances  xperc_45-65_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:11.1111111111111%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  66-85" class="gt_row gt_right" style="background-color: #D3D3D3;">0.0% (0)</td>
<td headers="Total for divertable attendances  xperc_66-85_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  86 +" class="gt_row gt_right" style="background-color: #D3D3D3;">22.2% (2)</td>
<td headers="Total for divertable attendances  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:22.2222222222222%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  open" class="gt_row gt_right" style="background-color: #D3D3D3;">44.4% (4)</td>
<td headers="Total for divertable attendances  xperc_open_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:44.4444444444444%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  ooo" class="gt_row gt_right" style="background-color: #D3D3D3;">11.1% (1)</td>
<td headers="Total for divertable attendances  xperc_ooo_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:11.1111111111111%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  wkend" class="gt_row gt_right" style="background-color: #D3D3D3;">44.4% (4)</td>
<td headers="Total for divertable attendances  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:44.4444444444444%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  trav_count_0" class="gt_row gt_right" style="background-color: #D3D3D3;">0.0% (0)</td>
<td headers="Total for divertable attendances  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  trav_count_1" class="gt_row gt_right" style="background-color: #D3D3D3;">100.0% (9)</td>
<td headers="Total for divertable attendances  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:100%;height:16px;'></div></div></td>
<td headers="Total for divertable attendances  trav_count_2" class="gt_row gt_right" style="background-color: #D3D3D3;">0.0% (0)</td>
<td headers="Total for divertable attendances  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #D3D3D3;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td></tr>
    <tr class="gt_group_heading_row">
      <th colspan="23" class="gt_group_heading" scope="colgroup" id="Cluster groups for divertable attendances to identify correlations">Cluster groups for divertable attendances to identify correlations</th>
    </tr>
    <tr class="gt_row_group_first"><td headers="Cluster groups for divertable attendances to identify correlations  tot" class="gt_row gt_right" style="background-color: #DADEDF;">4</td>
<td headers="Cluster groups for divertable attendances to identify correlations  0-18" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_0-18_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  19-45" class="gt_row gt_right" style="background-color: #DADEDF;">50.0% (2)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_19-45_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:50%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  45-65" class="gt_row gt_right" style="background-color: #DADEDF;">20.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_45-65_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:20%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  66-85" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_66-85_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  86 +" class="gt_row gt_right" style="background-color: #DADEDF;">20.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:20%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  open" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_open_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  ooo" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_ooo_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  wkend" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (4)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_0" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_1" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (4)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_2" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td></tr>
    <tr><td headers="Cluster groups for divertable attendances to identify correlations  tot" class="gt_row gt_right" style="background-color: #DADEDF;">4</td>
<td headers="Cluster groups for divertable attendances to identify correlations  0-18" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_0-18_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  19-45" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (4)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_19-45_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  45-65" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_45-65_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  66-85" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_66-85_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  86 +" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  open" class="gt_row gt_right" style="background-color: #DADEDF;">80.0% (3)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_open_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:80%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  ooo" class="gt_row gt_right" style="background-color: #DADEDF;">20.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_ooo_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:20%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  wkend" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_0" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_1" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (4)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_2" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td></tr>
    <tr><td headers="Cluster groups for divertable attendances to identify correlations  tot" class="gt_row gt_right" style="background-color: #DADEDF;">1</td>
<td headers="Cluster groups for divertable attendances to identify correlations  0-18" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_0-18_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  19-45" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_19-45_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  45-65" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_45-65_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  66-85" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_66-85_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  86 +" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_86 +_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#005EB8;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  open" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_open_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  ooo" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_ooo_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  wkend" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_wkend_c" class="gt_row gt_left" style="border-right-width: 2px; border-right-style: solid; border-right-color: blue; background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#ED8B00;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_0" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_0_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_1" class="gt_row gt_right" style="background-color: #DADEDF;">100.0% (1)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_1_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:100%;height:16px;'></div></div></td>
<td headers="Cluster groups for divertable attendances to identify correlations  trav_count_2" class="gt_row gt_right" style="background-color: #DADEDF;">0.0% (0)</td>
<td headers="Cluster groups for divertable attendances to identify correlations  xperc_trav_count_2_c" class="gt_row gt_left" style="background-color: #DADEDF;"><div style='flex-grow:1;margin-left:8px;background:#E8EDEE;'><div style='background:#009639;width:0%;height:16px;'></div></div></td></tr>
  </tbody>
  
  <tfoot class="gt_footnotes">
    <tr>
      <td class="gt_footnote" colspan="23"> <em>Data taken from ECDS</em></td>
    </tr>
  </tfoot>
</table>
</div>
```

*Explanation of cluster groups.*  

The largest cluster of this cohort is made of **4** patients whose strongest feature is that they **arrive at the weekend** and that they **live more than 30 minutes travel time away** and **are young adults (19-45)**.   

The second largest cluster of this cohort is made of **4** patients whose strongest feature is that they **are young adults (19-45)** and that they **live more than 30 minutes travel time away** and **arrive Monday / Friday  9am to 6pm**.   

The final cluster of this cohort is made of **1** patients whose strongest feature is that they **are older people (86+)** and that they **arrive Monday / Friday  9am to 6pm** and **live more than 30 minutes travel time away**.   

#### Environmental






