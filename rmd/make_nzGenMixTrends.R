# make the GB grid carbon report
library(gridCarbon)

# make sure we have all the data
# comes in multiple files - load them in the .rmd
# data files prior to 2020 cause a code error - needs fixing
gridCarbon::get_nzGenMix(years = seq(2010,2025,1))

library(here)
rmarkdown::render(input = paste0(here::here("rmd", "nzGenMixTrends"), ".Rmd"),
                  output_file = paste0(here::here("docs/nzGenMixTrends.html"))
)

