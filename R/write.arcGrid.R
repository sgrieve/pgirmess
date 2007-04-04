"write.arcGrid" <- 
function (xyz, file, zcol = 3, xcol = 1, ycol = 2, NODATA=-9999) 
{
    if (ncol(xyz) < 3) 
        stop("xyz object should have at least three columns")
    z = xyz[, zcol]
    x = xyz[, xcol]
    y = xyz[, ycol]
    xx = sort(unique(x))
    yy = sort(unique(y))
    my = match(y, yy)
    nx = length(xx)
    ny = length(yy)
    nmax = max(nx, ny)
    difx = diff(xx)
    if (diff(range(unique(difx))) > 1e-15) 
        stop("x intervals are not constant")
    dify = diff(yy)
    if (diff(range(unique(dify))) > 1e-15) 
        stop("y intervals are not constant")
    dx = difx[1]
    dy = dify[1]
    ratio = (nx * dx)/(ny * dy)
    xmin = min(xx)
    xmax = max(xx)
    xrange = xmax - xmin
    ymin = min(yy)
    ymax = max(yy)
    yrange = ymax - ymin
    zzz <- file(file, "w")
    cat("NCOLS ", nx, "\n", file=zzz)
    cat("NROWS ", ny, "\n", file=zzz)
    cat("XLLCENTER ", xmin, "\n", file=zzz)
    cat("YLLCENTER ", ymin, "\n", file=zzz)
    cat("CELLSIZE" , dx, "\n", file=zzz)
    cat("NODATA_VALUE" , NODATA, "\n", file=zzz)
    for(i in ny:1) {
    zz <- rep(NODATA, nx)
    mmy <- which(my == i)
    zz[match(x[mmy], xx)] <- z[mmy]
        write(zz, file=zzz, ncolumns=nx, append=TRUE)
    }
    close(zzz)
}
