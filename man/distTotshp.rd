\name{distTotshp}
\alias{distTotshp}

\title{ Computes the total length of the lines of an output of 'read.shape' from maptools. }
\description{
  Computes the total length of the lines of an output of 'read.shape' from maptools.
}
\usage{
distTotshp(lines.shp,decdeg=FALSE)
}

\arguments{
  \item{lines.shp}{ A list of shapes of class ShapeList. The list must be of type "line".  }
  \item{decdeg}{ TRUE if point coordinates are longitude-latitude decimal degrees, in which case distances are measured in meters  }
}
\details{
  Requires the library maptools.
  If degdec is FALSE (default), distance computed is Euclidian. Units depends on the coordinate systems.
  If decdeg = TRUE, D = 1852 * 60 * (180/pi) * acos ( sin(la1) * sin(la2) + cos(la1) * cos(la2) * cos(abs(lg1 - lg2)).
  This method calculates the great circle distance, is based on spherical trigonometry, and assumes that:
    \itemize{
        \item 1 minute of arc is 1 nautical mile 
        \item 1 nautical mile is 1.852 km
    }
}
\value{
  A numeric distance.
}

\author{ Patrick Giraudoux <pgiraudo@univ-fcomte.fr> }

\seealso{ \code{\link{distNode}}, \code{\link{distTot}}, \code{\link{distSeg}},\code{\link{distPolylines}} }
\examples{

 # see example of Norwegian rivers in library maptools: ?Map2lines
 library(maptools)
 
 try4 <- read.shape(system.file("shapes/fylk-val.shp", package="maptools")[1])
 
 distTotshp(try4)

}
\keyword{ spatial }
