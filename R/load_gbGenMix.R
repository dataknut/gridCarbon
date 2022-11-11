#' Make a flex table
#'
#' `load_gbGenMix()` loads the GB NG-ESO Historic Generation Mix & Carbon Intensity data.
#'
#' This is regularly updated at https://data.nationalgrideso.com/carbon-intensity1/historic-generation-mix
#'
#' The function checks if the version of the data we have stored at `dataPath`
#' (if we have it) is olderThan x days. If so it re-downloads it and tries to save
#' it at `dataPath`. It will attempt to create `dataPath` if it doesn't exist.
#'
#' @param url the url to the NG-ESO data file at https://data.nationalgrideso.com/carbon-intensity1/historic-generation-mix.
#' This changes from time to time so best passed as a parameter.
#' @param localFile the path the locally held data (if it exists). File name of
#' `df_fuel_ckan.csv` (as per original) is assumed.
#' @param olderThan if the most recent date in the local data is older than this,
#' re-download. Default is 14.
#'
#' @author Ben Anderson, \email{b.anderson@@soton.ac.uk}
#' @import flextable
#' @export
#' @family utils data
#'
load_gbGenMix <- function(url, dataPath, olderThan = 14){
  # load from file
  lf <- paste0(dataPath, "df_fuel_ckan.csv")
  if(file.exists(lf)){
    dt <- data.table::fread(lf)
    dt[, dv_dateTime := lubridate::as_datetime(DATETIME)] # proper date time
    # check age and if more than olderThan days, re-download
    maxDate <- max(as.Date(dt$dv_dateTime))
    dateDiff <- lubridate::today() - maxDate
    if(dateDiff > olderThan){
      message("Most recent date in local version of data is ",
            maxDate, " (", dateDiff ," days ago) but olderThan = ",olderThan," ...re-downloading.")
      dt <- data.table::fread(url)
      } else{
        message("Most recent date in local version of data is ",
                maxDate, " (", dateDiff ," days ago)... using that.")
      }
  } else{
    # no data file
    message("No local data file...re-downloading.")
    dt <- data.table::fread(url)
  }
  # save it for later
  # so next time we run this function we might not have to download it
  if(!dir.exists(dataPath)){
    dir.create(dataPath, recursive = TRUE)
  }
  data.table::fwrite(dt, file = paste0(dataPath, "df_fuel_ckan.csv"))
  return(dt)
}
