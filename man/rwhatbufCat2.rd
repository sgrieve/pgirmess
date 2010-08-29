\name{rwhatbufCat2}
\alias{rwhatbufCat2}
\title{Analyses the contents of a raster file readable with rgdal of categorical values within various buffer sizes centred on points }
\description{Analyses the contents of a raster file readable with rgdal of categorical values within various buffer sizes centred on points }

\usage{rwhatbufCat2(rast, sites, bufsizes, att=1)}

\arguments{
  \item{rast}{name of the raster file readable with rgdal to analyse}
  \item{sites}{object of class \code{\link[sp]{SpatialPointsDataFrame}} containing the points on which buffers must be centered}
  \item{bufsizes}{a vector of buffer radii, e.g. c(500, 1000, 1500)}
  \item{att}{column number of the attribute variable}
}

\details{
This function does not load the full raster file into the memory but loads sequentially subsets corresponding to the size of each buffer only. This allows proceeding massive rasters that cannot be loaded in full into RAM. It generates a list of lists giving for each buffer size (top level of the list of lists) the number of pixels of each category value within the buffer for each point site.
}

\value{ A list of lists giving for each buffer size (top level of the list of lists) the number of pixels of each category value within the buffe for each point site}

\seealso{ \code{\link[pgirmess]{rwhatbufNum}}, \code{\link[pgirmess]{rwhatpoly}}, \code{\link[pgirmess]{rwhatbufCat}} }

\examples{

library(sp)

myrastername<-system.file("pictures/SP27GTIF.TIF", package = "rgdal")[1]

mylocations<-structure(list(x = c(694728, 684662, 702339, 691819, 700091), y = c(1906654, 1886491, 1884426, 1884373, 1886872)), .Names = c("x", "y"), row.names = c(NA, -5L), class = "data.frame")
coordinates(mylocations)<-~x+y

result<-rwhatbufCat2(myrastername,mylocations,c(500,1000))

result[[1]] # results for buffer 500 (5 buffer centers)
result[[2]] # results for buffer 1000 (5 buffer centers)

}

\keyword{spatial}

