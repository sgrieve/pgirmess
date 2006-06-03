\name{plot.variogenv}
\alias{plot.variogenv}


\title{ Plots empirical variogram and its envelop
}

\description{
   Plots empirical variogram and its randomized envelop from the output of the function 'variogenv'
}
\usage{

\method{plot}{variogenv}(x, txt=TRUE,txtcex=0.6,ylab,xlab,...)

}

\arguments{
  \item{x}{ an object of the class "variogenv"', typically an output of the function 'variogenv' }
  \item{txt}{ if TRUE (default), the number of paired points in each bin is displayed }
  \item{txtcex}{ character size expansion for txt }
  \item{xlab}{ label for the x axis }
  \item{ylab}{ label for the y axis }
  \item{\dots}{ further arguments to be passed }
}


\author{ Patrick Giraudoux, patrick.giraudoux@univ-fcomte.fr }

\seealso{ \code{\link[pgirmess]{variogenv}} }
\examples{
library(gstat)
data(meuse)
myvar<-variogenv(log(zinc)~1, loc=~x+y, meuse)
plot(myvar)

}

\keyword{ spatial }
