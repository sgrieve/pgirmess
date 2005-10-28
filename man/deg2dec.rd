\name{deg2dec}
\alias{deg2dec}

\title{ Convert degree minutes coordinates into decimal degrees (1.60 = 2)}
\description{
  Convert degree minutes coordinates into decimal degrees (1.60 = 2)
}
\usage{
deg2dec(coord)
}

\arguments{
  \item{coord}{ Coordinates in degree minutes, minutes being separated from degrees with a dot (eg: '1.6' is equal to 2 in decimal degrees). }
}

\value{
  Value(s) in decimal degrees.
}

\author{ Patrick Giraudoux <pgiraudo@univ-fcomte.fr> }


\examples{

deg2dec(c(1,1.3,1.6))

}
\keyword{ manip }
