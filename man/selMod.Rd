\name{selMod}
\alias{selMod}
\alias{selMod.lm}
\alias{selMod.glm}
\alias{selMod.list}

\title{ Model selection according to information theoretic methods }
\description{
 Handles lm, glm and list of models lm, glm, lme and nlme objects and provides parameters to compare models according to Anderson et al. (1998)
}
\usage{
    selMod(aModel, Order = "AICc", ...)

    \method{selMod}{lm}(aModel, Order = "AICc", dropNull = FALSE, selconv=TRUE, ...)
    \method{selMod}{list}(aModel, Order = "AICc", ...)
}

\arguments{
  \item{aModel}{ a lm or glm model or a list of lm or glm models }
  \item{dropNull}{ if TRUE, drops the simplest model (e.g. 'y~1')  }
  \item{Order}{ if set to "AICc" (default) sort the models on this parameter, otherwise "AIC" is allowed }
  \item{selconv}{ if TRUE (default) keep the models for which convergence is obtained (glm object only) and with no anova singularity (lm and glm) }
  \item{...}{ other parameters to be passed as arguments (not used here) }
}

\details{
  This function provides parameters used in the information theoretic methods for model comparisons. lm and glm objects can be passed directly as the upper scope of term addition (all terms added). 
  Every model from 'y~1' is computed adding one term at a time until the upper scope model is derived. A list of user specified lm, glm, lme or nlme objects can alternately be passed.
}

\value{
 A list with the following items:
  \item{AIC}{a data.frame including LL, the maximized log-likelihood; K the number of estimated parameters; N2K, number of observations/K; AIC, the Akaike index criterion; deltAIC, the difference between AIC and the lowest AIC value; \eqn{w_i}, the Akaike weights; AICc, the second order Akaike criterion; deltAICc, the difference between AICc and the lowest AICc value; \eqn{w_ic}, the AICc weights }
  \item{models}{the list of models}
}
\references{ 
    Anderson, D.R., Link, W.A., Johnson, D.H. and Burnham, K.P. (2001). Suggestions for presenting the results of data analyses. Journal of Wildlife Management, 65, 373-378; Burnham, K.P. and Anderson, D.R. (2002) Model Selection and Multimodel Inference: a Practical Information-Theoretic Approach, 2nd edn., Springer-Verlag, New York. 353 pp
 }
\author{ Patrick Giraudoux and David Pleydell: pgiraudo@univ-fcomte.fr, dpleydel@univ-fcomte.fr }

\seealso{ \code{\link{AIC}},\code{\link{logLik}} }
\examples{
 library(MASS)
 anorex.1 <- lm(Postwt ~ Prewt*Treat, data = anorexia)
 selMod(anorex.1)
 anorex.2 <- glm(Postwt ~ Prewt*Treat, family=gaussian,data = anorexia)
 selMod(anorex.2)
 anorex.3<-lm(Postwt ~ Prewt+Treat, data = anorexia)
 selMod(list(anorex.1,anorex.2,anorex.3))
}
\keyword{ models }
