rwhatbufCat2<-function(rast, sites,bufsizes,att=1){
	require(splancs)
	require(pgirmess)
	require(rgdal)
	coords<-coordinates(sites)
	res.list<-rep(list(NA),length(bufsizes))
	names(res.list)<-bufsizes
	for(i in 1:length(bufsizes)) {res.list[[i]]<-rep(list(NA),nrow(coords));names(res.list[[i]])<-1:nrow(coords)}
	compteur<-0
	t0<-Sys.time()
	cat("Number of buffers to compute: ",length(bufsizes)*nrow(coords),"\n")
		for(i in 1:length(bufsizes)){
			for (j in 1:nrow(coords)) {
			compteur<-compteur+1
			if ((j == 3) & (bufsizes[i] == bufsizes[1])) {
				esTime<-(Sys.time()-t0)*(length(bufsizes)*nrow(coords)/2)
				cat(paste("Time at start: ",t0,"\nApproximate run time: ", format(esTime),"\nApproximate end time: ",t0+esTime,"\n"),sep="")
			}
			if (isTRUE(all.equal(compteur/100,trunc(compteur/100)))) cat(compteur,"\n")
			flush.console()
				buff<-polycirc(bufsizes[i],coords[j,])
				buffP<-Polygon(buff)
				minirast<-readGDALbbox(rast,buffP,silent=TRUE)
				fullgrid(minirast)<-FALSE
				idx<-inout(coordinates(minirast),buff)
				res.list[[i]][[j]]<-table(minirast@data[,att][idx],useNA="ifany")
			}
		}
cat("Finished !\n")
return(res.list)
}
