\name{rwhatpoly}
\alias{rwhatpoly}
\title{Analyses the contents of a SpatialPixelsDataFrame or a SpatialGridDataFrame within polygons }
\description{Analyses the contents of a SpatialPixelsDataFrame or a SpatialGridDataFrame within polygons }

\usage{rwhatpoly(sgdf, SP, att=1, NAin=TRUE)}

\arguments{
  \item{sgdf}{object of class \code{\link[sp]{SpatialPixelsDataFrame}} or \code{\link[sp]{SpatialGridDataFrame}} to analyse}
  \item{SP}{ object of class \code{\link[sp]{SpatialPolygons}}}
  \item{att}{column number of the attribute variable}
  \item{NAin}{should NA values within polygons be counted (default to yes = TRUE)}
}

\details{
 This function generates a table with the frequency of each category of the raster (\code{\link[sp]{SpatialGridDataFrame}}) within each polygon of the \code{\link[sp]{SpatialPolygons}} object.
}

\value{A table. Each row is a polygon count (row name = polygon ID number), the last one the count of all values out of any polygons; each column is a raster category}

\seealso{ \code{\link[pgirmess]{rwhatbufCat}}, \code{\link[pgirmess]{rwhatbufNum}}}

\examples{


library(sp)
# raster creation

data(meuse.grid)
coordinates(meuse.grid) = ~x+y
gridded(meuse.grid) = TRUE

# SpatialPolygons creation
polylist <-
list(structure(c(180016, 180225, 180533, 180615, 180588, 180452, 
180034, 180016, 332182, 332319, 332518, 332418, 332074, 331774, 
331756, 332182), .Dim = c(8L, 2L)), structure(c(179907, 180325, 
180397, 180152, 179781, 179672, 179735, 179907, 331611, 331611, 
331266, 330931, 330967, 331266, 331466, 331611), .Dim = c(8L, 
2L)), structure(c(179499, 179971, 180343, 180161, 179753, 179418, 
179499, 330577, 330768, 330468, 330096, 330078, 330369, 330577
), .Dim = c(7L, 2L)))
SP<-SpatialPolygons(list(Polygons(list(Polygon(polylist[[1]])),ID="P1"),Polygons(list(Polygon(polylist[[2]])),ID="P2"),Polygons(list(Polygon(polylist[[3]])),ID="P3")),pO=as.integer(c(1,2,3)))

# raster and polygons display
image(meuse.grid,att=4,col=c("red","green","blue")) # soil map
plot(SP,add=TRUE)
text(coordinates(SP),sapply(SP@polygons,function(x) x@ID))

# extraction
rwhatpoly(meuse.grid,SP,att=4) # get the number of pixels of each soil category (column) in each polygon (rows)
rwhatpoly(meuse.grid,SP,att=4,NAin=FALSE)  # get the number of pixels of each soil category (column), NAs excluded, in each polygon (rows)

}

\keyword{spatial}

