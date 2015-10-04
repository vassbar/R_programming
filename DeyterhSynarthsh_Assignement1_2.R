


#setwd("C:/Users/km/Documents/Coursera_Mathhmata/R_Programming/specdata")



fun2<-function(directory,id){

setwd(directory)

tot<-data.frame( ID= integer(0), Obs = integer(0))

gg=length(id)
gg

for(i in 1:gg){

  
  
  if(i==1){
    
    ff<-read.csv(sprintf("%03d.csv", id[i]))

    ff2<-na.omit(ff)
    ncr<-nrow(ff2)

    tot[i,1]<-id[i]
    tot[i,2]<-ncr
    
  }else{
    

    temp<-read.csv(sprintf("%03d.csv", id[i]))

    
    tempf<-na.omit(temp)
    ncr<-nrow(tempf)

    arxeio<-rbind(arxeio,arxeiotemp)
    tot[i,1]<-id[i]
    tot[i,2]<-ncr
    
  }
  
  
}

tot

}











