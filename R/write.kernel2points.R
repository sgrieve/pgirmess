write.kernel2points<-function(kernoutput,filename){

    # Giraudoux 29.8.2004
    # prépare a partir du résultat de kernel2d() (library(splancs))
    # un fichier ascii de points importable dans ArcGIS
    # X,Y: X,Y coordinates; vals: z values
    # il est conseillé de passer par un fichier dbf pour conserver les décimales
    
    filename<-paste(filename,".txt",sep="")
    xyfile<-expand.grid(X=kernoutput$x,Y=kernoutput$y)
    vals<-NULL
    for (i in 1:length(kernoutput$x)) vals<-c(vals,kernoutput$z[,i])
    write.table(cbind(xyfile,vals), file = filename, quote = FALSE, sep = "\t",row.names = FALSE)
}
