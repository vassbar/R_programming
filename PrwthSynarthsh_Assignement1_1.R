
#C:/Users/km/Documents/Coursera_Mathhmata/R_Programming/specdata


fun1<-function(directory,pollutant,id){
  
  setwd(directory)
  
  gg=length(id)
  gg
  
  for(i in 1:gg){
    print(id[i])
    
    if(i==1){
      
      ff<-read.csv(sprintf("%03d.csv", id[i]))
      first<-nrow(ff)
      first
    }else{
      
      temp<-read.csv(sprintf("%03d.csv", id[i]))
      secs<-nrow(temp)
      secs
      ff<-rbind(ff,temp)
      
    }
    
    
    
  }
  
  mean_s<-mean(ff[,pollutant],na.rm="TRUE")
  mean_s
  
    
}


