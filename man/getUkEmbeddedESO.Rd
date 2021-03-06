% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getUkEmbeddedESO.R
\name{getUkEmbeddedESO}
\alias{getUkEmbeddedESO}
\title{\code{getUkEmbeddedESO} gets the latest embedded generation update file from the UK Grid ESO data website. This is a modelled forecast
since the ESO has no visibility of these. It is embedded in a demand data file for some reason... We then need to add it to the 'old'
embedded data that we have downloaded manually. We do this when we clean it. Yes, at the time of writing it's a bit of a mess.}
\usage{
getUkEmbeddedESO(f, update)
}
\arguments{
\item{f}{the file to get (as a url suitable for data.table::fread())}

\item{update}{force an update}
}
\description{
\code{getUkEmbeddedESO} gets the latest embedded generation update file from the UK Grid ESO data website. This is a modelled forecast
since the ESO has no visibility of these. It is embedded in a demand data file for some reason... We then need to add it to the 'old'
embedded data that we have downloaded manually. We do this when we clean it. Yes, at the time of writing it's a bit of a mess.
}
\seealso{
Other data: 
\code{\link{alignDates}()},
\code{\link{cleanNZEmbEA}()},
\code{\link{cleanNZGridEA}()},
\code{\link{cleanNZGxpEA}()},
\code{\link{cleanUkEmbeddedESO}()},
\code{\link{cleanUkGridESO}()},
\code{\link{getNZEmbData}()},
\code{\link{getNZEmbMeta}()},
\code{\link{getNZGridEA}()},
\code{\link{getNZGridMeta}()},
\code{\link{getNZGxpEA}()},
\code{\link{getNZGxpMeta}()},
\code{\link{getUkGridESO}()},
\code{\link{loadEmbeddedGenData}()},
\code{\link{loadNZEAYearlyEmbeddedGenData}()},
\code{\link{loadNZEAYearlyGridGenData}()},
\code{\link{loadUKESOYearlyGenData}()},
\code{\link{makeNZYearlyData}()},
\code{\link{nzCalculateCO2e}()},
\code{\link{reshapeEmbeddedGenDT}()},
\code{\link{reshapeGenDT}()},
\code{\link{saveUkEmbeddedESO}()},
\code{\link{saveUkGridESO}()},
\code{\link{setEmbeddedGenTimePeriod}()},
\code{\link{setGridGenTimePeriod}()}

Other embedded: 
\code{\link{cleanNZEmbEA}()},
\code{\link{cleanUkEmbeddedESO}()},
\code{\link{getNZEmbMeta}()},
\code{\link{makeNZYearlyData}()},
\code{\link{saveUkEmbeddedESO}()}

Other uk: 
\code{\link{cleanUkEmbeddedESO}()},
\code{\link{cleanUkGridESO}()},
\code{\link{saveUkEmbeddedESO}()},
\code{\link{saveUkGridESO}()}
}
\author{
Ben Anderson, \email{b.anderson@soton.ac.uk} (original)
}
\concept{data}
\concept{embedded}
\concept{uk}
