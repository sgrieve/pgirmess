\name{write.kernel2points}
\alias{write.kernel2points}

\title{ Write a text file of X,Y coordinates and Z value from the output of 'kernel2d' (library splancs) }
\description{
  Write a text file of X,Y coordinates and Z value from the output of 'kernel2d' (library splancs) 
}
\usage{
write.kernel2points(kernoutput, filename)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{kernoutput}{ An object output of 'kernel2d' (library splancs) }
  \item{filename}{ a character string naming a file }
}
\details{
  Gives a file of points coordinates with z value (the result of the kernel function) that can be imported eg from ArcGIS. The suffix '.txt' is automatically added to 'filename'.
}
\value{
  A file is written in the directory specified in filename or in the current working directory. 
}

\author{ Patrick Giraudoux <pgiraudo@univ-fcomte.fr> }

\seealso{ \code{\link[splancs]{kernel2d}} }
\examples{
    library(splancs)
    data(bodmin)
    mykernel<-kernel2d(as.points(bodmin), bodmin$poly, h0=2, nx=100, ny=100)
    write.kernel2points(mykernel, "mypoints")
}
\keyword{ utilities }
