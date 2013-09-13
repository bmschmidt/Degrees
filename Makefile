all:

schoolCounts:
	Rscript -e "library(knitr); knit('DegreeConversion.Rmd')"

index.html:
	#This will mostly be made already, but the list of schools can change.
	#Never mind, it's a pain to code.