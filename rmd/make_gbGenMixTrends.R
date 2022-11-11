# make the GB grid carbon report

library(here)
  rmarkdown::render(input = paste0(here::here("rmd", "gbGenMixTrends"), ".Rmd"),
                    output_file = paste0(here::here("docs/gbGenMixTrends.html"))
  )

