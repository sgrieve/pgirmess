\name{pclig}
\alias{pclig}
\title{ Compute the percentage of each cell of a matrix by row }
\description{
  Compute the percentage of each cells of a matrix by row
}
\usage{
pclig(matr)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{matr}{ a matrix }
}
\details{
  Compute the percentage of each cells of a matrix by row
}
\value{
  Return a matrix with percentages in each cell
  
}

\author{ Patrick Giraudoux <pgiraudo@univ-fcomte.fr }

\examples{
x<-c(2,10,7,8,7) 
y<-c(56,22,7,20,5)
pclig(cbind(x,y))
}
\keyword{ array }% at least one, from doc/KEYWORDS
