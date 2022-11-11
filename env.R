# Keep all the main frequently re-used project parameters in here
# .Rprofile loads when the project is opened and sources this file

# The parameters are used in the test/example R scripts but not in the package
# itself.

# Package we need in this file
library(here)

# Package parameters ----

repoParams <- list() # params holder as a list. Sooooo much easier with tab complete

repoParams$repoLoc <- here::here() # try not to use this, use here() instead

# Data ----
# attempt to guess the platform & user
repoParams$info <- Sys.info()
repoParams$sysname <- repoParams$info[[1]]
repoParams$nodename <- repoParams$info[[4]]
repoParams$login <- repoParams$info[[6]]
repoParams$user <- repoParams$info[[7]]

repoParams$nzData <- "No idea, you need to edit env.R so I can find it!"
repoParams$ukData <- "No idea, you need to edit env.R so I can find it!"

# > Set data path ----
if((repoParams$user == "dataknut" | repoParams$user == "carsten" ) &
   repoParams$sysname == "Linux"){ # Otago CS RStudio server

  repoParams$GreenGrid <- path.expand("~/greenGridData/")
  repoParams$GreenGridData <- path.expand("~/greenGridData/cleanData/safe/")
  repoParams$censusData <- path.expand("~/greenGridData/externalData/nzCensus/") # fix for your platform
  repoParams$gxpData <- path.expand("~/greenGridData/externalData/EA_GXP_Data/") # fix for your platform
  repoParams$nzGridDataLoc <- paste0(repoParams$GreenGrid,
                                     "externalData/EA_Generation_Data/")
  repoParams$nzNonGridDataLoc <- paste0(repoParams$GreenGrid,
                                        "externalData/EA_Embedded_Generation_Data/")
  repoParams$nzData <- repoParams$GreenGridData
}
if(repoParams$user == "ben" & repoParams$sysname == "Darwin"){
  # Ben's laptop
  repoParams$GreenGrid <- path.expand("~/Dropbox/data/NZ_GREENGrid/")
  repoParams$GreenGridData <- path.expand("~/Dropbox/data/NZ_GREENGrid/safe/")
  repoParams$censusData <- path.expand("~/Dropbox/data/NZ_Census/") # fix for your platform
  repoParams$gxpData <- path.expand("~/Dropbox/data//NZ_EA_EMI/gxp/") # fix for your platform
  repoParams$nzGridDataLoc <- path.expand("~/Dropbox/data//NZ_EA_EMI/EA_Generation_Data/")
  repoParams$nzNonGridDataLoc <- path.expand("~/Dropbox/data//NZ_EA_EMI/EA_Embedded_Generation_Data/")
  repoParams$nzData <- repoParams$GreenGridData

  repoParams$ukData <- path.expand("~/Dropbox/data/UK_NGESO/")
  repoParams$ukGridDataLoc <- path.expand(paste0(repoParams$ukData, "genMix/"))
  repoParams$ukNonGridDataLoc <- path.expand(paste0(repoParams$ukData, "embeddedGen/"))

}
if(repoParams$user == "carsten.dortans" & repoParams$sysname == "Darwin"){
  # Carsten's laptop
  repoParams$GreenGridData <- path.expand("/Volumes/hum-csafe/Research Projects/GREEN Grid/cleanData/safe/")
  repoParams$nzGridDataLoc <- path.expand(paste0(repoParams$GreenGridData,
                                                 "/EA_Generation_Data/"))
  repoParams$nzNonGridDataLoc <- path.expand(paste0(repoParams$GreenGridData,
                                                    "/EA_Embedded_Generation_Data/"))
  repoParams$nzData <- repoParams$GreenGridData
}
if(repoParams$user == "ba1e12" & repoParams$sysname == "Linux" & repoParams$nodename == "srv02405"){
  # UoS RStudio server
  repoParams$ukData <- path.expand("/mnt/SERG_data/UK_National_Grid")
  repoParams$ukGridDataLoc <- path.expand(paste0(repoParams$ukData, "/gridGen/"))
  repoParams$ukNonGridDataLoc <- path.expand(paste0(repoParams$ukData, "/embeddedGen/"))
  repoParams$nzData <- path.expand("/mnt/SERG_data/NZ_EA_EMI")
  repoParams$nzGridDataLoc <- path.expand(paste0(repoParams$nzData, "/EA_Generation_Data/"))
  repoParams$nzNonGridDataLoc <- path.expand(paste0(repoParams$nzData, "/EA_Embedded_Generation_Data/"))
  repoParams$nzGxpDataLoc <- path.expand(paste0(repoParams$nzData, "/EA_GXP_Data/"))
}

# > Misc data ----
repoParams$bytesToMb <- 0.000001

# For .Rmd ----
# > Default yaml for Rmd ----

repoParams$myAlpha <- 0.1
repoParams$vLineAlpha <- 0.4
repoParams$vLineCol <- "red" # http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/#a-colorblind-friendly-palette
repoParams$myTextSize <- 4

repoParams$weAlpha <- 0.3 # weekend shaded rects on plots
repoParams$weFill <- "grey50"
repoParams$labelPos <- 0.9


message("We're ", repoParams$user, " using " , repoParams$sysname, " on ", repoParams$nodename)
message("NZ data path : ", repoParams$nzData)
message("Does it exist?")
dir.exists(repoParams$nzData)
message("UK data path : ", repoParams$ukData)
message("Does it exist?")
dir.exists(repoParams$ukData)
