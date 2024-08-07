% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/maivefunction.r
\name{maive}
\alias{maive}
\title{R code for MAIVE}
\usage{
maive(
  dat = dat,
  method = method,
  weight = weight,
  instrument = instrument,
  studylevel = studylevel,
  AR = AR
)
}
\arguments{
\item{dat}{data with columns bs, sebs, Ns, study_id (optional)}

\item{method}{1 FAT-PET, 2 PEESE, 3 PET-PEESE, 4 EK}

\item{AR}{Anderson Rubin corrected confidence interval for weak instruments (only for unweighted MAIVE versions of PET, PEESE and PET-PEESE, not available for fixed effects): 0 no, 1 yes

standard estimator: same option as for MAIVE but weighted by inverse variance and not instrumented}

\item{weighting}{0 no weights, 1 standard weights, 2 adjusted weights}

\item{instrumenting}{1 yes, 0 no}

\item{correlation}{correlation at study level: 0 none, 1 fixed effects, 2 cluster}
}
\value{
MAIVE meta-estimate and standard error

Hausman type test: comparison between MAIVE and standard version

when instrumenting: heteroskedastic robust F-test of the first step
      instrumented standard errors
}
\description{
R package for MAIVE: "Spurious Precision in Meta-Analysis of Observational Research" by Zuzana Irsova, Pedro Bom, Tomas Havranek, and Heiko Rachinger
}
\details{
data dat can be imported from an excel file via: dat <- read_excel("inputdata.xlsx") and consists of: 
\itemize{
  \item estimates: bs
  \item standard errors: sebs
  \item number of observations: Ns
  \item optional: study_id
}
default option for MAIVE: MAIVE-PET-PEESE, unweighted, instrumented
}
