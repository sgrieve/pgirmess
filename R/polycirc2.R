polycirc2<-function (radius=1, center = c(0, 0), edges = 50, init=pi/2, angle=pi/2) 
{
    circ = NULL
    angles <- seq(init, init+angle, l = edges)
    for (i in angles) {
        circ <- rbind(circ, cbind(radius * sin(i), radius * cos(i)))
    }
    circ<-rbind(c(0,0),circ)
    return(cbind(circ[, 1] + center[1], circ[,2] + center[2]))
}
