rwhatbufCat<-function(rast, sites,bufsizes,att=1){
	require(splancs)
	require(pgirmess)
	cols<-levels(factor(rast@data[,att],exclude=NULL)) # liste des catégories
	coords<-coordinates(sites)
	fintab2<-NULL
		for(i in bufsizes){
  		fintab<-matrix(NA,ncol=length(cols),nrow=nrow(sites@data)) # constitution du tableau pour 1 diamètre de buffer
			colnames(fintab)<-cols
			rownames(fintab)<-row.names(sites@data)
			for (j in 1:nrow(sites@data)) {
			flush.console()
			cat(i,"/",j," ",sep="")
				buff<-polycirc(i,coords[j,])
				idx<-inout(coordinates(rast),buff)
				res<-table(rast@data[,att][idx],useNA="ifany")
				fintab[j,match(names(res),cols)]<-t(matrix(res))
				fintab[is.na(fintab)]<-0
			}
		
			fintab<-data.frame(bufDiam=i,IDsites=rownames(fintab),fintab)
			names(fintab)[3:length(fintab)]<-cols
			fintab2<-rbind(fintab2,fintab)
			cat("\n")
		}
cat("\n")
return(fintab2)
}
