write.pts2grass<-function(poly.shp,name){
# Giraudoux 26.5.2004
# convert a matrix of points coordinates (x,y) into a ASCII GRASS vector file (lines)
# poly.shp = a matrix or data.frame of points coordinates, col1 = x, col2 = y
# name = the name of the output file (ex: "monfichier.txt" 
# the file can then be imported from grass: 
# v.out.shape -v roads type=line mapset = PERMANENT cats = string
write.table("VERTI:",file = name,append=FALSE,quote=FALSE,row.names=FALSE,col.names=FALSE)
head<-t(c("L ",length(poly.shp[,1])))
write.table(head,file = name,append=TRUE,quote=FALSE,row.names=FALSE,col.names=FALSE)
write.table(cbind(" ",poly.shp[,2:1]),file = name,append= TRUE,quote=FALSE,row.names=FALSE,col.names=FALSE)
}
