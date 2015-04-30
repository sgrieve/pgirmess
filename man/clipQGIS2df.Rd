\name{clipQGIS2df}
\alias{clipQGIS2df}

\title{
Change a copied QGIS attribute table of a point shapefile into a data.frame
}

\description{
Copying and attribute table of a shapefile in QGIS gives a clipboard file that can be read using 'read.delim("clipboard")'. The first column is in wkt_geometry format. If is a POINT geometry function converts this column into two columns giving the longitude and the latitude.
}

\usage{
clipQGIS2df(cb)
}

\arguments{
  \item{cb}{ A data.frame obtained from the copy of an attribute table of a QGIS shapefile}
}

\value{
A data.frame with the two first columns corresponding to longitude and latitude, and the foolowing to the shapefile attributes.
}

% \seealso{ \code{\link[rgeos]{readWKT}} }


\examples{
myclip <-
structure(list(wkt_geom = c("POINT(319139 4394340)", 
"POINT(319144 4394593)"), 
    ID.ligne = c("SM1205SB", "SM1205SC"), altitude = c(3000, 
    3008)), .Names = c("wkt_geom", "ID.ligne", "altitude"), row.names = 1:2, class = "data.frame")
myclip

clipQGIS2df(myclip)
}

\keyword{ misc }
