\name{write.pts2grass}
\alias{write.pts2grass}

\title{ Convert a matrix of points coordinates (x,y) into an ascii GRASS vector file (lines). }
\description{
  Convert a matrix of points coordinates (x,y) into an ascii GRASS vector file (lines).
}
\usage{
write.pts2grass(poly.shp, name)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{poly.shp}{ A matrix or data.frame of points coordinates, column 1 = x, column 2 = y }
  \item{name}{ The name of the output file (ex: "monfichier.txt" }
}
\details{
  Write an ascii GRASS vector file (lines) that can be imported from GRASS.
}
\value{
  A file is written in the directory specified in filename or in the current working directory.
}

\author{ Patrick Giraudoux pgiraudo@univ-fcomte.fr }

\seealso{ \code{\link{write.cl2grass}} }

\examples{
x<-rnorm(30)
y<-rnorm(30)
write.pts2grass(cbind(x,y),"myfile.txt")
# check the new file "myfile.txt"in the working directory
 
}
\keyword{ utilities }
