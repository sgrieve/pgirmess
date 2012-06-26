"difshannonbio" <-
function(dat1,dat2,R=1000,probs=c(0.025,0.975)){

# Giraudoux 1.8.2004
# renvoie les limites l'intervalle de confiance empirique de la différence des 
# bootstrap replicates de deux Shannons à partir de deux data.frame
# du régime alimentaire comportant colonne 1 = catégorie, colonne 2 = biomasse

library(boot)

myboot1<-boot(dat1,function(dat1,i) shannonbio(dat1[i,]),R=R)
myboot2<-boot(dat2,function(dat1,i) shannonbio(dat1[i,]),R=R)

differ<-myboot1$t-myboot2$t

x<-quantile(differ[,1],probs=probs)
y<-quantile(differ[,2],probs=probs)
return(list(deltaH=x,deltaJ=y))

}
