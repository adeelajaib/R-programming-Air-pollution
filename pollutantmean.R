home<-"/home/adeel/Documents/computer-science/data-science/R-programming/week-2/assignment/final"


pollutantmean <- function(directory, pollutant, id = 1:332) {

  setwd(paste(home,directory,sep="/"))
  
  if(pollutant=="sulfate"){
    col<-2
  }
  else{
    col<-3
  }
  
  
  d <- list() 
  listcsv <- dir(pattern = "*.csv")
  for (k in id){
    d[[k]] <- read.csv(listcsv[k])
  }
  
  t1 <- list() 
  for (k in id){
    t1<-rbind(d[[k]],t1)
  }
  
  mean(t1[,col], na.rm= TRUE)
  
}

pollutantmean("specdata", "sulfate", 1:10)
pollutantmean("specdata", "nitrate", 70:72)
pollutantmean("specdata", "nitrate", 23)
