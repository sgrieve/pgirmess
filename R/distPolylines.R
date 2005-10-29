distPolylines<-function(myshp,decdeg=FALSE){
    require(maptools)
    mylines<-Map2lines(myshp)
    dists<-rep(NA,length(mylines))
    for (i in 1:length(mylines)) dists[i]<-distTot(mylines[[i]],decdeg=decdeg)
    dists
}
