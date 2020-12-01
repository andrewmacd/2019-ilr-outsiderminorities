
***** Married setup

gen marriedminority = married*minority
gen marriedminoritytypet = married*minoritytypet

***** Standard regressions

*** Minority

regress loghouseinc minority i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60)
regress loghouseinc minority yearsofschool experience exp2 i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60)
regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60)
regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60)
regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 minoritypartymember minorityyearsofschool i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60)

*** By insider minority

regress loghouseinc minority i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=2)
regress loghouseinc minority yearsofschool experience exp2 i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=2)
regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=2)
regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=2)
regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 minoritypartymember minorityyearsofschool i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=2)


*** By outsider minority

regress loghouseinc minority i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=1)
regress loghouseinc minority yearsofschool experience exp2 i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=1)
regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=1)
regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=1)
regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 minoritypartymember minorityyearsofschool i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=1)

*** Matching & IPWRA

nnmatch loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 _Iprovince_2-_Iprovince_7 [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60), robust(6) biasadj(numberofworkingaged yearsofschool experience exp2 spouseeducation spouseexperience spouseexp2) tc(att)
nnmatch loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 _Iprovince_2-_Iprovince_7 [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=1), robust(6) biasadj(numberofworkingaged yearsofschool experience exp2 spouseeducation spouseexperience spouseexp2) tc(att)

teffects ipwra (loghouseinc yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 i.province) (minority) [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60), atet
* Note that outsider minorities are not in all provinces, currently commented out because this doesn't converge
* teffects ipwra (loghouseinc yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 _Iprovince_3 _Iprovince_5 _Iprovince_6) (minority) [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=1 ), atet


***** Multiple imputation

*** Setup 

mi set mlong
mi register imputed yearsofschool experience exp2 mandarin partymember spouseeducation spouseexperience spouseexp2
mi register regular numberofworkingaged loghouseinc minority female minoritytypet

* Normally we want to treat these as just another variable but doing so causes huge issues with standard errors (particularly minorityyearsofschool) so we conditionally impute instead
mi register passive minoritypartymember minorityyearsofschool

*** Impute data

* We first impute all variables with missing values unconditionally 50 times (as recommended by the literature)
mi impute chained (logit) mandarin partymember (regress) experience exp2  spouseeducation  spouseexperience spouseexp2 yearsofschool = numberofworkingaged loghouseinc minority female, add(50) rseed(123) force dots

* Next we conditionally impute values 
mi impute regress yearsofschool experience exp2 spouseeducation partymember spouseexperience spouseexp2 mandarin numberofworkingaged loghouseinc female, replace by(minoritytypet) rseed(123) force dots
mi impute logit partymember yearsofschool experience exp2  spouseeducation  spouseexperience spouseexp2 mandarin numberofworkingaged loghouseinc female, replace by(minoritytypet) rseed(123) force dots

* Then we generate interaction terms
mi passive: replace minorityyearsofschool = minority*yearsofschool
mi passive: replace minoritypartymember = minority*partymember

*** Estimate results

mi estimate: regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60)
mi estimate: regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 minoritypartymember minorityyearsofschool i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60)

mi estimate: regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=2)
mi estimate: regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 minoritypartymember minorityyearsofschool i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=2)

mi estimate: regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=1)
mi estimate: regress loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 minoritypartymember minorityyearsofschool i.province [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=1)

*** Matching

* Note that the interaction terms are left out; since non-minorities never have non-zero interaction terms they won't ever contribute to a match 
mi estimate, dots cmdok: nnmatch loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 _Iprovince_2-_Iprovince_7 [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60), robust(6) biasadj(numberofworkingaged yearsofschool experience exp2 spouseeducation spouseexperience spouseexp2) tc(att)
mi estimate, dots cmdok: nnmatch loghouseinc minority yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 _Iprovince_2-_Iprovince_7 [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=1), robust(6) biasadj(numberofworkingaged yearsofschool experience exp2 spouseeducation spouseexperience spouseexp2) tc(att)

*** IPWRA

mi estimate, dots cmdok: teffects ipwra (loghouseinc yearsofschool experience exp2 female numberofworkingaged  mandarin partymember spouseeducation spouseexperience spouseexp2 i.province) (minority) [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60), atet
* Note that outsider minorities are not in all provinces so the province controls change a little here to get the model to resolve
mi estimate, dots cmdok: teffects ipwra (loghouseinc yearsofschool experience exp2 female numberofworkingaged mandarin partymember spouseeducation spouseexperience spouseexp2 _Iprovince_3 _Iprovince_5 _Iprovince_6) (minority) [pw = combinedchw] if(code==1 & a5>=18 & a5 < 60 & minoritytypet!=1 ), atet
