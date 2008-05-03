"shannon" <-
function(vect, proba=TRUE){
    if (!is.vector(vect)) stop("vector expected")
    if (!proba) vect<-vect/sum(vect)
    if (!all.equal(sum(vect),1)) stop("probability vector must sum to 1")
    vect<-vect*log(vect,2)
    h<-sum(vect[is.finite(vect)])
    hmax<-log(1/length(vect),2)
    c(H=-h,J=h/hmax)
}
