complete<-function(directory, id=1:332){
  setwd(directory)
  counter<-0
  nobs<-vector(length=length(id))
  for(i in id){
    counter<-counter+1
    tempstring<-paste("00",i,".csv",sep="")
    idfilename<-substr(tempstring,nchar(tempstring)-6,nchar(tempstring))
    tempdataframe<-data.frame(read.csv(idfilename))
    good<-complete.cases(tempdataframe)
    nobs[counter]<-length(good[good==TRUE])
  }
  setwd("..")
  completedataframe<-data.frame(id, nobs)
  completedataframe
}