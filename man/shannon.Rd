\name{shannon}
\alias{shannon}
\title{ Computes Shannon's and equitability indices from a probability vector (sum = 1)}
\description{
  Computes Shannon's and equitability indices from a probability vector (sum = 1)
}
\usage{
shannon(vect)
}

\arguments{
  \item{vect}{ a probability vector of sum = 1 }
}
\details{
  Computes Shannon's and equitability indices from a probability vector (sum = 1)
}
\value{
  A vector of two values: Shannon's and equitability indices
}

\author{Patrick Giraudoux <pgiraudo@univ-fcomte.fr> }

\seealso{ \code{\link{shannonbio}} }
\examples{
x<-c(0.1,0.5,0.2,0.1,0.1)
shannon(x)
}
\keyword{ misc }% at least one, from doc/KEYWORDS
