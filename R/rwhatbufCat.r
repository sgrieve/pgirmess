rwhatbufCat<-function(rast, sites,bufsizes,att=1){
	require(splancs)
	require(pgirmess)
	cols<-levels(factor(rast@data[,att],exclude=NULL)) # liste des cat�gories
	coords<-coordinates(sites)
	fintab2<-NULL
	compteur<-0
	t0<-Sys.time()
	cat("Number of buffers to compute: ",length(bufsizes)*nrow(sites@data),"\n")
		for(i in bufsizes){
  		fintab<-matrix(NA,ncol=length(cols),nrow=nrow(sites@data)) # constitution du tableau pour 1 diam�tre de buffer
			colnames(fintab)<-cols
			rownames(fintab)<-row.names(sites@data)	
			for (j in 1:nrow(sites@data)) {
			compteur<-compteur+1
			if ((j == 3) & (i == bufsizes[1])) {
				esTime<-(Sys.time()-t0)*(length(bufsizes)*nrow(sites@data)/2)
				cat(paste("Time at start: ",t0,"\nEstimated computing duration: ", format(esTime),"\nEstimated end time: ",t0+esTime,"\n"),sep="")
			}
			if (isTRUE(all.equal(compteur/100,trunc(compteur/100)))) cat(compteur,"\n")
			flush.console()
				buff<-polycirc(i,coords[j,])
				idx<-inout(coordinates(rast),buff)
				res<-table(rast@data[,att][idx],useNA="ifany")
				fintab[j,match(names(res),cols)]<-t(matrix(res))
				fintab[is.na(fintab)]<-0
			}
		
			fintab<-data.frame(bufDiam=i,IDsites=rownames(fintab),fintab)
			names(fintab)[3:length(fintab)]<-cols
			fintab2<-rbind(fintab2,fintab)
		}
cat("Finished !\n")
return(fintab2)
}
