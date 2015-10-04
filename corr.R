



#setwd("C:/Users/km/Documents/Coursera_Mathhmata/R_Programming/specdata")






fun3<-function(directory, threshold, id=(1:length(list.files(pattern="*.csv")))){

gg=length(id)
tot<-data.frame( ID= integer(0), Obs = integer(0))
setwd(directory)


corvector<- vector(mode="numeric", length=0)

for(i in 1:gg){
  

  
  
  
  if(i==1){
    
    ff<-read.csv(sprintf("%03d.csv", id[i]))
  
    ff2<-na.omit(ff)
  
    tot[i,1]<-id[i]
    tot[i,2]<-ncr
    
    if(ncr>thres){
      cc<-cor(ff2$sulfate,ff2$nitrate)
      cc
      corvector=c(cc)
      print(id[i])
      print(cc)
    }
    
    
  }else{
    


    
    tempf<-na.omit(temp)
    ncr<-nrow(tempf)

    tot[i,1]<-id[i]
    tot[i,2]<-ncr
    
    if(ncr>thres){
      cc<-cor(tempf$sulfate,tempf$nitrate)
      cc

      corvector=c(corvector,cc)

    }
    
  }
  
  
}


summary(corvector)


}












