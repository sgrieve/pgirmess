"shannonbio" <-
function(data1){

# Giraudoux 1.8.2004
# calcule un indice de Shannon et d'equitabilité à partir d'un data.frame
# du régime alimentaire comportant colonne 1 = catégorie, 
# colonne 2 = abondance (n, biomasse, etc...)

    tot<-tapply(data1[,2],data1[,1],sum)
    tot<-tot[!is.na(tot)]
    tot<-tot/sum(tot)
    tot<-tot*(log(tot))/log(2)
    h<-sum(tot[is.finite(tot)])
    hmax<-log(1/length(tot))/log(2)
    c(H=-h,J=h/hmax)
}
