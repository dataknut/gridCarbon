# test the UK NG ESO data we have
library(gridCarbon)
library(data.table)
library(ggplot2)
library(lubridate)
library(hms)
library(skimr)

source(here::here("env.R"))
dir.exists(repoParams$ukGridDataLoc) # set in env.R

gbGenMixUrl <- "https://data.nationalgrideso.com/backend/dataset/88313ae5-94e4-4ddc-a790-593554d8c6b9/resource/f93d1835-75bc-43e5-84ad-12472b180a98/download/df_fuel_ckan.csv"

dt <- gridCarbon::load_gbGenMix(url = gbGenMixUrl,
                         dataPath = repoParams$ukGridDataLoc,
                         olderThan = 7)
message("Data range from: ", min(dt_orig$dv_dateTime))
message("...to: ", max(dt_orig$dv_dateTime))

skimr::skim(dt)

# make long if needed
ldt <- melt(dt, id.vars = "DATETIME")

head(ldt)
table(ldt$variable)

