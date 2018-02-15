getPubmedData <- function(searchString, fileName){
  
  print('Geting summary')
  search_query <- EUtilsSummary(searchString, retmax=100)
  summary(search_query)
  
  print("Retriving NCBI records")
  records<- EUtilsGet(search_query)
  class(records)
  
  pubmed_data <- data.frame('PMID'=PMID(records),'Country'=Country(records),'Volume'=Volume(records),'Citation'=Cited(records),'Title'=ArticleTitle(records),'Abstract'=AbstractText(records))
  
  print('Writing to file - PubmedData.csv')
  write.csv(pubmed_data, file = paste(fileName, '.csv'))
  
  return(pubmed_data)
}