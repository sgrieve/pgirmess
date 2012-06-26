
thintrack<-function(spdf,mindist=100){
  st<-FALSE
  cds<-coordinates(spdf)
  i<-1
  j<-1
  idx<-1
  while(!st){
    delta<-sqrt((cds[i,1]-cds[i+j,1])^2+(cds[i,2]-cds[i+j,2])^2)
    if(delta>=mindist) {idx<-c(idx,i+j); i<-i+j;j<-1} else j<-j+1
    if (i+j > nrow(cds)) st<-TRUE
  }
  return(spdf[idx,])
}