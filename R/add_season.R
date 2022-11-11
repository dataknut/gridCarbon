#' Add season to a data.table depending on hemisphere
#'
#' `add_season()` returns a dt with hemisphere season (Winter, Spring, Summer, Autumn)
#' added - assume temperature latitudes
#'
#' @param dt the data table
#' @param dateVar the column in the dt which is a date that can be passed to lubridate::month()
#' @param h hemisphere: North (N) or South (S)?
#'
#' @author Ben Anderson, \email{b.anderson@@soton.ac.uk}
#' @export
#' @family utils
#'
add_season <- function(dt,dateVar,h){
  dt <- dt[, tmpM := lubridate::month(get(dateVar))] # sets 1 (Jan) - 12 (Dec). May already exist but we can't rely on it
  if(h == "S"){ # southern hemisphere
    dt <- dt[, dv_season := "Summer"] # easiest to set the default to be the one that bridges years
    dt <- dt[tmpM >= 3 & tmpM <= 5, dv_season := "Autumn"]
    dt <- dt[tmpM >= 6 & tmpM <= 8 , dv_season := "Winter"]
    dt <- dt[tmpM >= 9 & tmpM <= 11, dv_season := "Spring"]
    # re-order to make sense
    dt <- dt[, dv_season := factor(dv_season, levels = c("Spring", "Summer", "Autumn", "Winter"))]
  }
  if(h == "N"){ # northern hemisphere
    dt <- dt[, dv_season := "Winter"] # easiest to set the default to be the one that bridges years
    dt <- dt[tmpM >= 3 & tmpM <= 5, dv_season := "Spring"]
    dt <- dt[tmpM >= 6 & tmpM <= 8 , dv_season := "Summer"]
    dt <- dt[tmpM >= 9 & tmpM <= 11, dv_season := "Autumn"]
    # re-order to make sense
    dt <- dt[, dv_season := factor(dv_season, levels = c("Spring", "Summer", "Autumn", "Winter"))]
  }
  dt$tmpM <- NULL
  return(dt)
}
