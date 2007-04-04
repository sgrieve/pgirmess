distTotshp<-function(lines.shp,decdeg=FALSE){
    require(maptools)
    mylines<-Map2lines(lines.shp)
    x<-0
    for (i in 1:length(mylines)) x<-x+distTot(mylines[[i]],decdeg=decdeg)
    x
}
