\name{variogenv}
\alias{variogenv}

\title{ Envelops for empirical variograms based on permutations}

\description{
  Computes envelops for empirical variograms by permutation of the data values on the spatial locations.
}
\usage{
variogenv(formula, locations, data, R = 99,...)
}

\arguments{
  \item{formula}{ formula defining the response vector and (possible) regressors, in case of absence of regressors, use e.g. 'z~1' }
  \item{locations}{  spatial data locations: a formula with only the coordinate variables in the right hand (explanatory variable) side e.g. '~x+y' }
  \item{data}{ data frame where the names in formula are to be found }
  \item{R}{ number of simulations used to compute the envelope. Default to 99 }
  \item{\dots}{ further arguments to be passed }

}
\details{
     Data values are randomly allocated to the spatial locations. The
     empirical variogram is computed for each simulation using the same
     lags as for the variogram originally computed for the data. The
     envelops are computed by taking, at each lag, the maximum and
     minimum values of the variograms for the simulated data. A plot method do exist, see \code{\link[pgirmess]{plot.variogenv}}.
     'variogenv' is just a wrapper of the function \code{\link[gstat]{variogram}} of the gstat package 
     and is similar in its principle to the function \code{\link[geoR]{variog.mc.env}} of the geoR package.
}
\value{
  An object of class 'variogenv' inheriting from 'data.frame'. 

  \item{np }{the number of point pairs for this estimate}
  \item{dist }{the average distance of all point pairs considered for this estimate}
  \item{vgm.obs}{ the actual sample variogram estimate}
  \item{upper.lim}{ the upper limit of the enveloppe}
  \item{lower.lim}{ the lower limit of the enveloppe}
}
\references{

Pebesma, E.J., 2004. Multivariable geostatistics in S: the gstat package. Computers & Geosciences, 30: 683-691. \url{http://www.gstat.org/}

Information on the package 'geoR' can be found at: \url{http://www.est.ufpr.br/geoR}}

\author{ Patrick Giraudoux, patrick.giraudoux@univ-fcomte.fr }

\seealso{ \code{\link[pgirmess]{plot.variogenv}}, \code{\link[gstat]{variogram}}, \code{\link[geoR]{variog.mc.env}} }
\examples{
library(gstat)
data(meuse)
myvar<-variogenv(log(zinc)~1, loc=~x+y, meuse)
myvar
plot(myvar)

}

\keyword{ spatial }
