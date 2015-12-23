home<-"/home/adeel/Documents/computer-science/data-science/R-programming/week-2/assignment/final"


complete <- function(directory, id = 1:332) {

  
  setwd(paste(home,directory,sep="/"))
  d <- list() 
  
  listcsv <- dir(pattern = "*.csv")
  for (k in id){
    d[[k]] <- read.csv(listcsv[k])
  }
  
  t1 <- list() 
  for (k in id){
    t1<-rbind(d[[k]],t1)
  }
  
  tab1<-NULL
  j<-1
  
  for (k in id){
    t2<-subset(t1,t1[,4]==k)
    good<-na.omit(t2)
    tab1<-rbind(tab1,data.frame(j,k,nrow(good))) 
    j<-j+1
  }
  
   colnames(tab1)<-c("" ,"id","nobs")
   tab1
  

}

