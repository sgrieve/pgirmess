mergeTrackObs<-function (sppdfInt, sppdfObs) 
{
    trc <- coordinates(sppdfInt)
    obs <- coordinates(sppdfObs)
    trckObs <- data.frame(trc, nObs = 0)
    for (i in 1:nrow(obs)) {
        nnb <- knearneigh(rbind(obs[i, ], trc), k = 1)
        trckObs$nObs[nnb$nn[1, 1] - 1] <- trckObs$nObs[nnb$nn[1, 
            1] - 1] + 1
    }
    trckObs <- data.frame(ID = 1:nrow(trckObs), trckObs)
    names(trckObs)[2:3]<-c("x","y")
    coordinates(trckObs) <-~x+y
    trckObs
}
