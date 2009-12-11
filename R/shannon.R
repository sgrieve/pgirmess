shannon <- function (vect, proba = TRUE){
  vect <- as.numeric (vect)
  if (all (vect <= 0)) return (c(H=NA, J=NA))
  if(!proba) vect <- vect/sum(vect)
  if (!isTRUE(all.equal(sum(vect), 1))) stop("probability vector must sum to 1")
    vect <- vect * log(vect, 2)
    h <- sum(vect[is.finite(vect)])
    hmax <- log(1/length(vect), 2)
    return (c(H = -h, J = h/hmax))
  }