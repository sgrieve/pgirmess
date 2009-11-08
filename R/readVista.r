readVista<-function (i="garmin",f = "usb:", type = "w", seg=FALSE, invisible = TRUE){
	
  if (type=="w"){
        gpsdata <- system(paste("gpsbabel -w -i ",i," -f ",f," -o gpx -F -", sep = ""), intern = TRUE, invisible = TRUE)
				if (any(grep("Can't init", gpsdata))) stop("Cannot read GPS: check connexion and the device interface argument 'f' (eg. type, port number, etc.)")
        tmp<-tempfile(pattern="readVista")
        cat(gpsdata,file=tmp)
        concat<-readLines(tmp,warn=FALSE)
        concat<-substr(concat,unlist(gregexpr("<wpt",concat))[1],nchar(concat))
      		debNam<-unlist(gregexpr("<name>",concat))  # name extraction
					finNam<-unlist(gregexpr("</name>",concat))

        	debLat<-unlist(gregexpr("<wpt lat=\"",concat))  # latitude extraction
					finLat<-unlist(gregexpr(" lon=",concat))
					
					debLon<-unlist(gregexpr(" lon=\"",concat))   # longitude extraction
					finLon<-unlist(gregexpr('\">',concat))
					
					debEle<-unlist(gregexpr("<ele>",concat)) # elevation extraction
					finEle<-unlist(gregexpr("</ele>",concat))
					
					concatNam<-NULL
					concatLat<-NULL
					concatLon<-NULL
					concatEle<-NULL
					for(i in 1:length(debLat)) {
		  	    concatNam<-c(concatNam,substr(concat,debNam[i]+6,finNam[i]-1))
						concatLat<-c(concatLat,substr(concat,debLat[i]+10,finLat[i]-3))
						concatLon<-c(concatLon,substr(concat,debLon[i]+6,finLon[i]-3))
						concatEle<-c(concatEle,substr(concat,debEle[i]+5,finEle[i]-1))
						}
        gpsdata<-data.frame(concatNam,cbind(as.numeric(concatLon),as.numeric(concatLat),as.numeric(concatEle)))
        names(gpsdata)<-c("ident","long","lat","altitude")
        attributes(gpsdata)$type<-"Waypoints"
    }

    if (type=="t"){
        gpsdata <- system(paste("gpsbabel -t -i ",i," -f ",f," -o gpx -F -", sep = ""), intern = TRUE, invisible = TRUE)
				if (any(grep("Can't init", gpsdata))) stop("Cannot read GPS: check connexion and the device interface argument 'f' (eg. type, port number, etc.)")
        tmp<-tempfile(pattern="readVista")
        cat(gpsdata,file=tmp)
        x<-readLines(tmp,warn=FALSE)
        
        if (!seg) {
        
          deb<-unlist(gregexpr("<trkseg>",x)) # track segments extraction
          fin<-unlist(gregexpr("</trkseg>",x))
					concat<-NULL
					for(i in 1:length(deb)) concat<-paste(concat,substr(x,deb[i]+9,fin[i]-1),sep="")

					debLat<-unlist(gregexpr("lat=\"",concat))  # latitude extraction
					finLat<-unlist(gregexpr("lon=",concat))
					
					debLon<-unlist(gregexpr("lon=\"",concat))   # longitude extraction
					finLon<-unlist(gregexpr('\">',concat))
					
					debEle<-unlist(gregexpr("<ele>",concat)) # elevation extraction
					finEle<-unlist(gregexpr("</ele>",concat))
					
					concatLat<-NULL
					concatLon<-NULL
					concatEle<-NULL
					
					for(i in 1:length(debLat)) {
						concatLat<-c(concatLat,substr(concat,debLat[i]+5,finLat[i]-3))
						concatLon<-c(concatLon,substr(concat,debLon[i]+5,finLon[i]-3))
						concatEle<-c(concatEle,substr(concat,debEle[i]+5,finEle[i]-1))
						}
					ident=1:length(concatLon)
					gpsdata<-data.frame(ident,cbind(as.numeric(concatLon),as.numeric(concatLat),as.numeric(concatEle)))
					
					}
					
					else
					
					{
					debTrck<-unlist(gregexpr("<trk>",x)) # track segments extraction
					finTrck<-unlist(gregexpr("</trk>",x))

					debName<-unlist(gregexpr("<name>",x)) # name extraction
					finName<-unlist(gregexpr("</name>",x))

					Name<-rep(NA,length(debName))
					for (i in 1:length(debName)) Name[i]<-substr(x,debName[i]+6,finName[i]-3)

					trck.lst<-rep(list(NA),length(debTrck))
					for (i in 1:length(debName)) trck.lst[[i]]<-substr(x,debTrck[i]+5,finTrck[i]-1)
					
					gpsdata<-NULL
					for (j in 1:length(trck.lst)){
					x<-trck.lst[[j]]
					
          deb<-unlist(gregexpr("<trkseg>",x)) # track segments extraction
          fin<-unlist(gregexpr("</trkseg>",x))
					concat<-NULL
					for(i in 1:length(deb)) concat<-paste(concat,substr(x,deb[i]+9,fin[i]-1),sep="")

					debLat<-unlist(gregexpr("lat=\"",concat))  # latitude extraction
					finLat<-unlist(gregexpr("lon=",concat))
					
					debLon<-unlist(gregexpr("lon=\"",concat))   # longitude extraction
					finLon<-unlist(gregexpr('\">',concat))
					
					debEle<-unlist(gregexpr("<ele>",concat)) # elevation extraction
					finEle<-unlist(gregexpr("</ele>",concat))
					
					concatLat<-NULL
					concatLon<-NULL
					concatEle<-NULL
					
					for(i in 1:length(debLat)) {
						concatLat<-c(concatLat,substr(concat,debLat[i]+5,finLat[i]-3))
						concatLon<-c(concatLon,substr(concat,debLon[i]+5,finLon[i]-3))
						concatEle<-c(concatEle,substr(concat,debEle[i]+5,finEle[i]-1))
						}
					ident=Name[j]
					gpsdata<-rbind(gpsdata,data.frame(ident,cbind(as.numeric(concatLon),as.numeric(concatLat),as.numeric(concatEle))))
					}

					}
					names(gpsdata)<-c("ident","long","lat","altitude")
        	attributes(gpsdata)$type<-"Track"
    }
    attributes(gpsdata)$sysTime<-Sys.time()
    unlink(tmp)
    gpsdata
}



