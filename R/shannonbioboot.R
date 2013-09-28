"shannonbioboot" <-
function(data1,B=1000){

# Giraudoux 1.8.2004
# estimation de H et J par bootstrap
# renvoie un objet de classe boot 
# l'intervalle de confiance peut être calculé avec boot.ci

boot(data1,function(data1,i) shannonbio(data1[i,]),R=B)

}

