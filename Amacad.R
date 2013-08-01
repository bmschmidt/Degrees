a = read.table("~/Degrees.txt",stringsAsFactors=F,header=T)
mine = a[,c("Year","English","Philosophy","Languages","History")]
require(ggplot2)
require(reshape2)
degrees = merge(melt(mine,id="Year"),a[,c("Year","Bachelor")])
degrees$Year = as.numeric(as.character(degrees$Year))
head(degrees)
degrees = degrees[order(degrees$variable),]

detailed1 = read.csv("~/gibbon/degrees/CIPbyYear.csv",skip=4,stringsAsFactors=F)
detailed2 = read.csv("~/gibbon/degrees/detailed_ByYear.csv",skip=4,stringsAsFactors=F)
names(detailed1)[2] = "variable"
names(detailed2)[2] = "variable"

detailed = rbind(detailed1,detailed2)
names(detailed)[3] = "count"
detailed$count = as.numeric(gsub(",","",detailed$count))

detailed = detailed[grep("(History)|(Philosophy)|(English)|(Languages)",detailed$variable),]
detailed = detailed[detailed$variable %in% c("History","English and Literature","Foreign Languages","38.01 Philosophy"),]
detailed$variable = as.character((factor(detailed$variable,labels=c("Philosophy","English","Foreign Languages","History"))))

full = as.data.frame(xtabs(as.numeric(gsub(",","",detailed1$X))~detailed1$Year))
names(full) = c("Year","total")
new = merge(full,detailed[detailed$Year>1988,])
new$source = "Caspar"
degrees$source="Hand"
new$Year = as.numeric(as.character(new$Year))
names(degrees) = c("Year","variable","count","total","source")
me = rbind(new,degrees)
head(me)

  gradAge = read.csv("~/gibbon/degrees/Population Estimates",header=F)
head(gradAge)

ggplot(degrees,aes(x=Year,y=value/Bachelor*100,fill=variable)) + geom_area() + scale_y_continuous("Percentage of All BAs in that year") + scale_fill_discrete("Major") + labs(title="Humanities degrees temporarily boomed in the 1960s")
degrees$GradAge = c(2400800,2362800,2358800,2340000,2336000,2310400,2270000,2212400,2166400,2142800,2123200,2120600,2151200,2193800,2226800,2296600,2391800,2542800,2653800,2749200,2810000,3049600,3296000,3440400,3631800,3704200,3905400,3997200,4189200,4259400,4318000,4380400,4368800,4347400,4295600,4188400,4077000,3969200,3888400,3864600,3882800,3862800,3820200,3751600,3678200,3593000,3650000,3734400,3809000)
me = me[order(me$Year,me$variable),]
ggplot(me,aes(x=Year,y=count/total*100,fill=variable)) + geom_area() + scale_y_continuous("Percentage of All BAs in that year") + scale_fill_discrete("Major") + labs(title="Humanities degrees temporarily boomed in the 1960s") + facet_wrap(~source)



degrees$GradAge = c(2400800,2362800,2358800,2340000,2336000,2310400,2270000,2212400,2166400,2142800,2123200,2120600,2151200,2193800,2226800,2296600,2391800,2542800,2653800,2749200,2810000,3049600,3296000,3440400,3631800,3704200,3905400,3997200,4189200,4259400,4318000,4380400,4368800,4347400,4295600,4188400,4077000,3969200,3888400,3864600,3882800,3862800,3820200,3751600,3678200,3593000,3650000,3734400,3809000)


ggplot(degrees,aes(x=Year,y=value/GradAge*100,fill=variable)) + 
  geom_area() + 
  scale_y_continuous("Census estimate of US population, aged 22-26") + 
  scale_fill_discrete("Major") + 
  labs(title="Humanities degrees as percentage of US population aged 22-26")



#######Top Schools
mySchools = read.csv("~/gibbon/degrees/topSchools.csv",header=T,skip=5,stringsAsFactors=F)
head(mySchools)
names(mySchools) = c("Year","School","discipline","count")
mySchools$count = as.numeric(gsub(",","",mySchools$count))
mySchools$type = "other"
for (school in c("Harvard","Yale","Stanford","Princeton")) { 
mySchools$type[grep(school,mySchools$School)] = "Ivy"
}

for (school in c("Michigan","California","Texas")) { 
  mySchools$type[grep(school,mySchools$School)] = "State"
}
mySchools = mySchools[order(mySchools$Year,mySchools$discipline),]
Types = ddply(mySchools,.(Year,discipline,type), function(x) {data.frame(count=sum(x$count))})
ggplot(Types,(aes(x=Year,y=count,fill=discipline))) + geom_area(position='fill') + facet_wrap(~type)
ggplot(mySchools,(aes(x=Year,y=count,fill=discipline))) + geom_area(position='fill') + facet_wrap(~School)
#Useful
ggplot(mySchools,(aes(x=Year,y=count))) + geom_line() + facet_grid(School~discipline,scales="free")


bySchool=read.csv("~/Downloads/webcaspar_table20130607133705/webcaspar_table20130607133604.csv",
              colClasses=c("numeric","factor","factor","factor","numeric","factor","integer"),na.strings=c(".",'"."','"######"'))

names(bySchool) = c("year","discipline","level","institution","type","Degrees","Doctorates")

head(bySchool)
ggplot(bySchool[bySchool$institution=="Harvard University",]) + 

this = read.csv("~/Downloads/webcaspar_table20130607135351/webcaspar_table20130607135326.csv",
                colClasses=c("numeric","factor","factor","factor","integer"),na.strings=c(".",'"."','"######"'))

head(this)
names(this) = c("year","discipline","level","type","Degrees")
require(plyr)
totals = ddply(this,.(year,discipline),function(frame) {data.frame(Degrees=sum(frame$Degrees))})
this = this[order(this$year,this$discipline,this$year),]
require(ggplot2)
ggplot(this[this$level=="Bachelor's Degrees",]) + 
  geom_area(aes(x=year,y=Degrees,fill=discipline),position='fill') + facet_wrap(~type)
head(totals)
totalDegrees = ddply(totals,.(year),function(year) {data.frame(total=sum(year$Degrees,na.rm=T))})
totals = merge(totals,totalDegrees)
ggplot(totals) + aes(y=Degrees/total,x=year) + facet_wrap(~discipline) + geom_line()
summary(this$Level.of.Degree.or.Other.Award)

this = this[this$Level.of.Degree.or.Other.Award=="Bachelor's Degrees",]
head(this)
summary(this$Academic.Discipline..Broad..standardized.)