distNNeigh<-function(db){
  require(spdep)
  db<-as.matrix(db)
  nn<-knearneigh(db,RANN=FALSE)
  nn<-knn2nb(nn)
  res<-unlist(nbdists(nn,db))
  res
}