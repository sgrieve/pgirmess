\name{rwhatbufCat}
\alias{rwhatbufCat}
\title{Analyses the contents of a SpatialGridDataFrame of categorical values within various buffer sizes centred on points }
\description{Analyses the contents of a SpatialGridDataFrame of categorical values within various buffer sizes centred on points }

\usage{rwhatbufCat(rast, sites, bufsizes, att=1)}

\arguments{
  \item{rast}{object of class \code{\link[sp]{SpatialGridDataFrame}} to analyse}
  \item{sites}{ object of class \code{\link[sp]{SpatialPointsDataFrame}} containing the points on which buffers must be centered}
  \item{bufsizes}{a vector of buffer radii, e.g. c(500, 1000, 1500)}
  \item{att}{column number of the attribute variable}
}

\details{
 This function generates a data.frame with the frequency of each category of a raster map within various radius buffers centered on point sites. This is exactly the same code as rwhatbuf, now deprecated, of the earlier version of pgirbric.
}

\value{ a dataframe, with the buffer size as first column, the site ID as second column. The other colums are the pixel frequency of each category}

\seealso{ \code{\link[pgirmess]{rwhatbufNum}}, \code{\link[pgirmess]{rwhatpoly}}, \code{\link[pgirmess]{rwhatbufCat2}}}

\examples{

# raster creation
library(sp)
data(meuse.grid)
coordinates(meuse.grid) = ~x+y
gridded(meuse.grid) = TRUE

# random selection of points within the raster area
mypoints<-spsample(meuse.grid,n=10,type="random") # random points are appx 10, see spsample doc
mypoints<-SpatialPointsDataFrame(coordinates(mypoints),data.frame(id=1:nrow(mypoints@coords)))

image(meuse.grid,att=4,col=c("red","green","blue")) # soil map
plot(mypoints,add=TRUE) # points

rwhatbufCat(meuse.grid,mypoints,c(500,1000),att=4) # get the number of pixels of each category in each buffer

}

\keyword{spatial}
