The purpose of this project is to process and analyze landlord finances using publicly available data from the U.S. Census Bureau's Rental Housing Finance Survey.

# Data sources
Raw data are contained in the `data/` directory of this project. They are downloaded in CSV format from the [Census  Bureau's webpage for the Rental Housing Finance Survey](https://www.census.gov/programs-surveys/rhfs/data.html) alongside their documentation and organized by year into directories for 2012, 2015, 2018, and 2021.

The RHFS contains a significant amount of nonresponse. Understanding the reasons for nonresponse is important to understand the general applicability of the survey toward national conclusions. Most of the metadata about the survey can be gleaned from the `OUTCOME` variable, which is included in all four survey waves [fact check]. However, some surveys provide metadata on missing and incomplete responses, while others do note. Notes on the idiosyncrasies of each survey are below.

- *2012*: According the 2012 codebook, there were xx properties sampled, XX complete responses, and XX incomplete or missing responses. Of the missing responses, XX% were due to __, Y% were due to XX.... etc
- *2015*: According to the 2015 codebook, the 2015 RHFS sample included 10,257 properties. Of those properties, 3,896 were accompanied by "complete interviews". Neither the documentation nor data provided in the PUF file includes metadata on incomplete cases, so the reasons for incomplete and missing interviews are unclear. (Interviewee declined? Unavailable? Ineligible for survey?)
TODO: are the "complete responses" in 2012 and 2015 fully complete? Or are some of the questions "declined to answer"? explore this with a table of some variables and the response distributions and results.
- *2018*: For some reason, there is a discrepancy of 2 cases between 2 files (4330 vs 4332). The sample included 11,338 cases, and 4330 (4332?) were interviewed to completion.
- *2021*: 11,510 cases were sampled, and 5,106 had complete interviews.

## 2012
2012 data are located in `data/2012` and were obtained by
downloading the [2012 RHFS National Microdata CSV files as a ZIP file](https://www.census.gov/programs-surveys/rhfs/data/puf/2012/microdata.html) and then extracting the contents. Unlike other years, they are split into 5 files. Documentation for these files and the survey variables can be found in the [2012 RHFS Codebook](https://www.census.gov/programs-surveys/rhfs/data/puf/2012/2012-codebook.html).
The codebook is also saved within the directory.

## 2015 
2015 data are located in `data/2015  and were obtained by downloading the [2015 RHFS Microdata CSV](https://www.census.gov/programs-surveys/rhfs/data/puf/2015/microdata.html). Documentation for this CSV file and the survey variables can be found in the [2015 RHFS Codebook](https://www.census.gov/programs-surveys/rhfs/data/puf/2015/2015-codebook.html). The codebook is also saved within the directory.

## 2018
2018 data are located in `data/2018` and were obtained by downloading the [2018 RHFS Microdata CSV](https://www.census.gov/programs-surveys/rhfs/data/puf/2018/microdata.html). Documentation for this CSV file and the survey variables can be found in the [2018 RHFS Codebook](https://www.census.gov/programs-surveys/rhfs/data/puf/2018/2015-codebook.html). The codebook is also saved within the directory.

## 2021
2021 data are located in `data/2021` and were obtained by downloading
the [2021 RHFS Microdata CSV](https://www.census.gov/programs-surveys/rhfs/data/puf/2021/microdata.html). Documentation
for this CSV file and the survey variables can be found in the [2021 RHFS Codebook](https://www.census.gov/programs-surveys/rhfs/data/puf/2021/2021-codebook.html).
The codebook is also saved within the directory.

# Potential variables of interest
CONTROLPUF, 

- Public use file control number, scrambled, 
- PUF and IUF, 
- a serial number for each unique row

OUTCOME

- how and whether the interview was completed

REPWTG0

- replicate weight 0
- equivalent to WEIGHT variable REPWTG1 - REPWTG100
- replicate weights

LATITUDE

LONGITUDE

MAFID

SAMPUNITS

- total units at basic street address (BSA)
- I am unsure whether this tells you how many units there are in the building

BED0_R

- number of efficiencies, recode. IDK what that means
- universe: all properties in schop where NUMUNITS_R ge 2
- sum (RO_BED0, VR_BED0, OO_BED0, OV_BED0)
- is an "efficiency" a 0-bedroom unit?
- PUF only? why? "Variables referenced in the recode specifications are available in the internal use file"

BED1_R

- number of 1 bedroom units, recode
- all properties in schope where NUMUNITS_R ge 2
- sum (R0_BED1, VR_BED1, OO_BED1, OV_BED1)
- PUF only? why? "Variables referenced in the recode specifications are available in the internal use file"

BED2_R

BED3_R

- number of 3+ bedroom units, recode

CAPRATE_R

- capitalization rate for property
- all properties in scope where INTTYPE eq 1
- (TOTCOLL+COMMRENT-OPEX_R)/MRKTVAL_R

CPRESAMPT_R

- estimated capital reserves balance, recoded
- "-9" = not reported, "-8" = not availabe
- all properties in scope where INTTyPE eq 1
- PUF only? why?

MRKTVAL_R

- current market value
- "-9" = not reported
- PUF only, why?

MRKTVALPU_R

- market value per unit
- PUF only

NUMBLD_R

- number of buildings in property, recoded

NUMCAT_R

- number of units ini property, recode categorical

NUMUNITS_R

- Number of units in property, recode, topcoded

PURPRICE_R

- Rounded purhcase price

TEMPOC_R

- number of units occupied by property personnel

TOWNOC_R

- number of owner-occupied units

TRENOC_R

- number of renter occupied units

TRENVA_R

- number of units vacant for rent

TOTHVA_R

- number of other units vacant, recode

YRPROPACQ_R

- year property acquired by owner

CASHDWN

- cash down payment, yes or no. 
- only properties from 2016-2021

CASHDWNAMT

- cash down amount, only for properties from 2016-2021

HOWACQ

- how the property was acquired
- whether it was purchsed in a condition ready to rent or needed building and renovations

HOWMVAL

- basis for the current market value of the property
- e.g. local tax assessment, real estate appraisal, etc

TOTRENTVAC

- total num units for rent or vacant-for-rent, calculated by instrument
- idk how this is different from some of the other vacancy variables
- only applies to properties where NUMUNITS_R ge 2

UNITSTAT

- status of a single unit. Rented, vacant, etc
- I do not get this. Is each property not its own row? IS there one row per unit? idts
B0_TOTAL, B1_TOTAL, B2_TOTAL, B3_TOTAL
- nubmer of efficiencies, 1-bed, 2-bed, 3+bedroom units using the
- "Centurion instrument"

CPRESAMT

- estimated capital reserves balance.
- IUF only. new in 2021

DPNUMADDR

- total number of addresses
- by same landlord? Unclear. IUF only

MRKTVAL

- iuf version
- current market value

MRKTVALPU

- iuf version
- value per unit
OO_BED0, OO_BED1, OO_BED2, OO_BED3
- owner-occupied efficiencies, 1-bed units, 2-bed units, 3+bed units
OP_BED0, OP_BED1, OP_BED2, OP_BED3
- property personnel occupied efficiencies, 1-bed units, 2-bed units, 3+bed units
OV_BED0, OV_BED1, OV_BED2, OV_BED3
- other vacant efficiencies, 1 bed, 2 bed, etc

PURPRICE

- IUF only

RO_BED0, RO_BED1, RO_BED2, RO_BED3

- renter occupied efficiency, 1-bed, etc

TO_BED0, TO_BED1, TO_BED2, TO_BED3

- total number of efficiency units, 1 bed units, etc.
- calculated by instrument
- renamed BED0_R in puf

TO_BEDT

- iuf only
- total number of units, calculated by instrument

TOTALBLDGS

- total number of buildings

UNITSB1 - UNITSB20PL
- units in building 1
- all the way to number of units in building 20 or higher
- iuf

VR_BED0, VR_BED1, VR_BED2, VR_BED3

- number of vacant for-rent efficiencies, 1 bed, 2 bed, etc

YRNEWBLG

- year the newest building was constructed
- they also have a verification variable

YROLDBLG

- year oldest building constructed

YEARPROPACQ

- year the property was acquired

HRSMNGMNT

- hours owner spends on day to day management
- per what unit? year?
- number goes from 0 - 997

OWNENT

- current ownership entity
- 1 individuual investor
- 2 trustee for esate
- 3 llp lp or lc
- 4 tenant in common
- 5 general partnership
- 6 REIT
- etc
- interesting one

COMMSPACE

- whethr there is commercial use space, yes or no

COMMRENT

- total receipts from commercial rent
- universe is all properties in scope where INTTYPE = 1 and COMMSPACE = 1

CONCSS

- rent concessions
- none, less than 1 month, 1 month, creater than 1 month.
- could be interesting variable to study

CONCSSNUM

- number of current tenants getting rent concessions

ICABLE

- cable or satellite TV included in rent?

IELEC

- electricity in rent?

IGAS

- gas in rent?

IPARKING

- parking in rent?

IPOOL
- pool in rent?

ISEWER

- sewer in rent?

IWATER

- water in rent?

IWIFI
- internet in rent?

RCONTROL

- number of units that are rent controlled

RENT

- monthly rent, single units

RENTLT249_R - RENT5000R, RENTNOR

- number of units $1000 - $1099 rent, paid or asking
- 1100- 1249 rent, paid or asking,
- etc

TOTCOLL

- total rent collected during calendar 2020, rounded

TRENTRCTPV_R

- total rental receipts as percent of property value
- (TOTCOLL + COMMRENT) / MRKTVAL

B0_LT249 - B0_5000, B0_NORENT

- number of efficiency units, rent 1000-1099
- number of efficiency units, rent xx - xx
- etc

B1_LT249 - B1_5000, B1_NORENT

- number of 1bed units, rent 1000-1099
- number of 1bed units, rent xx - xx
- etc
B2_LT249 - B2_5000, B2_NORENT

- number of 2bed units, rent 1000-1099
- number of 2bed units, rent xx - xx
- etc

B3_LT249 - B3_5000, B3_NORENT

- number of 3bed+ units, rent 1000-1099
- number of 3bed+ units, rent xx - xx
- etc

BT_LT249 - BT_5000, BT_NORENT

- total number of units, rent 1000-1099
- total number of units, rent xx - xx
- etc

GROSSMULT

- gross rental multiplier
- I do not know what this is
