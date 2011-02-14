\name{readVista}
\alias{readVista}

\title{Download waypoints and tracks from a GPS}
\description{
 Download GPS waypoints and tracks using gpsbabel
 }

\usage{
readVista(i = "garmin", f = "usb:", type="w", seg=FALSE, invisible=TRUE)
}

\arguments{
  \item{i}{INTYPE: a supported file type, default "garmin"}
  \item{f}{INFILE: the appropriate device interface, default "usb:"}
  \item{type}{"w" waypoints, or "t" track, or others provided in gpsbabel}
  \item{seg}{track ID type: FALSE for numbers, TRUE for GPS track IDs}
  \item{invisible}{Under Windows, do not open an extra window}
}
\details{
 The function calls gpsbabel via the system. The gpsbabel program must be present and on the user's PATH for the function to work see \url{http://www.gpsbabel.org}. The function has been tested on the following Garmin GPS devices: Etrex Summit, Etrex Vista Cx and GPSmap 60CSx. On Ubuntu Linux, USB-to-RS232 converter cables were connected succesfully with "/dev/ttyUSB0"; on Windows commonly "com4:" or similar.
}

\value{
A data frame of four columns:
    \item{ident}{waypoint names or track IDs}
    \item{long}{longitude}
    \item{lat}{latitude}
    \item{altitude}{elevation}
    
Information about the data type (waypoints or tracks) and the date of download are stored as attributes.
}
\references{\url{http://www.gpsbabel.org}}

\seealso{ \code{\link[maptools]{readGPS}}}

\examples{

\dontrun{
mywaypoints<-readVista() # download waypoints
mytracks<-readVista(type="t") # download tracks
}

}

\keyword{IO}
\keyword{connection}
