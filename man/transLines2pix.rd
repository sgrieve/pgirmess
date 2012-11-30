\name{transLines2pix}
\alias{transLines2pix}

\title{ Convert a SpatialLines or a SpatialLinesDataFrame object into a list of line points at regular distance  }
\description{
  Convert a SpatialLines or a SpatialLinesDataFrame object into a list of line points at regular distance. This can be used e.g to discretize line transects into a regular line of points.
}
\usage{
transLines2pix(spldf,mindist=100)
}

\arguments{
  \item{spldf}{ A \code{\link[sp]{SpatialLines}} or a \code{\link[sp]{SpatialLinesDataFrame}} }
  \item{mindist}{the distance between two points (default to 100)  }
}
\details{
  This function can be used e.g to discretize line transects into a regular line of points.
}
\value{
  A list of geographical coordinates. Each element corresponds to one  \code{\link[sp]{Line}} of the  \code{\link[sp]{SpatialLines}}.
}

\seealso{ \code{\link{trans2pix}}, \code{\link{thintrack}}}

\examples{

# from the sp vignette:
     l1 = cbind(c(1,2,3),c(3,2,2))
     l1a = cbind(l1[,1]+.05,l1[,2]+.05)
     l2 = cbind(c(1,2,3),c(1,1.5,1))
     Sl1 = Line(l1)
     Sl1a = Line(l1a)
     Sl2 = Line(l2)
     S1 = Lines(list(Sl1, Sl1a), ID="a")
     S2 = Lines(list(Sl2), ID="b")
     Sl = SpatialLines(list(S1,S2))
     plot(Sl, col = c("red", "blue"))
     
     trpt<-transLines2pix(Sl,mindist=0.1)
     for(i in 1:length(trpt)) points(trpt[[i]])
}

\keyword{ utilities, spatial }
