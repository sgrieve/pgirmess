deg2dec<-function(coord){

# Giraudoux 28.12.2003
# converti des coordonnées de degré minutes en
# degrés décimaux (1.60 = 2)

return(trunc(coord)+(coord-trunc(coord))/0.6)

}
