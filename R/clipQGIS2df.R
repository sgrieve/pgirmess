clipQGIS2df<-function(cb){
  if(substr(cb[1,1],1,6)=="POINT("){
    space<-regexpr(" ",cb[,1],fixed=TRUE)
    long<-as.numeric(substr(cb[,1],7,space-1))
    lat<-as.numeric(substr(cb[,1],space+1,nchar(as.character(cb[,1]))-1))
    cb<-data.frame(long,lat,cb[,-1])
    return(cb)
  } else {print("The attribute table must correspond to a POINT geometry shapefile, exclusively")}
}