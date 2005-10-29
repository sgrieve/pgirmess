expandpoly<-function(mypol,fact){
# Giraudoux 17.9.2004 homothétie d'un polygon mypol par un facteur fact
m1<-mean(mypol[,1]);m2<-mean(mypol[,2])
cbind((mypol[,1]-m1)*fact+m1,(mypol[,2]-m2)*fact+m2)
}
