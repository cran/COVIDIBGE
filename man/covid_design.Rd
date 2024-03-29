% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/covid_design.R
\name{covid_design}
\alias{covid_design}
\title{Create PNAD COVID19 survey object with its sample design}
\usage{
covid_design(data_covid)
}
\arguments{
\item{data_covid}{A tibble of PNAD COVID19 microdata read with \code{read_covid} function.}
}
\value{
An object of class \code{survey.design} or \code{svyrep.design} with the data from PNAD COVID19 and its sample design.
}
\description{
This function creates PNAD COVID19 survey object with its sample design for analysis using \code{survey} package functions.
}
\note{
For more information, visit the survey official website <\url{https://www.ibge.gov.br/estatisticas/investigacoes-experimentais/estatisticas-experimentais/27946-divulgacao-semanal-pnadcovid1?t=o-que-e}> and consult the other functions of this package, described below.
}
\examples{
# Using data read from disk
data_path <- covid_example(path="exampledata.csv")
dictionary.path <- covid_example(path="dictionaryexample.xls")
deflator.path <- covid_example(path="deflatorexample.xls")
covid.df <- read_covid(microdata=data_path, vars=c("C001","C002"))
covid.df <- covid_labeller(data_covid=covid.df, dictionary.file=dictionary.path)
covid.df <- covid_deflator(data_covid=covid.df, deflator.file=deflator.path)
\donttest{
covid.svy <- covid_design(data_covid=covid.df)
# Calculating proportion of people temporarily away from work
if (!is.null(covid.svy)) survey::svymean(x=~C002, design=covid.svy, na.rm=TRUE)}
\donttest{
# Downloading data
covid.df2 <- get_covid(year=2020, month=5, vars=c("C001","C002"),
                       labels=TRUE, deflator=TRUE, design=FALSE,
                       reload=TRUE, curlopts=list(), savedir=tempdir())
covid.svy2 <- covid_design(data_covid=covid.df2)
# Calculating proportion of people temporarily away from work
if (!is.null(covid.svy2)) survey::svymean(x=~C002, design=covid.svy2, na.rm=TRUE)}
}
\seealso{
\link[COVIDIBGE]{get_covid} for downloading, labeling, deflating and creating survey design object for PNAD COVID19 microdata.\cr \link[COVIDIBGE]{read_covid} for reading PNAD COVID19 microdata.\cr \link[COVIDIBGE]{covid_labeller} for labeling categorical variables from PNAD COVID19 microdata.\cr \link[COVIDIBGE]{covid_deflator} for adding deflator variables to PNAD COVID19 microdata.\cr \link[COVIDIBGE]{covid_example} for getting the path of the PNAD COVID19 toy example files.
}
