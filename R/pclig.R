"pclig" <-
function(matr){

# Patrick Giraudoux 24.1.2004
# renvoie une matrice des pourcentages selon les lignes
    mat<-na.omit(matr)
    mat/rowSums(na.omit(mat))
}

