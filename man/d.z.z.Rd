% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/d.z.z.R
\name{d.z.z}
\alias{d.z.z}
\title{d.z.z}
\usage{
d.z.z(z, sig = NA, n, a = 0.05)
}
\arguments{
\item{z}{z statistic}

\item{sig}{population standard deviation}

\item{n}{sample size}

\item{a}{significance level}
}
\description{
This function displays d for z-scores when all you have is the z-statistics.
The normoal confidence interval is also provided if you have sigma.
If sigma is left blank, then you will not see a confidence interval.
}
\examples{
d.z.z(z = 1.25, sig = 3, n = 10, a = .05)
}
\keyword{effect}
\keyword{size,}
\keyword{z-test}
