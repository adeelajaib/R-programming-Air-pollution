
home<-"/home/adeel/Documents/computer-science/data-science/R-programming/week-2/assignment/final"

corr <- function(directory, threshold=0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  id<-1:332
  setwd(paste(home,directory,sep="/"))
  
  d <- list() # creates a list
  
  listcsv <- dir(pattern = "*.csv")
  for (k in id){
    d[[k]] <- read.csv(listcsv[k])
  }
  
  t1 <- list() 
  for (k in id){
    t1<-rbind(d[[k]],t1)
  }
  
  
  #cr <-NULL
  cr<-c()
  j<-1
  
  for (k in id){
    t2<-subset(t1,t1[,4]==k)
    good<-na.omit(t2)
    
    if(nrow(good)>threshold){
      #cr<-rbind(cr,data.frame(cor(good[,2],good[,3]))) 
      cr[j]<-c(cor(good[,2],good[,3]))
      j<-j+1
    } 
    
  }
  #colnames(cr)<-c("")
  as.vector(cr)
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  ## NOTE: Do not round the result!
}

