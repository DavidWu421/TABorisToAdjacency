boris.ta.no.to.adjacency <- function(file1, nobv,filename) {
  
  #file1 is exported 'time budget' boris file in csv form
  #filename is name of new saved csv file (adjacency matrix)
  #nobv is number of observations used
  
  #read data of file1
  if (nobv == 1) {
    df_data <- read.csv(file1, header = FALSE, skip = 9, stringsAsFactors = FALSE)
  } else {
    df_data <- read.csv(file1, header = FALSE, skip = 14, stringsAsFactors = FALSE)
  }
  
  #removing unecessary information
  df_data <- df_data[-c(3,6:10)]
  
  #creating the model of final dataframe
  #creating a variable for each behavior name called behav1, behav2...
  adj.matrix<- data.frame(" " = c('TA', 'Table1','Table2','Table3','Table4','Table5','Table6','Table7','EveryoneTable'),'TA' = c(rep(0,9)), 'Table1' = c(rep(0,9)), 'Table2' = c(rep(0,9)),'Table3'=c(rep(0,9)),'Table4'=c(rep(0,9)),'Table5'=c(rep(0,9)),'Table6'=c(rep(0,9)),'Table7'=c(rep(0,9)),'EveryoneTable'=c(rep(0,9)), check.names=FALSE)
  
  #putting data from df_data into df_model
  TA.to.Students.number<-df_data[3:10,3]
  Students.to.TA.number<-df_data[11:18,3]
  adj.matrix <- data.frame(" " = c('TA', 'Table1','Table2','Table3','Table4','Table5','Table6','Table7','EveryoneTable'),'TA' = c(0,Students.to.TA.number), 'Table1' = c(rep(0,9)), 'Table2' = c(rep(0,9)),'Table3'=c(rep(0,9)),'Table4'=c(rep(0,9)),'Table5'=c(rep(0,9)),'Table6'=c(rep(0,9)),'Table7'=c(rep(0,9)),'EveryoneTable'=c(rep(0,9)), check.names=FALSE)
  adj.matrix[1,3:10]<-TA.to.Students.number
  
  #create csv file
  write.csv(adj.matrix, filename,row.names = FALSE)
  return(adj.matrix)
}


boris.ta.dur.to.adjacency <- function(file1, nobv,filename) {
  
  #file1 is exported 'time budget' boris file in csv form
  #filename is name of new saved csv file (adjacency matrix)
  #nobv is number of observations used
  
  #read data of file1
  if (nobv == 1) {
    df_data <- read.csv(file1, header = FALSE, skip = 9, stringsAsFactors = FALSE)
  } else {
    df_data <- read.csv(file1, header = FALSE, skip = 14, stringsAsFactors = FALSE)
  }
  
  #removing unecessary information
  df_data <- df_data[-c(3,6:10)]
  
  #creating the model of final dataframe
  adj.matrix<- data.frame(" " = c('TA', 'Table1','Table2','Table3','Table4','Table5','Table6','Table7','EveryoneTable'),'TA' = c(rep(0,9)), 'Table1' = c(rep(0,9)), 'Table2' = c(rep(0,9)),'Table3'=c(rep(0,9)),'Table4'=c(rep(0,9)),'Table5'=c(rep(0,9)),'Table6'=c(rep(0,9)),'Table7'=c(rep(0,9)),'EveryoneTable'=c(rep(0,9)), check.names=FALSE)
  
  #putting data from df_data into df_model
  Students.to.TA.DUR<-df_data[11:18,4]
  TA.to.Students.DUR<-df_data[3:10,4]
  adj.matrix <- data.frame(" " = c('TA', 'Table1','Table2','Table3','Table4','Table5','Table6','Table7','EveryoneTable'),'TA' = c(0,Students.to.TA.DUR), 'Table1' = c(rep(0,9)), 'Table2' = c(rep(0,9)),'Table3'=c(rep(0,9)),'Table4'=c(rep(0,9)),'Table5'=c(rep(0,9)),'Table6'=c(rep(0,9)),'Table7'=c(rep(0,9)),'EveryoneTable'=c(rep(0,9)), check.names=FALSE)
  adj.matrix[1,3:10]<-TA.to.Students.DUR
  
  
  #create csv file
  write.csv(adj.matrix, filename,row.names = FALSE)
  return(adj.matrix)
}