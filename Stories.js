stories = {};


stories["Humanities"] =
    [
     {"plotOptions":{
             "gender":["Male","Female"],
	     "startyear":1966,
	     "endyear":2011,
             "field":["Area and Ethnic Studies","English and Literature","Foreign Languages","History","Humanities, Other"]},
      "Narrative":
      "Are the humanities in decline? At first glance, it seems possible: they have declined from 17% of all degrees in 1966 to just 7% today."
     },
     {
	 "Narrative":"If they are in decline, though, it's not a straightforward one: the entire drop occurred between 1970 and 1985."
     },
     {"plotOptions":{"startyear":1983},
	 "Narrative":"Over the last thirty years, humanities degrees have been mostly stable: a mild rise to about 1993, and a moderate decline since."
     },
     {"plotOptions":{"startyear":1983},
      "Narrative":"That overall pattern gives the lie to any arguments that claim the humanities are being eroded by things like ethnic studies or a departure from the classics. Students aren't any less interested in majoring in history or English now than they were at the moment deconstructionism hit American shores."
     },
     {"plotOptions":{"startyear":1966},
      "Narrative":"Degrees have been stable since 1983, but have dropped since 1966. So which is a better baseline to use?"
     },
     {"plotOptions":{"startyear":1965},
      "Narrative":"These datasets start in 1966 because that's the first year we have digital, nationwide records on degrees. But it's not the first year that the government collected the information."
     },
     {"plotOptions":{"startyear":1947},
      "Narrative":"Several years ago, I went through old government statistics on majors to see if 1966 was really the long-term baseline. It's not."
     },
     {"plotOptions":{"startyear":1947},
      "Narrative":"In fact, what we've been using as a baseline is a long-term peak."
     }

     ]
stories["Business"] =
    [
     {"plotOptions":{
             "gender":["Male","Female"],
             "field":["Business"]},
      "Narrative":
      "Business Degrees have nearly doubled in the last 40 years. In 1966, about 12% of all degrees were in business: in 2011, it was about 21%. That's a lot: more than all the social sciences or humanities put together."
     },
     {
         "plotOptions":{
             "gender":["Female"],
             "field":["Business"]},
         "Narrative": "But the rise is entirely because of women. Female business majors were virtually nonexistent in 1970. Now 1 in 10 college students are women majoring in business."},
     {"plotOptions":{
             "gender":["Male"],
             "field":["Business"]
         },
      "Narrative":["Male business majors, on the other hand, are essentially constant as a percentage of all college students. That has strong implications for how we think about changing patterns of majors. If college students were really flocking to majors they thought would get them careers, wouldn't more men be majoring in business?"]
     },
     {"plotOptions":{
             "gender":["Male","Female"],
             "field":["Business"],
             "startyear":1988
         },
      "Narrative":
      "But even including women, if you restrict the time period to something that isn't ancient history business majors haven't increased at all."
     }
     ];

stories["CS"] =
    [
     {"plotOptions":{
             "gender":["Male","Female"],
             "field":["Computer Science"]},
      "Narrative":
      "Computer Science is one of those 'practical' degrees lazy writers always trot out as an explanation of where college students have been majoring lately.But while the overall trend for CS has been upwards, the real story is a lot more complex."
     },
     {
         "plotOptions":{
             "startyear":1980,"endyear":1998,
             "gender":["Male","Female"],
             "field":["Computer Science"]},
         "Narrative": "Although computer science has risen, the story is really dominated by two massive peaks.Degrees rose and fell dramatically between 1980 and 1990, leveled off through the 1990s..."},
     {"plotOptions":{
             "gender":["Male","Female"],
             "field":["Computer Science"]
         },
      "plotOptions":{
          "startyear":1997,"endyear":2011,
          "gender":["Male","Female"],
          "field":["Computer Science"]},
      "Narrative": "...and then rose and fell again between 1999 and 2008."},
     {"plotOptions":{
             "gender":["Male","Female"],
             "field":["Computer Science"],
             "startyear":1984,"endyear":2011
         },
      "Narrative":
      "America has a lower percentage of computer science majors now than it did when the Apple Macintosh was first introduced. So college students aren't necessarily getting more vocational in their career choices."
     },
     {"plotOptions":{
             "gender":["Male"],
             "field":["Computer Science"],
	 "denominator":"male",
             "startyear":1966,"endyear":2011,displayOrder : ["gender","field"]
         },
      "Narrative":
      "The story is different if you look at a particular minority of college students: men. Male college students are more likely to major in CS today than in the past."
     },
     {"plotOptions":{
             "gender":["Female"],
             "field":["Computer Science"],
	 "denominator":"female",
             "startyear":1966,"endyear":2011
         },
      "Narrative":
      "Female CS majors, on the other hand, peaked in 1986 and have been steadily diminishing since then ."
     },
     {"plotOptions":{
             "gender":["Female"],
             "field":["Computer Science"],
             "startyear":1966,"endyear":1986
         },
      "Narrative":
      "In the early days of computer science, women seemed poised. (Remember that in the 1940s and 1950s, programming was seen as a feminine form of labor."
     },
     {"plotOptions":{
             "gender":["Female","Male"],
             "field":["Computer Science"],
             "startyear":1966,"endyear":1986,"denominator":"local",displayOrder : ["gender","field"]
         },
      "Narrative":
      "This is as true looking at women as a percentage of degrees"
     }
     ];

