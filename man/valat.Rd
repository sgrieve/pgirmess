\name{valat}
\alias{valat}

\title{ Expected values of a contingency table under the null hypothesis }
\description{
  Computes the expected values a contingency table under the null hypothesis (two independent qualitative variables)
}
\usage{
valat(matr)
}

\arguments{
  \item{matr}{ a matrix (contingency table) of data counts }
}
\details{
  Computes the expected values a contingency table under the null hypothesis (two independent qualitative variables.  Warnings are fiven if the Cochran's rules if violated.
}
\value{
  A matrix with the expected values.
}
\references{ Siegel & Castellan 1988. Non parametric statistics for the behavioural sciences. Mc Graw Hill Int. Edt.  }

\author{ Patrick Giraudoux <pgiraudo@univ-fcomte.fr> }

\seealso{ \code{\link{chisq.test}}, \code{\link{valchisq}}}
\examples{
x <- matrix(c(12, 5, 7, 7), nc = 2)
x
valat(x)
}
\keyword{ array }
