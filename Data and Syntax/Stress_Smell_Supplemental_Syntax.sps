*Calculations in Supplemental Materials (Except HLM calculations which were done using R)

*ANOVAs predicting demographic information from scent condition.
*Page 4.
ONEWAY RS_total AAQ_avoidance AAQ_ambivalence DEMO.6 DEMO.7 DEMO.8 DEMO.11 BFNE BY Condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS.

*Heart Rate Analyses 	
*Pages 5-6.
USE ALL.
COMPUTE filter_$=(HR.Overall.Judge = 1).
VARIABLE LABELS filter_$ 'HR.Overall.Judge = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

GLM HR.1.stand HR.2.prep HR.3.speech HR.4.math HR.5.recover BY Condition
  /WSFACTOR=time 5 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(time*Condition)
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=time 
  /DESIGN=Condition.


*Relationship Between Perceived Stress and Cortisol 
*Pages 7-8
*syntax not incuded beacuse it was calculaed using the PROCESS macro and is hundreds of lines long. 


*ANOVA - Actual Scent Exposure 
*Pages 10-11
*select only people who did NOT believe they smelled their partners scent.
USE ALL.
COMPUTE filter_$=(belief = 1).
VARIABLE LABELS filter_$ 'belief = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

*subjective stress.
GLM VAS1avg VAS2avg VAS3avg VAS4avg VAS5avg BY Condition
  /WSFACTOR=time 5 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(time*Condition)
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=time 
  /DESIGN=Condition.

*cortisol.
GLM Cort1 Cort2 Cort3 Cort4 Cort5 Cort6 Cort7 BY Condition
  /WSFACTOR=time 7 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(time*Condition)
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=time 
  /DESIGN=Condition.

*Belief about Scent Exposure
*Pages 12-13
*select only people exposed to partner scent.
USE ALL.
COMPUTE filter_$=(Condition = 3).
VARIABLE LABELS filter_$ 'Condition = 3 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

*subjective stress.
GLM VAS1avg VAS2avg VAS3avg VAS4avg VAS5avg BY belief
  /WSFACTOR=time 5 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(time*belief)
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=time 
  /DESIGN=belief.

*cortisol.
GLM Cort1 Cort2 Cort3 Cort4 Cort5 Cort6 Cort7 BY belief
  /WSFACTOR=time 7 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(time*belief)
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=time 
  /DESIGN=belief.

*ANOVA - Women Who Correctly Identified if They Had Smelled Their Partner’s Shirt 
*Pages 18-20
*select only women Who Correctly Identified if They Had Smelled Their Partner’s Shirt.
USE ALL.
COMPUTE filter_$=(belief.correct = 1).
VARIABLE LABELS filter_$ 'belief.correct = 1 (FILTER)'.
VALUE LABELS filter_$ 0 'Not Selected' 1 'Selected'.
FORMATS filter_$ (f1.0).
FILTER BY filter_$.
EXECUTE.

*ANOVA perceived stress.
GLM VAS1avg VAS2avg VAS3avg VAS4avg VAS5avg BY Condition
  /WSFACTOR=time 5 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(time*Condition)
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=time 
  /DESIGN=Condition.

*regression.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT VAS2avg
  /METHOD=ENTER VAS1avg  condition.SP condition.UP.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT VAS3avg
  /METHOD=ENTER VAS1avg  condition.SP condition.UP.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT vas.rec
  /METHOD=ENTER VAS1avg  condition.SP condition.UP.

*ANOVA cortisol.
GLM Cort1 Cort2 Cort3 Cort4 Cort5 Cort6 Cort7 BY Condition
  /WSFACTOR=time 7 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(time*Condition)
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=time 
  /DESIGN=Condition.

#regression.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT Cort3
  /METHOD=ENTER condition.SP condition.UP Cort1.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT cort.tst
  /METHOD=ENTER condition.SP condition.UP Cort1.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT cort.rec
  /METHOD=ENTER condition.SP condition.UP Cort1.





