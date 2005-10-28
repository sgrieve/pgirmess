"piankabio" <-
function(dataframe1,dataframe2){

# calcule un indice de Pianka (chevauchement de niche) de deux data.frames
# du régime alimentaire comportant colonne 1 = catégorie, colonne 2 = biomasse

    tot1<-tapply(dataframe1[,2],dataframe1[,1],sum)
    for (i in 1:length(tot1)){
        if(is.na(tot1[i])) tot1[i]<-0
    }
    tot1<-tot1/sum(tot1) # vecteur des probas du premier régime
    
    tot2<-tapply(dataframe2[,2],dataframe2[,1],sum)
    for (i in 1:length(tot2)){
        if(is.na(tot2[i])) tot2[i]<-0
    }
    tot2<-tot2/sum(tot2) # vecteur des probas du deuxième régime
    sum(tot1*tot2)/sqrt(sum(tot1^2)*sum(tot2^2)) # indice Pianka

}

