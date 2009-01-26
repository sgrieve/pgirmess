\name{shannon}
\alias{shannon}
\title{ Computes Shannon's and equitability indices}
\description{
  Computes Shannon's and equitability indices
}
\usage{
shannon(vect, proba=TRUE)
}

\arguments{
  \item{vect}{ a probability vector whose sum = 1 or a frequency vector}
  \item{proba}{ FALSE if the vector is frequencies and not probabilities }
}
\details{
  Computes Shannon's and equitability indices. The vetor passed can be a probability vector whose sum equal 1 or a vector of frequencies (e.g. the number of food item of each category). In this case the argument proba must be set to FALSE.
}
\value{
  A vector of two values: Shannon's and equitability indices
}


\seealso{ \code{\link{shannonbio}} }
\examples{

x<-c(0.1,0.5,0.2,0.1,0.1)
sum(x)
shannon(x)

x<-rpois(10,6)
shannon(x, proba=FALSE)


}
\keyword{ misc }
