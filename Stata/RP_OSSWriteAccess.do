***************************************************
*************** Novelty Analysis ******************
***************************************************
import excel "RP_WA_Novelty.xlsx", sheet("Sheet1") firstrow clear

***************** Descriptive *********************
******************** Table 4 ***********************
sum novelty
sum proportion_WA
sum org_owner 
pwcorr novelty proportion_WA org_owner

***************** Main Results *********************
******************** Table 5 ***********************

reghdfe novelty proportion_WA , absorb(repo_id month) 
reghdfe novelty c.proportion_WA##i.org_owner , absorb(repo_id month) 

****************** Mechanism Tests ***************** 
******************** Table 13 ***********************
reghdfe contribution_diversity proportion_WA, absorb(repo_id month) 

******************** Table 14 ***********************
reghdfe bug_fix proportion_WA, absorb(repo_id month) 

***************************************************
*************** Survival Analysis *****************
***************************************************

import excel "RP_WA_Survival.xlsx", sheet("Sheet1") firstrow 

***************** Descriptive *********************
******************** Table 6 ***********************
sum inactivity
sum proportion_WA
sum org_owner 
pwcorr inactivity proportion_WA org_owner 
***************** Main Results *********************
******************** Table 7 ***********************

stset survival_period_day, failure(inactivity)
stcox org_owner proportion_WA, nohr
stcox org_owner proportion_WA  proportionXorg  , nohr 
