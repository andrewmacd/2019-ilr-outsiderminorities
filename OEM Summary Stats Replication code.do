
******* Table 1
tab a8 if(a5>=18 & a5<60) 

svyset [pw = combinedcpw]

** Mean age
svy: mean a5  if(a5>=18 & a5<60), over(minority)
lincom [a5]1 - [a5]0

svy: mean a5  if(a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [a5]1 - [a5]0

svy: mean a5  if(a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [a5]2 - [a5]0

** Mean male
svy: mean female  if(a5>=18 & a5<60), over(minority)
lincom [female]1 - [female]0

svy: mean female  if(a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [female]1 - [female]0

svy: mean female  if(a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [female]2 - [female]0

** Mean is working
svy: mean isworking  if(a5>=18 & a5<60), over(minority)
lincom [isworking]1 - [isworking]0

svy: mean isworking  if(a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [isworking]1 - [isworking]0

svy: mean isworking  if(a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [isworking]2 - [isworking]0

** Is working - male
svy: mean isworking  if(a5>=18 & a5<60  & female==0), over(minority)
lincom [isworking]1 - [isworking]0

svy: mean isworking  if(a5>=18 & a5<60  & female==0 & minoritytypet!=2), over(minoritytypet)
lincom [isworking]1 - [isworking]0

svy: mean isworking  if(a5>=18 & a5<60  & female==0 & minoritytypet!=1), over(minoritytypet)
lincom [isworking]2 - [isworking]0

** Is working - female
svy: mean isworking  if(a5>=18 & a5<60  & female==1), over(minority)
lincom [isworking]1 - [isworking]0

svy: mean isworking  if(a5>=18 & a5<60  & female==1 & minoritytypet!=2), over(minoritytypet)
lincom [isworking]1 - [isworking]0

svy: mean isworking  if(a5>=18 & a5<60  & female==1 & minoritytypet!=1), over(minoritytypet)
lincom [isworking]2 - [isworking]0

** Has professional job
svy: mean hasprofessionaljob  if(a5>=18 & a5<60), over(minority)
lincom [hasprofessionaljob]1 - [hasprofessionaljob]0

svy: mean hasprofessionaljob  if(a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [hasprofessionaljob]1 - [hasprofessionaljob]0

svy: mean hasprofessionaljob  if(a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [hasprofessionaljob]2 - [hasprofessionaljob]0

** Has government job
svy: mean hasgovernmentjob  if(a5>=18 & a5<60), over(minority)
lincom [hasgovernmentjob]1 - [hasgovernmentjob]0

svy: mean hasgovernmentjob  if(a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [hasgovernmentjob]1 - [hasgovernmentjob]0

svy: mean hasgovernmentjob  if(a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [hasgovernmentjob]2 - [hasgovernmentjob]0

** Mandarin fluency
svy: mean mandarin  if(a5>=18 & a5<60), over(minority)
lincom [mandarin]1 - [mandarin]0

svy: mean mandarin  if(a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [mandarin]1 - [mandarin]0

svy: mean mandarin  if(a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [mandarin]2 - [mandarin]0

** Mean partystatus
svy: mean partymember  if(a5>=18 & a5<60), over(minority)
lincom [partymember]1 - [partymember]0

svy: mean partymember  if(a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [partymember]1 - [partymember]0

svy: mean partymember  if(a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [partymember]2 - [partymember]0

** Mean hukou
svy: mean a9  if(a5>=18 & a5<60), over(minority)
lincom [a9]1 - [a9]0

svy: mean a9  if(a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [a9]1 - [a9]0

svy: mean a9  if(a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [a9]2 - [a9]0

** Mean years of formal education
svy: mean yearsofschool if(a5>=18 & a5<60), over(minority)
lincom [yearsofschool]1 - [yearsofschool]0

svy: mean yearsofschool  if(a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [yearsofschool]1 - [yearsofschool]0

svy: mean yearsofschool  if(a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [yearsofschool]2 - [yearsofschool]0

**** Household summaries
svyset, clear
svyset [pw = combinedchw]

** Mean household size
svy: mean nhh if(code==1 & a5>=18 & a5<60), over(minority)
lincom [nhh]1 - [nhh]0

svy: mean nhh if(code==1 & a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [nhh]1 - [nhh]0

svy: mean nhh if(code==1 & a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [nhh]2 - [nhh]0

** Median household income
svy: mean d921aa if(code==1 & a5>=18 & a5<60), over(minority)
lincom [d921aa]1 - [d921aa]0

svy: mean d921aa if(code==1 & a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [d921aa]1 - [d921aa]0

svy: mean d921aa if(code==1 & a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [d921aa]2 - [d921aa]0

** Mean income per working-aged household member
svy: mean salaryperworking if(code==1 & a5>=18 & a5<60), over(minority)
lincom [salaryperworking]1 - [salaryperworking]0

svy: mean salaryperworking if(code==1 & a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [salaryperworking]1 - [salaryperworking]0

svy: mean salaryperworking if(code==1 & a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [salaryperworking]2 - [salaryperworking]0

** Mean head of household's father's education evel
svy: mean spouseeducation if(code==1 & a5>=18 & a5<60), over(minority)
lincom [spouseeducation]1 - [spouseeducation]0

svy: mean spouseeducation if(code==1 & a5>=18 & a5<60 & minoritytypet!=2), over(minoritytypet)
lincom [spouseeducation]1 - [spouseeducation]0

svy: mean spouseeducation if(code==1 & a5>=18 & a5<60 & minoritytypet!=1), over(minoritytypet)
lincom [spouseeducation]2 - [spouseeducation]0







******* Table 1a

svyset [pw = combinedcpw]

** Mean age
svy: mean a5  if(a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [a5]2 - [a5]1

** Mean male
svy: mean female  if(a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [female]2 - [female]1

** Mean is working
svy: mean isworking  if(a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [isworking]2 - [isworking]1

** Is working - male
svy: mean isworking  if(a5>=18 & a5<60  & female==0 & minoritytypet!=0), over(minoritytypet)
lincom [isworking]2 - [isworking]1

** Is working - female
svy: mean isworking  if(a5>=18 & a5<60  & female==1 & minoritytypet!=0), over(minoritytypet)
lincom [isworking]2 - [isworking]1

** Has professional job
svy: mean hasprofessionaljob  if(a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [hasprofessionaljob]2 - [hasprofessionaljob]1

** Has government job
svy: mean hasgovernmentjob  if(a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [hasgovernmentjob]2 - [hasgovernmentjob]1

** Mandarin fluency
svy: mean mandarin  if(a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [mandarin]2 - [mandarin]1

** Mean partystatus
svy: mean partymember  if(a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [partymember]2 - [partymember]1

** Mean hukou
svy: mean a9  if(a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [a9]2 - [a9]1

** Mean years of formal education
svy: mean yearsofschool  if(a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [yearsofschool]2 - [yearsofschool]1

**** Household summaries
svyset, clear
svyset [pw = combinedchw]

** Mean household size
svy: mean nhh if(code==1 & a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [nhh]2 - [nhh]1

** Median household income
svy: mean d921aa if(code==1 & a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [d921aa]2 - [d921aa]1

** Mean income per working-aged household member
svy: mean salaryperworking if(code==1 & a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [salaryperworking]2 - [salaryperworking]1

** Mean head of household's father's education evel
svy: mean spouseeducation if(code==1 & a5>=18 & a5<60 & minoritytypet!=0), over(minoritytypet)
lincom [spouseeducation]2 - [spouseeducation]1

svyset, clear

clear
