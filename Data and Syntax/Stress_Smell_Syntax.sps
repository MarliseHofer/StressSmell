*Perceived stress two-way ANOVA.
GLM VAS1avg VAS2avg VAS3avg VAS4avg VAS5avg BY Condition
  /WSFACTOR=time 5 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(time*Condition)
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=time 
  /DESIGN=Condition.

*regression predicting perceived stress at each time point.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT VAS2avg
  /METHOD=ENTER condition.SP condition.UP VAS1avg.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT VAS3avg
  /METHOD=ENTER condition.SP condition.UP VAS1avg.
REGRESSION
  /MISSING LISTWISE
  /STATISTICS COEFF OUTS R ANOVA
  /CRITERIA=PIN(.05) POUT(.10)
  /NOORIGIN 
  /DEPENDENT vas.rec
  /METHOD=ENTER condition.SP condition.UP VAS1avg.

*Cortisol two-way ANOVA.
GLM Cort1 Cort2 Cort3 Cort4 Cort5 Cort6 Cort7 BY Condition
  /WSFACTOR=time 7 Polynomial 
  /METHOD=SSTYPE(3)
  /PLOT=PROFILE(time*Condition)
  /PRINT=ETASQ 
  /CRITERIA=ALPHA(.05)
  /WSDESIGN=time 
  /DESIGN=Condition.

*regression predicting cortisol at each time point.
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

*meditation analysis syntax is several thousand lines long, so not included..
*use PROCESS macro.




