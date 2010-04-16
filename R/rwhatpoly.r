rwhatpoly<-function(sgdf,SP,att=1, NAin=TRUE){
	require(sp)
	if (NAin) fullgrid(sgdf)<-TRUE
	polyID<-overlay(sgdf,SP)
	table(polyID, sgdf@data[,att], useNA="ifany")
}

