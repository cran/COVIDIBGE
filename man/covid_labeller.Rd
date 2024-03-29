% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/covid_labeller.R
\name{covid_labeller}
\alias{covid_labeller}
\title{Label categorical variables from PNAD COVID19 microdata}
\usage{
covid_labeller(data_covid, dictionary.file)
}
\arguments{
\item{data_covid}{A tibble of PNAD COVID19 microdata read with \code{read_covid} function.}

\item{dictionary.file}{The dictionary file for selected survey available on official website: (select a dictionary xls file) - \url{https://ftp.ibge.gov.br/Trabalho_e_Rendimento/Pesquisa_Nacional_por_Amostra_de_Domicilios_PNAD_COVID19/Microdados/Documentacao/}.}
}
\value{
A tibble with the data provided from PNAD COVID19 survey and its categorical variables as factors with related labels.
}
\description{
This function labels categorical variables from PNAD COVID19 microdata.
}
\note{
For more information, visit the survey official website <\url{https://www.ibge.gov.br/estatisticas/investigacoes-experimentais/estatisticas-experimentais/27946-divulgacao-semanal-pnadcovid1?t=o-que-e}> and consult the other functions of this package, described below.
}
\examples{
# Using data read from disk
data_path <- covid_example(path="exampledata.csv")
dictionary.path <- covid_example(path="dictionaryexample.xls")
covid.df <- read_covid(microdata=data_path, vars=c("C001","C002"))
covid.df <- covid_labeller(data_covid=covid.df, dictionary.file=dictionary.path)
\donttest{
# Downloading data
covid.df2 <- get_covid(year=2020, month=5, vars=c("C001","C002"),
                       labels=FALSE, deflator=FALSE, design=FALSE,
                       reload=TRUE, curlopts=list(), savedir=tempdir())
dictionary.path2 <- covid_example(path="dictionaryexample.xls")
covid.df2 <- covid_labeller(data_covid=covid.df2, dictionary.file=dictionary.path2)}
}
\seealso{
\link[COVIDIBGE]{get_covid} for downloading, labeling, deflating and creating survey design object for PNAD COVID19 microdata.\cr \link[COVIDIBGE]{read_covid} for reading PNAD COVID19 microdata.\cr \link[COVIDIBGE]{covid_deflator} for adding deflator variables to PNAD COVID19 microdata.\cr \link[COVIDIBGE]{covid_design} for creating PNAD COVID19 survey design object.\cr \link[COVIDIBGE]{covid_example} for getting the path of the PNAD COVID19 toy example files.
}
