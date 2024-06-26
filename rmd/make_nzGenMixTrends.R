# make the GB grid carbon report
library(gridCarbon)

# make sure we have all the data
# comes in multiple files - load them in the .rmd
gridCarbon::get_nzGenMix(years = seq(2020,2024,1))

# May 2024 data appears to be a duolicate of April 2024

library(here)
rmarkdown::render(input = paste0(here::here("rmd", "nzGenMixTrends"), ".Rmd"),
                  output_file = paste0(here::here("docs/nzGenMixTrends.html"))
)

