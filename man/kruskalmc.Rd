\name{kruskalmc}
\alias{kruskalmc}


\title{ Multiple comparison test after Kruskal-Wallis }
\description{
  Multiple comparison test between treatments or treatments versus control after Kruskal-Wallis test
}
\usage{
kruskalmc(resp, categ, probs = 0.05, cont=NULL)
}

\arguments{
  \item{resp}{ a numeric vector of data values }
  \item{categ}{ a factor object giving the group for the corresponding elements of 'x' }
  \item{probs}{ a probability for the critical difference }
  \item{cont}{ NULL (default) for multiple comparison between treatments; 'one-tailed' or 'two-tailed' 
  for corresponding multiple comparisons treatments versus control; partial matching allowed}
}
\details{

  When the obtained value of a Kruskal-Wallis test is significant, it indicates that at least one of the groups is different from at least one of the others. This test helps determining which groups are different with pairwise comparisons adjusted appropriately. Those pairs of groups which have observed differences higher than a critical value are considered statistically different at the given probability (p level). Three type of multiple comparisons are implemented: comparisons between treatments, 'one-tailed' and 'two-tailed' comparison treatments versus control.  The first factor level is considered the control.
	
	For further details please consider the refence below where the method is fully described. One may also want to visit \url{http://pagesperso-orange.fr/giraudoux/#pgirmess}
}
\value{
  A list of class 'mc' with the following items:
  \item{statistic }{statistics used}
  \item{p.value}{the p value of the critical difference}
  \item{dif.com}{a data.frame with observed and critical differences}
}
\references{ Siegel and Castellan (1988) Non parametric statistics for the behavioural sciences. MacGraw Hill Int., New York. pp 213-214  }

\seealso{ \code{\link{kruskal.test}}, to reorder factor levels see \code{\link{relevel}}, \code{\link[multcompView]{multcompLetters}}, \code{\link[multcompView]{multcompTs}}}

\examples{
resp<-c(0.44,0.44,0.54,0.32,0.21,0.28,0.7,0.77,0.48,0.64,0.71,0.75,0.8,0.76,0.34,0.80,0.73,0.8)
categ<-as.factor(rep(c("A","B","C"),times=1,each=6))
kruskalmc(resp, categ)
kruskalmc(resp, categ, probs=0.01)
kruskalmc(resp, categ, cont="one-tailed")
kruskalmc(resp, categ, cont="two-tailed")

}
\keyword{ htest }
