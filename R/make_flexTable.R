#' Make a flex table
#'
#' `make_flexTable()` builds a flextable using our preferred defaults.
#' It returns the flextable so you can then change anything.
#'
#' @param df the data frame or data.table to make into a table
#' @param cap a caption
#' @param digits the number of digits to include on numeric values (aplies to all numeric colums)
#'
#' @author Ben Anderson, \email{b.anderson@@soton.ac.uk}
#' @import flextable
#' @export
#' @family utils
#'
make_flexTable <- function(df, caption = "caption", digits = 1){
  # makes a pretty flextable - see https://cran.r-project.org/web/packages/flextable/index.html
  ft <- flextable::flextable(df)
  ft <- colformat_double(ft, digits = digits)
  ft <- fontsize(ft, size = 9)
  ft <- fontsize(ft, size = 10, part = "header")
  ft <- set_caption(ft, caption = caption)
  return(ft)
}
