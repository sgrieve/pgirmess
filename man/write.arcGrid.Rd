\name{write.arcGrid}
\alias{write.arcGrid}
\title{ Writes an ArcInfo ASCII grid from a matrix or data frame, with x, y, z values.}
\description{
  Writes an ArcInfo ASCII grid from a matrix or data frame, with x, y, z values
}
\usage{
write.arcGrid(xyz, file, zcol = 3, xcol = 1, ycol = 2, NODATA = -9999)
}

\arguments{
  \item{xyz}{ a matrix or a data frame with x, y, z values }
  \item{file}{ a character string naming the file to write to }
  \item{zcol}{ the column number for the z-axis }
  \item{xcol}{ the column number for the x-axis }
  \item{ycol}{ the column number for the y-axis }
  \item{NODATA}{ the value for no data }
}
\details{
  A "gap stopper" function that can be used eg to export 2D kernel densities or any object for which a raster representation make sense. Such file can be imported on-the-fly from FWTools (Open Source GIS Binary Kit for Windows and Linux) <http://fwtools.maptools.org/>, if no data is a number. This plateform can export to Gtiff format readable with ArcGIS. The ESRI ArcToolBox does not read the "ArcInfo ASCII grid file" for some reasons.  
}
\value{
  An ArcInfo ASCII grid file
}

\author{ Written by Roger Bivand for his students based on code by Edzer Pebesma. }

\examples{
library(splancs)
data(bodmin)   
mykernel<-kernel2d(as.points(bodmin), bodmin$poly, h0=2, nx=100, ny=100)
attributes(mykernel$z)<-NULL
mykernel$z[is.na(mykernel$z)]<--9999
mydata<-cbind(expand.grid(mykernel$x,mykernel$y),mykernel$z)
write.arcGrid(mydata,file="mytextgrid",NODATA=-9999)
}
\keyword{ utilities }
