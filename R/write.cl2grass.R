write.cl2grass<-function(mescont,filename){
# Giraudoux 26.8.2004
# convert a file obtained via contourLines
# into a AsCII grass vector file
# ouput > 2 files *.txt importable into grass, 
# *lev.txt the contour levels (to add as field eg in a dbf file)

    mycoords<-rep(list(NA),length(mescont))
    mylevels<-rep(0,length(mescont))
    for (i in 1:length(mescont)){
        mycoords[[i]]<-cbind(mescont[[i]]$x,mescont[[i]]$y)
        mylevels[i]<-mescont[[i]]$level
    }

    write.table("VERTI:",file = paste(filename,".txt",sep=""),append=FALSE,quote=FALSE,row.names=FALSE,col.names=FALSE)
    for (i in 1:length(mycoords)){
        head<-t(c("L ",length(mycoords[[i]][,1])))
        write.table(head,file = paste(filename,".txt",sep=""),append=FALSE,quote=FALSE,row.names=FALSE,col.names=FALSE)
        write.table(cbind(" ",mycoords[[i]][,2:1]),paste(filename,".txt",sep=""),append= TRUE,quote=FALSE,row.names=FALSE,col.names=FALSE)
    }

    write.table(mylevels,file = paste(filename,"lev.txt",sep=""),append= FALSE,quote=FALSE,row.names=FALSE,col.names=FALSE)

}
