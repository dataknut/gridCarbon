% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_nzGenMix.R
\name{get_nzGenMix}
\alias{get_nzGenMix}
\title{Get NZ half-hourly generation data by source}
\usage{
get_nzGenMix(
  path = "~/Dropbox/data/NZ_ElecAuth/",
  years = "2021",
  months = seq(1, 12, 1),
  gridDataURL = "https://www.emi.ea.govt.nz/Wholesale/Datasets/Generation/Generation_MD/"
)
}
\arguments{
\item{path}{the path we may have saved files in before as \code{path/raw}, \code{path/processed/monthly} etc}

\item{years}{the years to get}

\item{months}{the months to get}
}
\description{
\code{get_nzGenMix()} downloads and cleans the NZ historic half-hourly wholesale generation data.
}
\details{
This is regularly updated at https://www.emi.ea.govt.nz/Wholesale/Datasets/Generation/Generation_MD

The data is available as monthly datasets so the function iteratively downloads, cleans and combines them.
These are not in pretty form so we clean them up and save them as monthly and yearly files.
The code attempts to be clever about not downloading files it already has.
}
\seealso{
Other data: 
\code{\link{process_nzGenMix}()}

Other grid: 
\code{\link{process_nzGenMix}()}

Other NZ: 
\code{\link{process_nzGenMix}()}
}
\author{
Ben Anderson, \email{b.anderson@soton.ac.uk} (original)
}
\concept{NZ}
\concept{data}
\concept{grid}
