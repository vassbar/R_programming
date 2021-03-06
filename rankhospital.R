





rankhospital<-function(st,dis, num="best"){
  
  
  
  outcome <- read.csv("~/Coursera_Mathhmata/R_Programming/outcome-of-care-measures.csv")
  
  outcome[,11]<-suppressWarnings(as.numeric(as.character(outcome[,11])))
  outcome[,17]<-suppressWarnings(as.numeric(as.character(outcome[,17])))
  outcome[,23]<-suppressWarnings(as.numeric(as.character(outcome[,23])))
  
  
  outcome[,2]<-suppressWarnings(as.character(outcome[,2]))
  
  
  mm<-unique(outcome$State)
  mm<-as.character(mm)
  
  if(!(st %in% mm)){
    
    stop("invalid state")
    
  }
  
  
  cl<-c("heart attack","heart failure", "pneumonia")
  if(!(dis %in% cl)){
    
    stop("invalid outcome")
    
  }
  
  
  outcome2<- outcome[ which(outcome$State==st), ]
  
  
  
  if(dis=="heart attack"){
    
    outcome2<-outcome2[!(is.na(outcome2[,11]) | outcome2[,11]==""), ]  
    outcome2<-outcome2[ order(outcome2[,11],outcome2[,2]), ]
    
    ms<-dim(outcome2)
    
    if(num=="best") return(outcome2[1,2])
    if(num=="worst") return(outcome2[ms[1],2])
    if(class(num)=="numeric" && num<=ms[(1)]) return(outcome2[num,2])
    
    return(NA)
    
    
  }
  
  
  if(dis=="heart failure"){
    
    outcome2<-outcome2[!(is.na(outcome2[,17]) | outcome2[,17]==""), ]  
    outcome2<-outcome2[ order(outcome2[,17],outcome2[,2]), ]
    
    
    ms<-dim(outcome2)
    
    if(num=="best") return(outcome2[1,2])
    if(num=="worst") return(outcome2[ms[1],2])
    if(class(num)=="numeric" && num<=ms[1]) return(outcome2[num,2])
    
    return(NA)  
  }
  
  if(dis=="pneumonia"){
    
    outcome2<-outcome2[!(is.na(outcome2[,23]) | outcome2[,23]==""), ]  
    outcome2<-outcome2[ order(outcome2[,23],outcome2[,2]), ]
    
    ms<-dim(outcome2)
    
    if(num=="best") return(outcome2[1,2])
    if(num=="worst") return(outcome2[ms[1],2])
    if(class(num)=="numeric" && num<=ms[1]) return(outcome2[num,2])
    
    return(NA)
    
    
    
  }
  
 
 
}














