rwhatpoly<-function(sgdf,SP,att=1, NAin=TRUE, num=FALSE){
	require(sp)
	if (NAin) fullgrid(sgdf)<-TRUE
	polyID<-overlay(sgdf,SP)
	
	if (length(sort(unique(overlay(sgdf,SP)))) != length(SP@polygons)) {
    idx<-1:length(SP@polygons)%in%sort(unique(overlay(sgdf,SP)))
    warning(paste("No pixel in polygon, row number:",which(!idx)))
  }
	
	bilan<-table(polyID, sgdf@data[,att], useNA="ifany")
	if (num) {
	 bilan<-t(bilan)
    class(bilan)<-"matrix"
    bilan<-as.data.frame(bilan)
    bilan<-sapply(bilan,function(x) rep(as.numeric(row.names(bilan)),x))
	}
	bilan
}

