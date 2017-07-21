*Calculations in Supplemental Materials

*heart rate.
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

*effect of belief on scent effectiveness.
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

*ANOVAs predicting demographic information from scent condition.
USE ALL.
ONEWAY RS_total AAQ_avoidance AAQ_ambivalence DEMO.6 DEMO.7 DEMO.8 DEMO.11 BFNE BY Condition
  /STATISTICS DESCRIPTIVES 
  /MISSING ANALYSIS.
