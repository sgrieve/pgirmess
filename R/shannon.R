"shannon" <-
function(vect){
# Giraudoux 1.8.2004
# calcule l'indice de diversité de Shannon et l'équitabilité
# à partir d'un vecteur de probabilités
    if (!is.vector(vect)) stop("vector expected")
    if (sum(vect)!=1) stop("vector sum must be 1")
    vect<-vect*(log(vect))/log(2)
    h<-sum(vect[is.finite(vect)])
    hmax<-log(1/length(vect))/log(2)
    c(H=-h,J=h/hmax)
}
