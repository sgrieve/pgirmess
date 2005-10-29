val4symb<-function(x,col=c("blue","red"),...){
    signe<-scale(x,scale=FALSE,...)
    diam<-abs(scale(x,scale=FALSE,...))
    color<-ifelse(signe<0,col[1],col[2])
    list(size=diam,col=color)
}
