Convert NSF data

First, work with the Carnegie classifications table to get the counts for individual institution types.
These are not complete, so won't sum up with the overall totals.


```r
source("functions.R")
```

```
## Loading required package: methods
```

```r
carnegies = loadCarnegieTable()
table = cleanupTable(carnegies)
table = reformatDisciplines(table)
```

```
##   |                                                                         |                                                                 |   0%  |                                                                         |==                                                               |   4%  |                                                                         |=====                                                            |   7%  |                                                                         |=======                                                          |  11%  |                                                                         |==========                                                       |  15%  |                                                                         |============                                                     |  19%  |                                                                         |==============                                                   |  22%  |                                                                         |=================                                                |  26%  |                                                                         |===================                                              |  30%  |                                                                         |======================                                           |  33%  |                                                                         |========================                                         |  37%  |                                                                         |==========================                                       |  41%  |                                                                         |=============================                                    |  44%  |                                                                         |===============================                                  |  48%  |                                                                         |==================================                               |  52%  |                                                                         |====================================                             |  56%  |                                                                         |=======================================                          |  59%  |                                                                         |=========================================                        |  63%  |                                                                         |===========================================                      |  67%  |                                                                         |==============================================                   |  70%  |                                                                         |================================================                 |  74%  |                                                                         |===================================================              |  78%  |                                                                         |=====================================================            |  81%  |                                                                         |=======================================================          |  85%  |                                                                         |==========================================================       |  89%  |                                                                         |============================================================     |  93%  |                                                                         |===============================================================  |  96%  |                                                                         |=================================================================| 100%
```

```r
writeOutResults(table[table$level == "Bachelor's Degrees", ])
```

```
## Associate of Arts/Two Year--privateAssociate of Arts/Two Year--publicBaccalaureate/Liberal Arts II--privateBaccalaureate/Liberal Arts II--publicBaccalaureate/Liberal Arts I--privateBaccalaureate/Liberal Arts I--publicDoctoral II--privateDoctoral II--publicDoctoral I--privateDoctoral I--publicMaster's/Comprehensive II--privateMaster's/Comprehensive II--publicMaster's/Comprehensive I--privateMaster's/Comprehensive I--publicResearch II--privateResearch II--publicResearch I--privateResearch I--public
```

```
## data frame with 0 columns and 0 rows
```



Then, get the individual school counts. I'm just concatenating together a bunch of individual webcaspar school files for this.

```r
schools = loadSchoolTable(c("rawdata/Schmidt.csv", "rawdata/Schools2.csv"))
table = cleanupTable(schools)
table = reformatDisciplines(table)
```

```
##   |                                                                         |                                                                 |   0%  |                                                                         |==                                                               |   4%  |                                                                         |=====                                                            |   7%  |                                                                         |=======                                                          |  11%  |                                                                         |==========                                                       |  15%  |                                                                         |============                                                     |  19%  |                                                                         |==============                                                   |  22%  |                                                                         |=================                                                |  26%  |                                                                         |===================                                              |  30%  |                                                                         |======================                                           |  33%  |                                                                         |========================                                         |  37%  |                                                                         |==========================                                       |  41%  |                                                                         |=============================                                    |  44%  |                                                                         |===============================                                  |  48%  |                                                                         |==================================                               |  52%  |                                                                         |====================================                             |  56%  |                                                                         |=======================================                          |  59%  |                                                                         |=========================================                        |  63%  |                                                                         |===========================================                      |  67%  |                                                                         |==============================================                   |  70%  |                                                                         |================================================                 |  74%  |                                                                         |===================================================              |  78%  |                                                                         |=====================================================            |  81%  |                                                                         |=======================================================          |  85%  |                                                                         |==========================================================       |  89%  |                                                                         |============================================================     |  93%  |                                                                         |===============================================================  |  96%  |                                                                         |=================================================================| 100%
```

```r
writeOutResults(table[table$level == "Bachelor's Degrees", ])
```

```
## Babson CollegeBates CollegeBoston CollegeBoston UniversityBowdoin CollegeBrandeis UniversityBrigham Young University, Main CampusBrown UniversityCalifornia State Polytechnic U-San Luis ObispoCalifornia State University-BakersfieldCalifornia State University-FresnoCalifornia State University-FullertonCalifornia State University-Los AngelesCity UniversityClark UniversityColby CollegeCollege of the Holy CrossColumbia University in the City of New YorkCornell University, All CampusesDartmouth CollegeDrexel UniversityEmory UniversityFisk UniversityFitchburg State CollegeGeorge Mason UniversityGeorgetown UniversityHarvard UniversityHaverford CollegeHofstra UniversityHoward UniversityLesley CollegeMassachusetts Institute of TechnologyMiami-Dade Community CollegeMichigan State UniversityMonmouth CollegeMonmouth UniversityNew York UniversityNortheastern UniversityNorthwestern UnivOhio State University, Main CampusPomona CollegePrinceton UniversityReed CollegeRensselaer Polytechnic InstituteRice UniversityRichard Stockton College of New JerseyRutgers the State Univ of NJ New BrunswickSalem State CollegeSmith CollegeSouthern Methodist UniversityStanford UniversityStevens Institute of TechnologySt Olaf CollegeTexas A&M University Main CampusTufts UniversityUniversity of AK Fairbanks, All CampusesUniversity of AlabamaUniversity of California-BerkeleyUniversity of California-DavisUniversity of California-IrvineUniversity of California-Los AngelesUniversity of ChicagoUniversity of Colorado at BoulderUniversity of Colorado at DenverUniversity of ConnecticutUniversity of Connecticut, All CampusesUniversity of GeorgiaUniversity of Illinois at ChicagoUniversity of Illinois at Urbana-ChampaignUniversity of IowaUniversity of MaineUniversity of Maryland at College ParkUniversity of Massachusetts at AmherstUniversity of Massachusetts at BostonUniversity of Massachusetts at DartmouthUniversity of Massachusetts LowellUniversity of Michigan at Ann ArborUniversity of Minnesota - DuluthUniversity of Minnesota - Twin CitiesUniversity of Nebraska at LincolnUniversity of PennsylvaniaUniversity of Rhode IslandUniversity of Southern CaliforniaUniversity of Southern MaineUniversity of Texas at ArlingtonUniversity of Texas at AustinUniversity of Texas at DallasUniversity of Texas at Permian BasinUniversity of VermontUniversity of Virginia, Main CampusUniversity of Washington - SeattleUniversity of Wisconsin-MadisonUniversity of Wisconsin-MilwaukeeValparaiso UniversityVanderbilt UniversityWashington and Lee UniversityWashington UniversityWellesley CollegeWesleyan UniversityWilliams CollegeWorcester Polytechnic InstituteYale University
```

```
## data frame with 0 columns and 0 rows
```

```r
cat("schoolnames =", toJSON(c("", sort(unique(table$institution)))), "longdata", 
    file = "listOfSchools.json")
head(schools)
```

```
##   year gender             level                                institution
## 1 1966 Female Doctorate Degrees      Massachusetts Institute of Technology
## 2 1966 Female Doctorate Degrees                         University of Iowa
## 3 1966 Female Doctorate Degrees University of Illinois at Urbana-Champaign
## 4 1966 Female Doctorate Degrees          University of California-Berkeley
## 5 1966 Female Doctorate Degrees       University of California-Los Angeles
## 6 1966 Female Doctorate Degrees          University of California-Berkeley
##               discipline majors
## 1   Chemical Engineering      1
## 2   Chemical Engineering      1
## 3 Electrical Engineering      1
## 4      Other Engineering      1
## 5      Other Engineering      1
## 6              Astronomy      1
```



```r
elitePublic = c("University of California-Berkeley", "University of California-Los Angeles", 
    "University of Colorado at Boulder", "University of Illinois at Urbana-Champaign", 
    "University of Iowa", "University of Michigan at Ann Arbor", "University of Minnesota - Twin Cities", 
    "University of Nebraska at Lincoln", "University of Texas at Austin", "University of Virginia, Main Campus", 
    "University of Washington - Seattle", "University of Wisconsin-Madison")

Ivy = c("Harvard University", "Princeton University", "Yale University", "Dartmouth College", 
    "University of Pennsylvania", "Cornell University", "Brown University", 
    "Columbia University")
new = table[table$institution %in% Ivy | table$institution %in% elitePublic, 
    ]
new$institution[new$institution %in% Ivy] = "Ivy League"
new$institution[new$institution %in% elitePublic] = "Selected State Flagships"
table(new$institution)
```

```
## 
##               Ivy League Selected State Flagships 
##                    36723                   105741
```

```r
writeOutResults(new[new$level == "Bachelor's Degrees", ])
```

```
## Ivy LeagueSelected State Flagships
```

```
## data frame with 0 columns and 0 rows
```


Long Term humanities degrees are stored in a separate table. 


```r
library(plyr, reshape2)
library(reshape2)
humanities = read.csv("FullHumanities.csv")
```

```
## Warning: cannot open file 'FullHumanities.csv': No such file or directory
```

```
## Error: cannot open the connection
```

```r
humanities = melt(humanities, id.vars = "year")
```

```
## Error: object 'humanities' not found
```

```r
humanities$gender = sapply(strsplit(as.character(humanities$variable), "\\."), 
    "[[", 1)
```

```
## Error: object 'humanities' not found
```

```r
humanities$field = gsub(".*\\.", "", humanities$variable)
```

```
## Error: object 'humanities' not found
```

```r
table(humanities$field)
```

```
## Error: object 'humanities' not found
```

```r
humanities = humanities[humanities$field %in% c("AreaStudies", "Arts", "Classics", 
    "English", "History", "Journalism", "Languages", "Music", "Philosophy", 
    "Religion", "total"), ]
```

```
## Error: object 'humanities' not found
```

```r
humanities = humanities[humanities$year < 1966, ]
```

```
## Error: object 'humanities' not found
```

```r
humanities$gender = factor(humanities$gender, levels = c("M", "F"), labels = c("Male", 
    "Female"))
```

```
## Error: object 'humanities' not found
```

```r
humanities = humanities[, -2]
```

```
## Error: object 'humanities' not found
```

```r
names(humanities) = c("year", "count", "gender", "field")
```

```
## Error: object 'humanities' not found
```


The older tables are yet messier, and missing a few years in the early 1960s.

```r
degrees = read.csv("OldHEGIS.csv")
```

```
## Warning: cannot open file 'OldHEGIS.csv': No such file or directory
```

```
## Error: cannot open the connection
```

```r
mine = melt(degrees, id.vars = c("X1969.HEGIS.code", "X1969.HEGIS.Descriptor", 
    "X1953.Order", "X1952.Order", "X1948.Order", "Order64"))
```

```
## Error: object 'degrees' not found
```

```r
table(mine$variable)
```

```
## Error: object 'mine' not found
```

```r
mine$variable = gsub("([MW]?)([A-Z][A-Z]+)(\\d\\d)", "X\\3\\1\\2", mine$variable)
```

```
## Error: object 'mine' not found
```

```r
regex = "X(\\d\\d)([MW]?)([A-Z][A-Z]+)"
mine$good = grepl(regex, mine$variable)
```

```
## Error: object 'mine' not found
```

```r
mine$Degree = gsub(regex, "\\3", as.character(mine$variable))
```

```
## Error: object 'mine' not found
```

```r
mine$Gender = gsub(regex, "\\2", as.character(mine$variable))
```

```
## Error: object 'mine' not found
```

```r
mine$Year = as.numeric(gsub(regex, "\\1", as.character(mine$variable))) + 1900
```

```
## Error: object 'mine' not found
```

```r
mine$field = mine$X1969.HEGIS.Descriptor
```

```
## Error: object 'mine' not found
```

```r
mine$HEGIS = mine$X1969.HEGIS.code
```

```
## Error: object 'mine' not found
```

```r
mine$value = as.numeric(mine$value)
```

```
## Error: object 'mine' not found
```

```r
mine = mine[, !grepl("^X", names(mine))]
```

```
## Error: object 'mine' not found
```

```r
mine = mine[mine$Gender %in% c("M", "F", "W"), ]
```

```
## Error: object 'mine' not found
```

```r
generalCodes = mine[as.numeric(as.character(mine$HEGIS))%%100 == 0, c("field", 
    "HEGIS")]
```

```
## Error: object 'mine' not found
```

```r
generalCodes = generalCodes[!duplicated(generalCodes$HEGIS), ]
```

```
## Error: object 'generalCodes' not found
```

```r
head(mine)
```

```
## Error: object 'mine' not found
```

```r
mine = mine[!mine$field %in% c("History", "Journalism", "English", "English, Literature, Creative Writing, Language Arts, Comparative Literature", 
    "Music, Sacred Music", "Foreign Language and Literature", "Religion", "Spanish", 
    "French", "German", "Japanese", "Chinese", "Italian", "Russian"), ]
```

```
## Error: object 'mine' not found
```

```r
head(mine)
```

```
## Error: object 'mine' not found
```

```r
names(mine) = tolower(names(mine))
```

```
## Error: object 'mine' not found
```

```r
mine$gender = factor(mine$gender, levels = c("M", "W"), labels = c("Male", "Female"))
```

```
## Error: object 'mine' not found
```

```r
head(mine)
```

```
## Error: object 'mine' not found
```

```r
oldtotals = mine[mine$degree == "BA", c("year", "value", "gender", "field")]
```

```
## Error: object 'mine' not found
```

```r
names(oldtotals) = c("year", "count", "gender", "field")
```

```
## Error: object 'oldtotals' not found
```


Merging the two old series together:


```r
humanities$discipline = humanities$field
```

```
## Error: object 'humanities' not found
```

```r
oldtotals$discipline = oldtotals$field
```

```
## Error: object 'oldtotals' not found
```

```r
totals = ddply(humanities[humanities$field == "total", ], .(year), function(frame) {
    return(data.frame(total = sum(frame$count)))
})
```

```
## Error: object 'humanities' not found
```

```r
sums = rbind(oldtotals[!oldtotals$field == "Grand Total of All degrees", ], 
    humanities[!humanities$field == "total", ])
```

```
## Error: object 'oldtotals' not found
```

```r
head(sums)
```

```
## Error: object 'sums' not found
```

```r
sums$discipline = as.character(sums$discipline)
```

```
## Error: object 'sums' not found
```

```r
sums$field = as.character(sums$field)
```

```
## Error: object 'sums' not found
```

```r
require(plyr)
crosswalk = read.csv("lookups.csv", stringsAsFactors = F)
replacements = ddply(crosswalk, .(field), function(broadfield) {
    data.frame(replacement = unique(sums$discipline[grep(paste(broadfield$regex, 
        collapse = "|"), sums$discipline)]))
}, .progress = "text")
```

```
##   |                                                                         |                                                                 |   0%
```

```
## Error: object 'sums' not found
```

```r

sums$field[sums$field %in% replacements$replacement] = replacements$field[match(sums$field[sums$field %in% 
    replacements$replacement], replacements$replacement)]
```

```
## Error: object 'replacements' not found
```

```r
sums = ddply(sums, .(field, year, gender), function(field) {
    data.frame(count = sum(field$count, na.rm = T))
})
```

```
## Error: object 'sums' not found
```

```r
counts = xtabs(count ~ field, sums)
```

```
## Error: object 'sums' not found
```

```r
sort(-counts[counts > 0])
```

```
## Error: object 'counts' not found
```

```r
previousOutput = read.table("/Library/WebServer/Documents/Allfields/data.tsv", 
    header = T, stringsAsFactors = F)
```

```
## Warning: cannot open file
## '/Library/WebServer/Documents/Allfields/data.tsv': No such file or
## directory
```

```
## Error: cannot open the connection
```

```r

newtotals = rbind(totals, ddply(previousOutput, .(year), function(frame) {
    return(data.frame(total = frame$total[1]))
}))
```

```
## Error: object 'totals' not found
```

```r
new = rbind(previousOutput, merge(sums, totals))
```

```
## Error: object 'previousOutput' not found
```

```r

new[sample(1:nrow(new), 10), ]
```

```
##        year gender              level              institution
## 327836 2001   Male  Doctorate Degrees               Ivy League
## 173923 1986   Male   Master's Degrees Selected State Flagships
## 321496 2000   Male Bachelor's Degrees               Ivy League
## 44117  1972   Male Bachelor's Degrees Selected State Flagships
## 57632  1974   Male  Doctorate Degrees Selected State Flagships
## 23447  1969   Male Bachelor's Degrees Selected State Flagships
## 61853  1974   Male Bachelor's Degrees Selected State Flagships
## 57820  1974   Male  Doctorate Degrees               Ivy League
## 167027 1986 Female  Doctorate Degrees Selected State Flagships
## 408835 2008   Male Bachelor's Degrees Selected State Flagships
##                                       discipline majors minors
## 327836                          Medical Sciences     34      0
## 173923                   Business and Management    206      0
## 321496     Architecture and Environmental Design     13      0
## 44117                 Mathematics and Statistics     31      0
## 57632                       Chemical Engineering      6      0
## 23447  Other Non-sciences or Unknown Disciplines     31      0
## 61853                     English and Literature    133      0
## 57820                                  Chemistry     16      0
## 167027                     Other Social Sciences      2      0
## 408835                    English and Literature    111      0
##                         field
## 327836          Life Sciences
## 173923               Business
## 321496       Art/Architecture
## 44117                    Math
## 57632             Engineering
## 23447           Other/Unknown
## 61853  English and Literature
## 57820       Physical Sciences
## 167027 Social Sciences, Other
## 408835 English and Literature
```

```r
new = new[new$field != "", ]
library(reshape2)
better = melt(xtabs(count ~ year + field + gender, new))
```

```
## Error: object is not a matrix
```

```r
names(better) = c("year", "field", "gender", "count")
```

```
## Error: object 'better' not found
```

```r
better = better[better$field %in% names(xtabs(count ~ field, better)[xtabs(count ~ 
    field, better) > 0]), ]
```

```
## Error: object 'better' not found
```

```r
better = merge(better, newtotals, by = c("year"))
```

```
## Error: object 'better' not found
```

```r
write.table(better[order(better$year, better$field, better$gender), ], file = "/Library/WebServer/Documents/Allfields/longData.tsv", 
    row.names = F, sep = "\t")
```

```
## Error: object 'better' not found
```

