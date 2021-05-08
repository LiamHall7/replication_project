*************************************************
* The Dynamic American Dream
* Jennifer Wolak and David A.M. Peterson
* American Journal of Political Science
*************************************************
* models estimated using Stata/IC 14.2 for Windows (64 bit)
*************************************************

use "D:\belief in the american dream dataset.dta", clear
* place dataset in D: drive or change file location to match where file is saved

* TABLE 1, MODEL 1
regress d.amdream l.amdream d.ginih l.ginih d.homeown l.homeown d.mood l.mood d.ics l.ics midterm prezcamp 
* long-run multipliers for Table 1, model 1
nlcom _b[L.gini]/(-_b[L.amdream])
nlcom _b[L.homeown]/(-_b[L.amdream])
nlcom _b[L.mood]/(-_b[L.amdream])
nlcom _b[L.ics]/(-_b[L.amdream])
* Box-Ljung Q Test
predict q1, res
wntestq q1

* TABLE 1, MODEL 2
regress d.amdream l.amdream d.socmob l.socmob d.homeown l.homeown d.mood l.mood d.ics l.ics midterm prezcamp
* long-run multipliers for Table 1, model 2
nlcom _b[L.socmob]/(-_b[L.amdream])
nlcom _b[L.homeown]/(-_b[L.amdream])
nlcom _b[L.mood]/(-_b[L.amdream])
nlcom _b[L.ics]/(-_b[L.amdream])
* Box-Ljung Q Test
predict q2, res
wntestq q2

* FIGURE 1 AND FIGURE 2 
* see excel spreadsheet "belief in the american dream figures 1 and 2.xlsx"

* Figure 1: The Dynamics of Public Belief in the American Dream
* based on the Wcalc output in "american dream to 2018 quaterly wcalc output.csv"
* graphs the series amdream over time
* to produce a comparable plot in Stata
twoway (line amdream t), ytitle(Belief in the American Dream) xtitle(Year) title(Figure 1: The Dynamics of Public Belief in the American Dream) scheme(s2mono)

* Figure 2: Estimated Lag Distributions for Belief in the American Dream
* see calculations and plots in Excel sheet f2

* TABLE A2: UNIT ROOT AND STATIONARITY TESTS

* Augmented Dickey-Fuller
dfuller amdream
dfuller ginih
dfuller socmob
dfuller homeown
dfuller mood
dfuller ics

* Augmented Dickey-Fuller test, with trend
dfuller amdream, trend
dfuller ginih, trend
dfuller socmob, trend
dfuller homeown, trend
dfuller mood, trend
dfuller ics, trend

* DF-GLS unit root test
* different lag lengths noted in comment after command
* Ng-Perron: lag selected by sequential method
* MAIC: lag selected based on modified AIC
* SIC: lag seelected by mininum Schwarz information criterion

dfgls amdream
* Ng-Perron:13 SIC: 1  MAIC:7
dfgls ginih
* Ng-Perron:13 SIC: 13  MAIC:13
dfgls socmob
* Ng-Perron:13 SIC: 5  MAIC:13
dfgls homeown
* Ng-Perron:9 SIC: 4  MAIC:4
dfgls mood
* Ng-Perron:12 SIC: 1  MAIC:7
dfgls ics
* Ng-Perron:11 SIC: 1  MAIC:2

* Phllips-Perron
pperron amdream
pperron ginih
pperron socmob
pperron homeown
pperron mood
pperron ics

* Phillips-Perron, with trend
pperron amdream, trend
pperron ginih, trend
pperron socmob, trend
pperron homeown, trend
pperron mood, trend
pperron ics, trend

* Lo-MacKinlay variance ration test, k=4 and k=8
ssc install lomackinlay  
lomackinlay amdream
lomackinlay ginih
lomackinlay socmob
lomackinlay homeown
lomackinlay mood
lomackinlay ics

* KPSS test, stationary around mean, short lag truncation
ssc install kpss
kpss amdream, notrend 
kpss ginih, notrend 
kpss socmob, notrend 
kpss homeown, notrend 
kpss mood, notrend 
kpss ics, notrend 

* KPSS test, stationary around mean, long lag truncation
kpss amdream, maxlag(14) notrend
kpss ginih, maxlag(14) notrend
kpss socmob, maxlag(14) notrend
kpss homeown, maxlag(14) notrend
kpss mood, maxlag(14) notrend
kpss ics, maxlag(14) notrend

* KPSS test, stationary around trend, short lag truncation
kpss amdream 
kpss ginih 
kpss socmob 
kpss homeown 
kpss mood 
kpss ics 

* KPSS test, stationary around trend, long lag truncation
kpss amdream, maxlag(14)
kpss ginih, maxlag(14) 
kpss socmob, maxlag(14) 
kpss homeown, maxlag(14) 
kpss mood, maxlag(14) 
kpss ics, maxlag(14) 
