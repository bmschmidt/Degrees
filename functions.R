library(plyr)
library(reshape2)
library(ggplot2)
library(rjson)

loadCarnegieTable = function() {
  degrees = read.table("rawdata/CarnegiePublic.csv",sep=",",skip = 0,header=T
                       ,colClasses = c("character","factor","factor","factor","factor","character","character"),na.strings=c(".",'"."','"######"'))
  head(degrees)
  names(degrees) = c("year","gender","level","public","carnegie","discipline","majors")
  levels(degrees$public)
  levels(degrees$public) = c("private","public")
  degrees$institution = paste(as.character(degrees$carnegie),degrees$public,sep="--")
  head(degrees)
  return(degrees[,c("year","gender","level","institution","discipline","majors")])
}

loadSchoolTable = function(files = c("rawdata/Schools2.csv")) {
  raw = lapply(files, function(name) {
    degrees = read.table(name,sep=",",skip = 0,header=T
                         ,colClasses = c("character","factor","factor","factor","character","character"),na.strings=c(".",'"."','"######"'))
    head(degrees)
    names(degrees) = c("year","gender","level","discipline","institution","FICE","majors");
    return(degrees)
  })
  degrees = do.call(rbind,raw)
  degrees = degrees[!duplicated(degrees),] #Multiple batched might have duplicates
  return(degrees[,c("year","gender","level","institution","discipline","majors")])
}

cleanupTable = function(table) {
  table$majors = as.numeric(gsub(",","",table$majors))
  if(!"minors" %in% names(table)) {table$minors = NA}
  table$minors = as.numeric(gsub(",","",table$minors))
  table$year = as.numeric(gsub(",","",table$year))
  table$field = as.character(table$discipline)
  table$minors[is.na(table$minors)] = 0
  table$majors[is.na(table$minors)] = 0
  return(table)
}

reformatDisciplines =function(table,test=F) {
  crosswalk = read.csv("lookups.csv",stringsAsFactors=F,header=T)
  replacements = ddply(crosswalk,.(field),function(broadfield){
    data.frame(replacement = unique(table$discipline[grep(paste(broadfield$regex,collapse="|"),table$field)]))
  },.progress="text")
  
  table$field[table$field %in% replacements$replacement] = replacements$field[match(table$field[table$field %in% replacements$replacement],replacements$replacement)]
  
  if(test) {return(
    sort(-xtabs(majors~field,table))
  )}
  
  table$majors[is.na(table$majors)] = 0
  return(table)
}

writeOutResults = function(table) {
  ddply(table,.(institution),function(mytable){
    limited = melt(xtabs(majors~year+gender+field,mytable))
    cat(as.character(mytable$institution[1]))
    names(limited) = c("year","gender","field","count")
    #totals = ddply(limited,.(year),function(row){data.frame(total=sum(row$count))})
    #limited = merge(limited,totals)
    #head(limited)
    write.table(limited,file=paste0("/var/www/Degrees/tables/",gsub("/",".",mytable$institution[1]),".tsv"),sep="\t",row.names=F)
  })
}