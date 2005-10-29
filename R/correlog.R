"correlog" <-
function(coords,z,method="Moran",nbclass=NULL){
    x<-require(spdep);if (!x) stop("Package spdep required")
    coords<-as.matrix(coords)
    matdist<-dist(coords)
    if (is.null(nbclass)) nbclass<-nclass.Sturges(matdist)
    etendue<-range(dist(coords))
    breaks1<-seq(etendue[1],etendue[2],l=nbclass+1)
    breaks2<-breaks1+0.000001
    breaks<-cbind(breaks1[1:length(breaks1)-1],breaks2[2:length(breaks2)])
    x<-NULL;N=NULL;p=NULL
    for(i in 1:length(breaks[,1])){
        z1<-z
        nb1<-dnearneigh(coords, breaks[i,1],breaks[i,2])
        zero<-which(card(nb1)==0)
        if (length(zero)>0){ 
            nb1<-dnearneigh(coords[-zero,], breaks[i,1],breaks[i,2])
            z1<-z[-zero]
        }
       xt<-switch(pmatch(method,c("Moran","Geary"),nomatch=""),
            "1"=try(moran.test(z1, nb2listw(nb1, style="W")),silent=TRUE),
            "2"=try(geary.test(z1, nb2listw(nb1, style="W")),silent=TRUE),
            stop("Method must be 'Moran' or 'Geary'"))
        if(inherits(xt,"try-error")) {stop("Bad selection of class breaks, try another one...")}
        else x<-c(x,xt$estimate[1]);p<-c(p,xt$p.value);N<-c(N,sum(card(nb1)))
        meth<-names(xt[[3]][1])
    }
 names(x)<-NULL
 res<-cbind(dist.class=rowMeans(breaks),coef=x,p.value=p,n=N)
 attributes(res)<-c(attributes(res),list(Method=meth))
 class(res)<-c("correlog","matrix")
 res
}


"plot.correlog"<-function (x,type,xlab,ylab,main,...) {
    if (!inherits(x, "correlog")) stop("Object must be of class 'correlog'")
    if (missing(main)) main<-paste(attributes(x)$Method," = f(distance classes)",sep="")
    if (missing(type)) type<-"b"
    if (missing(ylab)) ylab<-attributes(x)$Method
    if (missing(xlab)) xlab<-"distance classes"
    plot(x[,1:2,drop=FALSE],type=type,xlab=xlab,ylab=ylab,main=main,xaxt="n",...)
    inc<-(x[2,1]-x[1,1])/2
    breaks <- pretty(c(x[1,1]-inc,x[length(x[,1]),1]+inc), n = length(x[,1]), min.n = 2)
    axis(1,at=breaks,...)
    points(x[x[,3]<0.05,1:2,drop=FALSE],pch=19,col="red",cex=2)
}

"print.correlog"<-function (x,...) {
    if (!inherits(x, "correlog")) stop("Object must be of class 'correlog'")
    cat(attributes(x)$Method,"\n")
    attributes(x)<-attributes(x)[1:2]
    print(x[,,drop=F])
}
