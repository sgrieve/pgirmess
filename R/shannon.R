"shannon" <-
function(vect){
    if (!is.vector(vect)) stop("vector expected")
    if (!all.equal(sum(vect),1)) stop("vector sum must be 1")
    vect<-vect*log(vect,2)
    h<-sum(vect[is.finite(vect)])
    hmax<-log(1/length(vect),2)
    c(H=-h,J=h/hmax)
}
