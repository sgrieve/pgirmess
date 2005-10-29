\name{piankabio}
\alias{piankabio}
\title{ Computes the Pianka's index of niche overlap }
\description{
  Computes the Pianka's index of niche overlap
}
\usage{
piankabio(dataframe1, dataframe2)
}

\arguments{
  \item{dataframe1}{ a data frame of two columns: column 1 = dietary category, column 2 = biomass }
  \item{dataframe2}{ a data frame of two columns: column 1 = dietary category, column 2 = biomass  }
}
\details{
  Computes the Pianka's index of niche overlap
}
\value{
  Return the Pianka's index
}
\references{ to do }
\author{ Patrick Giraudoux <pgiraudo@univ-fcomte.fr> }

\seealso{ \code{\link{piankabioboot}} }
\examples{

data(preybiom)
attach(preybiom)
jackal<-preybiom[site=="Y" & sp=="C",5:6]
genet<-preybiom[site=="Y" & sp=="G",5:6]

piankabio(jackal,genet)
  }
}
\keyword{ misc }% at least one, from doc/KEYWORDS
