\name{write.cl2grass}
\alias{write.cl2grass}

\title{ Convert the output of contourLines into a ascii GRASS vector file (lines). }
\description{
  Convert the output of contourLines into a ascii GRASS vector file (lines).
}
\usage{
write.cl2grass(mescont, filename)
}

\arguments{
  \item{mescont}{ A list obtained from a call to contourLines. }
  \item{filename}{ The name of the file to be written (a character string). }
}
\details{
  Writes two files: a suffix ".txt" is added to filename, the ascii GRASS vector file (to be imported from GRASS); 
  a suffix "lev.txt" is added to filename, a text file with the level of each contour.
}
\value{
  Files are written in the directory specified in file name or in the current working directory:
  \item{filename.txt }{the ascii GRASS vector file.}
  \item{filenamelev.txt }{a text file with the level of each contour.}
}

\author{ Patrick Giraudoux <pgiraudo@univ-fcomte.fr> }

\seealso{ \code{\link[grDevices]{contourLines}}, \code{\link{write.pts2grass}} }


\examples{
 x<-1:nrow(volcano)
 y<-1:ncol(volcano)
 contour(x, y, volcano)
 mycontours<-contourLines(x, y, volcano)
 write.cl2grass(mycontours, "volcanocont")
 # check the new files "volacnocont.txt" and "volacnocontlev.txt"in the working directory
 }
 
\keyword{ utilities }
