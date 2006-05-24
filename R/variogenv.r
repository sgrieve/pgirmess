variogenv<-function(formula,locations, data, R=99,...){
    require(gstat,quietly=TRUE)
    vgm1<-variogram(formula,locations,data,...)
    formula<-update(formula,sample(.)~.)
    myfun<-function(x) unlist(variogram(formula,locations,data,...)[3])
    xx<-data.frame(t(sapply(1:R,myfun)))
    xmin<-sapply(xx,min)
    xmax<-sapply(xx,max)
    res<-data.frame(np=vgm1$np,dist=vgm1$dist,vgm.obs=vgm1$gamma,upper.lim=xmax,lower.lim=xmin)
    row.names(res)<-1:length(res[,1])
    class(res)<-c("variogenv","data.frame")
    res
}
    
plot.variogenv<-function(x,txt=TRUE,txtcex=0.6,type="b",main="",ylab="semi-variance",xlab="distance",...){
    if (!inherits(x, "variogenv")) stop("Object must be of class 'variogenv'")
    plot(range(x$dist),range(x[,3:5]),type="n",xlab=xlab,ylab=ylab,...)
    points(x$dist,x$vgm.obs)
    lines(x$dist,x$upper.lim,lty=2)
    lines(x$dist,x$lower.lim,lty=2)
    if (txt) text(x$dist,x$vgm.obs,x$np,pos=3,cex=txtcex,...)
}
 
