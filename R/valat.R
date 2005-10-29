"valat" <-
function(matr){

# Giraudoux 07.2004
# renvoie la matrice des valeurs attendues d'un tableau de contingence
    
    expect<-matr
    
    # calcul des tableaux marginaux
    
    marglig<-rowSums(matr)
    margcol<-colSums(matr)
    total<-sum(margcol)
    
    infcinq<-0; infun<-0
    
    for (i in 1:length(matr[,1])){ # de la premiere  la derniere ligne
        for (j in 1:length(matr[1,])){ # de la premiere a la derniere colonne
            expect[i,j]<-marglig[i]*margcol[j]/total
            if (expect[i,j]<5)infcinq<-infcinq+1
            if (expect[i,j]<1)infun<-infun+1
        }
    }
    
    if (infcinq!=0) warning(paste(round(infcinq/(length(margcol)*length(marglig))*100,1),"percent of cells <5"))
    if (infun!=0) warning(paste(round(infun/(length(margcol)*length(marglig))*100,1),"percent of cells <1"))
    expect
    
}

