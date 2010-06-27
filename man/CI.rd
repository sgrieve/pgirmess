\name{CI}
\alias{CI}

\title{Confidence interval of percentages}
\description{
  Provides a n x 2 matrix with the lower limit (column 1) and upper limit (column 2) of the 95 percent confidence interval of percentages
}
\usage{
CI(x, y, totrials = FALSE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{ a vector with the number of positive observations }
  \item{y}{ a vector of the same length as x with the number of negative observations, or of the total number of observations }
  \item{totrials}{ if false (the default) y is the number of negative observations; if true, y is the total number of observations }
}
\details{
  Wrapper of prop.test(). 
}
\value{
  A matrix of length(x) rows and 2 columns. Column 1: lower limit; column 2: upper limit of the 95 percent confidence interval
}

\seealso{ \code{\link{prop.test}}}
\examples{

x<-c(2,10,7,8,7) # eg: number of positive cases
y<-c(56,22,7,20,5)# eg: number of negative cases
CI(x,y)

x<-c(2,10,7,8,7) # eg: number of positive cases
y<-c(4,11,7,16,10)# eg: total number of cases
CI(x,y,totrials=TRUE)

}
\keyword{ htest }% at least one, from doc/KEYWORDS
