"selMod"<-function(aModel, Order="AICc",...){
UseMethod("selMod")
}

selMod.lm <- function(aModel, Order="AICc", dropNull=FALSE, selconv=TRUE,...){   # permissible values for Order are "AIC" or "AICc" (the default)
                                                        # dropNull enables the simplest model (e.g. y~1) to be dropped
                                                        # glm objects inherit from lm and thus this function also handles glms
    trm <- attributes(terms(aModel))$term.labels
    models <- rep(list(NA),length(trm)+1)
    models[[1]] <- update(aModel,.~1)

    if(names(aModel$coef)[1]!="(Intercept)") {
        for (i in 1:(length(trm))) {models[[i+1]] <- update(models[[i]],formula(paste(".~.-1+",trm[i],sep="")))}
    } else {
        for (i in 1:(length(trm))) {models[[i+1]] <- update(models[[i]],formula(paste(".~.+",trm[i],sep="")))}
    }
    
    if (dropNull) {models <- models[-1]}
    
    if (selconv){
    
        if("glm"%in%class(models[[1]])){
            x<-length(models)
            conv<-rep(TRUE,x)
            for (i in 1:length(models)) conv[i]<-models[[i]]$converged
            models<-models[conv]
            if (length(models)<x) warning("Non convergent model(s) have been removed",call.=FALSE)
        }
        
        x<-length(models)
        sel<-rep(TRUE,x)
        for(i in 1:length(models)) {
            if(sum(ifelse(anova(models[[i]])$Df==0,1,0),na.rm=TRUE)!=0) sel[i]<-FALSE
        }
        models<-models[sel]
        if (length(models)<x) warning("Model(s) with anova singularity have been removed",call.=FALSE)
    }
    
    selMod.list(models)
    
}


selMod.list <- function(aModel, Order="AICc",...){   # permissible values for Order are "AIC" or "AICc" (the default)
    if(!is.list(aModel)) {stop("aModel must be a list")}                                  
    N <- length(residuals(aModel[[1]]))
    models <- aModel
    myAIC <- rep(NA,length(models))
    forms <- rep(NA,length(models))
    K <- rep(NA,length(models))
    N2K <- rep(NA,length(models))
    LL <- rep(NA,length(models))
    Int <- FALSE
    for (i in 1:(length(models))){
        myAIC[i] <- AIC(models[[i]])
        LL[i]<-logLik(models[[i]])
        K[i] <- attributes(logLik(models[[i]]))$df
        N2K[i]<- N / K[i]
        forms[i] <- deparse(formula(models[[i]]),width.cutoff=500)
        for (j in 1:nchar(forms[i])) {
            if (substr(forms[i],j,j) == "~") {n<-j;break}
        }   
        forms[i]<-substr(forms[i],n+2,nchar(forms[i]))
        #if (names(models[[i]]$coef[1])=="(Intercept)") {Int<-TRUE}
    }
    #trm <- names(models[K==max(K)][[1]]$coef)
    #if (Int & trm[1]!="(Intercept)") {trm <- c("(Intercept)",trm)}    

    AICc <- myAIC+2*K*(K+1)/(N-K-1)
    deltAIC <- myAIC-min(myAIC)
    deltAICc <- AICc-min(AICc)
    wi <- exp(-(1/2)*deltAIC)
    wi <- wi/sum(wi)
    wic <- exp(-(1/2)*deltAICc)
    wic <- wic/sum(wic)

    L <- list(AIC=data.frame(model=forms,LL=LL,K=K,N2K,AIC=myAIC,deltAIC=deltAIC,w_i=round(wi,2),AICc=AICc,deltAICc=deltAICc,w_ic=round(wic,2)),models=models) 
    if (Order=="AIC") {
        L$AIC <- L$AIC[order(L$AIC$deltAIC),]
    } else {
        L$AIC <- L$AIC[order(L$AIC$deltAICc),]
    }
    L
}
