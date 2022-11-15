#' Load NZ half-hourly generation data by source
#'
#' `process_nzGenMix()` processes the wide form files into a long form data.table that is easier to manipulate in R.
#'
#' We also fix the dateTimes.
#'
#' Note that rDateTime will be NA for the DST breaks which equate to TP49/50. We really dislike DST breaks.
#'
#' @param dt the raw unprocessed data as a data.table
#' @import data.table
#' @import lubridate
#' @author Ben Anderson, \email{b.anderson@@soton.ac.uk} (original)
#' @export
#' @family data
#' @family utility
#' @family grid
#' @family NZ
#'
process_nzGenMix <- function(dt){
  m_dt <- data.table::melt(dt,
                     id.vars=c("Site_Code","POC_Code","Nwk_Code", "Gen_Code",
                               "Fuel_Code", "Tech_Code","Trading_Date"),
                     variable.name = "Time_Period", # converts TP1-48/49/50 <- beware of these ref DST!
                     value.name = "kWh" # energy - see https://www.emi.ea.govt.nz/Wholesale/Datasets/Generation/Generation_MD/
  )
  # convert the given time periods (TP1 -> TP48, 49. 50) to hh:mm
  m_dt[, c("t","tp") := data.table::tstrsplit(Time_Period, "P")]
  m_dt[, mins := ifelse(as.numeric(tp)%%2 == 0, "45", "15")] # set to q past/to
  m_dt[, hours := floor((as.numeric(tp)+1)/2) - 1]
  m_dt[, strTime := paste0(hours, ":", mins, ":00")]
  m_dt_clean <- m_dt[!is.na(kWh)] # kWh = NA are the broken DST half hours
  m_dt_clean[, rTime :=  hms::as_hms(strTime)]

  # head(dt)
  m_dt_clean[, c("t","tp","mins","hours") := NULL]  #remove these now we're happy

  m_dt_clean[, rDate := as.Date(Trading_Date)] # fix the dates so R knows what they are
  m_dt_clean[, rDateTime := lubridate::ymd_hms(paste0(rDate, rTime))] # set full dateTime. Parsing failures are TP49/59
  # don't do this here - do it on data load (saves space)
  #dtl[, rDateTimeNZT := lubridate::force_tz(rDateTime,
  #                                                 tzone = "Pacific/Auckland")] # for safety in case run in another tz!
  # there will be parse errors in the above due to TP49 & TP50
  table(m_dt_clean[is.na(rDateTime)]$Time_Period)
  return(m_dt_clean)
}

