



#setwd("C:/Users/km/Documents/Coursera_Mathhmata/R_Programming/specdata")



#fun2<-function(directory,id){

#setwd(directory)

#nf <- list.files(pattern="*.csv")
#num_files<-length(nf)
#id<-1:num_files


#thres=400  


fun3<-function(directory, threshold=0, id=(1:length(list.files(pattern="*.csv")))){

gg=length(id)
tot<-data.frame( ID= integer(0), Obs = integer(0))
setwd(directory)


corvector<- vector(mode="numeric", length=0)

for(i in 1:gg){
  
  #print(id[i])
  
  
  
  if(i==1){
    
    ff<-read.csv(sprintf("%03d.csv", id[i]))
    #first<-nrow(ff)
    #first
    
    ff2<-na.omit(ff)
    ncr<-nrow(ff2)
    #arxeio<-c(id[i],ncr)
    tot[i,1]<-id[i]
    tot[i,2]<-ncr
    
    if(ncr>threshold){
      cc<-cor(ff2$sulfate,ff2$nitrate)
      cc
      corvector=c(cc)
      print(id[i])
      #print(cc)
    }
    
    
  }else{
    
    #print(id[i])
    #sprintf("%03d.csv", i)
    temp<-read.csv(sprintf("%03d.csv", id[i]))
    #second<-nrow(temp)
    #second
    
    tempf<-na.omit(temp)
    ncr<-nrow(tempf)
    #arxeiotemp<-c(id[i],ncr)
    #arxeiotemp
    #arxeio<-rbind(arxeio,arxeiotemp)
    tot[i,1]<-id[i]
    tot[i,2]<-ncr
    
    if(ncr>threshold){
      cc<-cor(tempf$sulfate,tempf$nitrate)
      cc
      #print(id[i])
      #print(cc)
      corvector=c(corvector,cc)
      #print
    }
    
  }
  
  
}

#tot
#corvector

summary(corvector)


}












