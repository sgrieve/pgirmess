rwhatbufNum<-function(rast, sites,bufsizes,att=1){
	require(splancs)
	require(pgirmess)
	coords<-coordinates(sites)
	mylist<-rep(list(NA),length(bufsizes))
	names(mylist)<-bufsizes
	for(i in 1:length(mylist)){
		mylist[[i]]<-rep(list(NA),nrow(coords))
		names(mylist[[i]])<-1:nrow(coords)
	}
		compteur<-0
		for(i in bufsizes){
		compteur<-compteur+1
				for (j in 1:nrow(coords)) {
				flush.console()
				cat(i,"/",j," ",sep="")
				buff<-polycirc(i,coords[j,])
				idx<-inout(coordinates(rast),buff)
				mylist[[compteur]][[j]]<-rast@data[idx,att]
			}
		cat("\n")
		}
return(mylist)
}
