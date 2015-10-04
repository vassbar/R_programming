



##temp = list.files(pattern="*.csv")
##for (i in 1:length(temp)) assign(temp[i], read.csv(temp[i]))





vv=c(275,300)
#sprintf("%03d.csv", id)
setwd("C:/Users/km/Documents/Coursera_Mathhmata/R_Programming/specdata")

gg=length(vv)
gg

for(i in 1:gg){
  print(vv[i])
  
  if(i==1){
    sprintf("%03d.csv", i)
    ff<-read.csv(sprintf("%03d.csv", vv[i]))
    first<-nrow(ff)
    first
  }else{
    sprintf("%03d.csv", i)
    temp<-read.csv(sprintf("%03d.csv", vv[i]))
    secs<-nrow(temp)
    secs
    ff<-rbind(ff,temp)
    
  }
  
  
  
}

mean_s<-mean(ff[,"sulfate"],na.rm="TRUE")
mean_s




ff2<-na.omit(ff)
mean_s2<-mean(ff2[,"sulfate"])
mean_s2

ff3<-ff[complete.cases(ff),]

library(foreign)
write.dta(ff,"C:/Users/km/Documents/Coursera_Mathhmata/R_Programming/specdata/try1.dta") 


