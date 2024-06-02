#' Get NZ half-hourly generation data by source
#'
#' `get_nzGenMix()` downloads and cleans the NZ historic half-hourly wholesale generation data.
#'
#' This is regularly updated at https://www.emi.ea.govt.nz/Wholesale/Datasets/Generation/Generation_MD
#'
#' The data is available as monthly datasets so the function iteratively downloads, cleans and combines them.
#' These are not in pretty form so we clean them up and save them as monthly and yearly files.
#' The code attempts to be clever about not downloading files it already has.
#'
#' @param path the path we may have saved files in before as `path/raw`, `path/processed/monthly` etc
#' @param years the years to get
#' @param months the months to get
#' @import data.table
#' @import curl
#' @import readr
#' @author Ben Anderson, \email{b.anderson@@soton.ac.uk} (original)
#' @export
#' @family data
#' @family grid
#' @family NZ
#'
get_nzGenMix <- function(path = "~/Dropbox/data/NZ_ElecAuth/", # default
                        years = "2021", # default
                        months = seq(1,12,1),
                        gridDataURL = "https://www.emi.ea.govt.nz/Wholesale/Datasets/Generation/Generation_MD/"
){
  message("Checking what we have already...")
  # path <- gcParams$nzGridDataLoc
  if(!dir.exists(paste0(path, "raw/"))){
    message("Creating ", paste0(path, "raw/"), " and getting data...")
    dir.create(paste0(path, "raw/"))
  }

  for(y in years){
    message("Checking year: ", y)
    for(month in months){
      message("Checking month: ", month)
      # y <- 2014
      # month <- 11
      # construct the filename
      if(nchar(month) == 1){
        # need to add 0 as prefix
        m <- paste0("0", month)
      } else {
        m <- month
      }
      if(lubridate::today() < as.Date(paste0(y, "-",m,"-", "01"))){
        break # clearly there won't be any data for future dates
      }
      eafName <- paste0(y, m,"_Generation_MD.csv") # what we see on the EA EMI
      # do we have it?
      fullFileName <- paste0(path, "raw/", eafName)
      if(file.exists(fullFileName)){
        # load it
        message("We already have", fullFileName, " skipping...")
      } else {
        # get it
        rFile <- paste0(gridDataURL,eafName)
        print(paste0("We don't have or need to refresh ", eafName))
        # use curl function to catch errors
        print(paste0("Trying to download ", rFile))
        req <- curl::curl_fetch_disk(rFile, "temp.csv") # https://cran.r-project.org/web/packages/curl/vignettes/intro.html
        if(req$status_code != 404){ #https://cran.r-project.org/web/packages/curl/vignettes/intro.html#exception_handling
          #dt <- data.table::fread(req$content) # breaks on 2014-11, why?
          df <- readr::read_csv(req$content)
          dt <- data.table::as.data.table(df)
          message("File downloaded successfully, saving as ", fullFileName)
          data.table::fwrite(dt, fullFileName) # keep as .csv
          # create long form
          dtl <- gridCarbon::process_nzGenMix(dt) # clean up to a dt - this does all the processing
          dtl <- dtl[, source := eafName]
          message("Converted to long form, saving it")
          rawfName <- paste0(y, "_",m,"_Generation_long.csv") # for easier filename filtering
          if(!dir.exists(paste0(path, "/processed/monthly/"))){
            dir.create(paste0(path, "/processed/monthly/"))
          }
          lf <- paste0(path, "/processed/monthly/", rawfName)
          data.table::fwrite(dtl, lf)
        } else {
          print(paste0("File download failed (Error = ", req$status_code, ") - does it exist at that location?"))
        }
      }
    }
  }
}

