

for year in {1900..1979};
do
    count=`curl http://www.census.gov/popest/data/national/asrh/pre-1980/tables/PE-11-$year.csv | grep "^23" | perl -pe 's/[^"]*"([^"]*)".*"/$1/; s/,//g;'`;
    echo "$year $count" >> counts.txt;
done;
