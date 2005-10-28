\name{val4symb}
\alias{val4symb}

\title{ Centers and provides absolute values and colors for negative and positive values}
\description{
  Centers a variable and provides absolute values and different colors for negative and positive values
}
\usage{
val4symb(x, col = c("blue", "red"), ...)
}

\arguments{
  \item{x}{ a numeric vector}
  \item{col}{ a character vector of 2 values, default=c("blue","red"), blue for <0, red for >=0 }
  \item{\dots}{ other parameters eg to pass to scale() }
}

\value{

  A list with
  \item{size }{the absolute values}
  \item{col }{a vector of colors}

}

\author{ Patrick Giraudoux, pgiraudo@univ-fcomte.fr }

\seealso{ \code{\link{symbols}} }
\examples{
x<-rnorm(30)
y<-rnorm(30)

z<-val4symb(rnorm(30))
symbols(x,y,circle=z$size,inches=0.2,bg=z$col)

z<-val4symb(rnorm(30),col=c("green","violet"))
symbols(x,y,circle=z$size,inches=0.2,bg=z$col)
}
\keyword{ color }
\keyword{ dplot }
