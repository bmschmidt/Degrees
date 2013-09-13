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
## Associate of Arts/Two Year--private
```

```
## Warning: cannot open file
## '/Library/WebServer/Documents/Allfields/tables/Associate of Arts.Two
## Year--private.tsv': No such file or directory
```

```
## Error: cannot open the connection
```



Then, get the individual school counts. I'm just concatenating together a bunch of individual webcaspar school files for this.

```r
schools = loadSchoolTable()
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
## Babson College
```

```
## Warning: cannot open file
## '/Library/WebServer/Documents/Allfields/tables/Babson College.tsv': No
## such file or directory
```

```
## Error: cannot open the connection
```

```r
cat(toJSON(unique(table$institution)))
```

```
## ["Massachusetts Institute of Technology","University of Iowa","University of Illinois at Urbana-Champaign","University of California-Berkeley","University of California-Los Angeles","Boston College","Brown University","Cornell University, All Campuses","Emory University","Georgetown University","Harvard University","Michigan State University","New York University","Northwestern Univ","Rensselaer Polytechnic Institute","Rice University","Stanford University","Stevens Institute of Technology","University of Massachusetts at Amherst","University of Texas at Austin","University of Virginia, Main Campus","University of Washington - Seattle","Washington University","Yale University","University of Pennsylvania","University of Wisconsin-Madison","University of Chicago","Brandeis University","University of Georgia","University of Maryland at College Park","Boston University","Howard University","University of California-Davis","University of Connecticut, All Campuses","University of Illinois at Chicago","Clark University","Princeton University","Brigham Young University, Main Campus","Smith College","California State University-Los Angeles","Drexel University","Fisk University","Wellesley College","University of Rhode Island","Bowdoin College","California State Polytechnic U-San Luis Obispo","Southern Methodist University","California State University-Fresno","California State University-Fullerton","Dartmouth College","University of Wisconsin-Milwaukee","Tufts University","Fitchburg State College","Lesley College","Salem State College","University of Massachusetts at Boston","University of Massachusetts at Dartmouth","University of Massachusetts Lowell","Bates College","Colby College","St Olaf College","University of Texas at Arlington","University of California-Irvine","Miami-Dade Community College","College of the Holy Cross","Williams College","Haverford College","Babson College","University of Colorado at Boulder","University of Nebraska at Lincoln","Rutgers the State Univ of NJ New Brunswick","Ohio State University, Main Campus","University of Minnesota - Twin Cities","University of Maine","University of Minnesota - Duluth","George Mason University","University of Michigan at Ann Arbor","University of Southern Maine","California State University-Bakersfield","Texas A&M University Main Campus","University of Texas at Dallas","Richard Stockton College of New Jersey","University of Texas at Permian Basin","University of Connecticut","University of Colorado at Denver","City University"]
```

```r
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
    "University of Iowa", "University of Michigan at Ann Arbor", "University of Minnesota - Duluth", 
    "University of Minnesota - Twin Cities", "University of Nebraska at Lincoln", 
    "University of Texas at Austin", "University of Virginia, Main Campus", 
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
##                    36723                   108999
```

```r
writeOutResults(new[new$level == "Bachelor's Degrees", ])
```

```
## Ivy League
```

```
## Warning: cannot open file
## '/Library/WebServer/Documents/Allfields/tables/Ivy League.tsv': No such
## file or directory
```

```
## Error: cannot open the connection
```




```r

table = read.table("DegreeData.csv", sep = ",", skip = 6, header = T, colClasses = c("character", 
    "factor", "factor", "character", "character"), na.strings = c(".", "\".\"", 
    "\"######\""))
```

```
## Warning: cannot open file 'DegreeData.csv': No such file or directory
```

```
## Error: cannot open the connection
```

```r

names(table) = c("year", "institution", "discipline", "gender", "majors", "minors")
# 

if (FALSE) {
    table = read.table("Schools.csv", sep = ",", skip = 0, header = T, colClasses = c("character", 
        "factor", "factor", "character", "character"), na.strings = c(".", "\".\"", 
        "\"######\""))
    head(table)
    names(table) = c("year", "gender", "degree", "discipline", "institution", 
        "muck", "majors")
    table = table[table$degree == "Bachelor's Degrees", ]
    table$minors = 0
}

table = cleanupTable(table)
```

```
## Warning: NAs introduced by coercion
```

```r

table = reformatDisciplines(table)
```

```
##   |                                                                         |                                                                 |   0%  |                                                                         |==                                                               |   4%  |                                                                         |=====                                                            |   7%  |                                                                         |=======                                                          |  11%  |                                                                         |==========                                                       |  15%  |                                                                         |============                                                     |  19%  |                                                                         |==============                                                   |  22%  |                                                                         |=================                                                |  26%  |                                                                         |===================                                              |  30%  |                                                                         |======================                                           |  33%  |                                                                         |========================                                         |  37%  |                                                                         |==========================                                       |  41%  |                                                                         |=============================                                    |  44%  |                                                                         |===============================                                  |  48%  |                                                                         |==================================                               |  52%  |                                                                         |====================================                             |  56%  |                                                                         |=======================================                          |  59%  |                                                                         |=========================================                        |  63%  |                                                                         |===========================================                      |  67%  |                                                                         |==============================================                   |  70%  |                                                                         |================================================                 |  74%  |                                                                         |===================================================              |  78%  |                                                                         |=====================================================            |  81%  |                                                                         |=======================================================          |  85%  |                                                                         |==========================================================       |  89%  |                                                                         |============================================================     |  93%  |                                                                         |===============================================================  |  96%  |                                                                         |=================================================================| 100%
```

```r
head(table)
```

```
##   year institution        discipline
## 1 1966      Female Doctorate Degrees
## 2 1966      Female Doctorate Degrees
## 3 1966      Female Doctorate Degrees
## 4 1966      Female Doctorate Degrees
## 5 1966      Female Doctorate Degrees
## 6 1966      Female Doctorate Degrees
##                                       gender majors minors NA
## 1      Massachusetts Institute of Technology      0      1  0
## 2                         University of Iowa      0      1  0
## 3 University of Illinois at Urbana-Champaign      0      1  0
## 4          University of California-Berkeley      0      1  0
## 5       University of California-Los Angeles      0      1  0
## 6          University of California-Berkeley      0      1  0
##                  NA             field
## 1       Engineering Doctorate Degrees
## 2       Engineering Doctorate Degrees
## 3       Engineering Doctorate Degrees
## 4       Engineering Doctorate Degrees
## 5       Engineering Doctorate Degrees
## 6 Physical Sciences Doctorate Degrees
```

```r
require(reshape2)
limited = melt(xtabs(majors ~ year + gender + field, table))
names(limited) = c("year", "gender", "field", "count")
totals = ddply(limited, .(year), function(row) {
    data.frame(total = sum(row$count))
})
limited = merge(limited, totals)
head(limited)
```

```
##   year                                     gender               field
## 1 1966                             Babson College Associate's Degrees
## 2 1966       University of California-Los Angeles    Master's Degrees
## 3 1966         Ohio State University, Main Campus   Doctorate Degrees
## 4 1966           University of Texas at Arlington Associate's Degrees
## 5 1966              Southern Methodist University   Doctorate Degrees
## 6 1966 University of Illinois at Urbana-Champaign    Master's Degrees
##   count total
## 1     0     0
## 2     0     0
## 3     0     0
## 4     0     0
## 5     0     0
## 6     0     0
```

```r
write.table(limited, file = "/Library/WebServer/Documents/Allfields/data.tsv", 
    sep = "\t", row.names = F)
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

ddply(table, .(institution), function(mytable) {
    limited = melt(xtabs(majors ~ year + gender + field, mytable))
    cat(as.character(mytable$institution[1]))
    names(limited) = c("year", "gender", "field", "count")
    totals = ddply(limited, .(year), function(row) {
        data.frame(total = sum(row$count))
    })
    limited = merge(limited, totals)
    head(limited)
    write.table(limited, file = paste0("/Library/WebServer/Documents/Allfields/", 
        gsub("/", ".", mytable$institution[1]), ".tsv"), sep = "\t", row.names = F)
})
```

```
## Female
```

```
## Warning: cannot open file
## '/Library/WebServer/Documents/Allfields/Female.tsv': No such file or
## directory
```

```
## Error: cannot open the connection
```

```r

limited = melt(xtabs(majors ~ year + gender + field, table[table$institution == 
    "Master's/Comprehensive II", ]))
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
## Error: object 'previousOutput' not found
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
## 113634 1980   Male  Doctorate Degrees Selected State Flagships
## 109609 1980 Female   Master's Degrees Selected State Flagships
## 282301 1997 Female Bachelor's Degrees Selected State Flagships
## 52453  1973   Male Bachelor's Degrees               Ivy League
## 286056 1997   Male   Master's Degrees               Ivy League
## 77130  1976   Male   Master's Degrees Selected State Flagships
## 285461 1997   Male  Doctorate Degrees               Ivy League
## 252186 1994 Female Bachelor's Degrees Selected State Flagships
## 25962  1970 Female Bachelor's Degrees Selected State Flagships
## 279808 1997 Female  Doctorate Degrees Selected State Flagships
##                                         discipline majors minors
## 113634 Political Science and Public Administration     13      0
## 109609                        Atmospheric Sciences      1      0
## 282301                      Mechanical Engineering     15      0
## 52453                          Biological Sciences    103      0
## 286056                                   Astronomy      3      0
## 77130                   Mathematics and Statistics     18      0
## 285461                           Foreign Languages     13      0
## 252186                              Arts and Music     55      0
## 25962                               Arts and Music    229      0
## 279808 Political Science and Public Administration      3      0
##                                              field
## 113634 Political Science and Public Administration
## 109609                           Physical Sciences
## 282301                                 Engineering
## 52453                                Life Sciences
## 286056                           Physical Sciences
## 77130                                         Math
## 285461                           Foreign Languages
## 252186                            Art/Architecture
## 25962                             Art/Architecture
## 279808 Political Science and Public Administration
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

