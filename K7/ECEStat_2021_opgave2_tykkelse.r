## ECE Sandsynlighedsteori og Statistik 2021

## Opgave 2 om kvalitetskontrol af bremseskiver

# Generel kode til at sætte working directory til filens mappe 
# (virker kun i RStudio):
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
# Nu kan jeg åbne datafilen uden at skrive stien:
D = read.table('K7/Data_ECEStat_2021_opg2.csv', header=TRUE, sep=";")
x = D$Opg2_Tykkelse

n = 28
mu0 = 21.8
alfa = 0.05


## a. Hypoteser
# Der er ingen oplysninger om, at man formoder, at tykkelsen er større eller 
# mindre end mu0, så vi vælger en tosidet test (H1: my <> mu0, hvor '<>' 
# betyder'forskellig fra'):
# H0:  my = mu0
# H1:  my <> mu0


## b. Teststørrelse og kritisk interval
# Vi kender ikke populations-standardafvigelsen sigma. Derfor er formlen  
# for teststørrelsen: 
# t0 = (x_streg - mu0)/(s/sqrt(n))
# t0 er t-fordelt med n-1 frihedsgrader 

# Kritisk værdi t_alfahalve, ved 2-sidet hypotesetest:
t_alfahalve = qt(1-alfa/2, n-1)       # t_alfahalve = 2.0518
t_alfahalve

# Vi forkaster nulhypotesen, hvis |t0| > t_alfahalve

  
## c. Beregning af teststørrelsen og konklusion 
x_streg = mean(x)                      # x_streg = 21.7
s = sd(x)                              # s = 0.2018
t0 = (x_streg - mu0)/(s/sqrt(n))       # t0 = -2.6216
# Vi kan forkaste nulhypotesen, da 
# |t0| = 2.6216 > 2.0518 = t_alfahalve
# Med andre ord er den sande tykkelse under 21.8

# P-værdien kan beregnes:
p_vaerdi = 2*pt(t0, n-1)               # p_vaerdi = 0.0142
# D.v.s. hvis mu = 21.8, så vil en stikprøve som denne eller mere
# ekstrem kun forekomme i under 2 % af tilfældene. 


## d. Antagelser
# Vi har antaget den centrale grænseværdisætning. Da vi har en stik-
# prøvestørrelse på n=28 er vi næsten sikre på, at CGS holder, uanset
# fordelingen af populationen. For en sikkerheds skyld tester vi, om
# den er 'pæn':
stem(x)
# Stem-and-leaf plottet viser en population, der er nogenlunde 
# symmetrisk, med et toppunkt og hurtigt uddøende haler.

hist(x)
# Histogrammet viser det samme.

qqnorm(x)
# Normalfordelingsplottet viser at data ligger nogenlunde
# på en ret linje. 

# Vi kan konkludere, at antagelserne om CGS holder.


## e. 99 % Konfidensinterval
alfa = 0.01
t_alfahalve = -qt(alfa/2, n-1)       # t_alfahalve = 2.7707
KI_bredde = t_alfahalve*s/sqrt(n)    # KI_bredde = 0.1057
KI_nedre = x_streg - KI_bredde       # KI_nedre = 21.5943
KI_oevre = x_streg + KI_bredde       # KI_oevre = 21.8057
# 99 % Konfidensinterval: [21.59, 21.81]
# Vi er altså 99 % sikre på, at den sande tykkelse mu er mellem
# 21.59 og 21.81 mm. 


## f. 95 % Prædiktionsinterval
# NB: Da vi har ny værdi af alfa skal t_alfahalve genberegnes
alfa = 0.05
t_alfahalve = -qt(alfa/2, n-1)         # t_alfahalve = 2.0518
PI_bredde = t_alfahalve*s*sqrt(1+1/n)  # PI_bredde = 0.4215
PI_nedre = x_streg - PI_bredde         # PI_nedre = 21.2785
PI_oevre = x_streg + PI_bredde         # PI_oevre = 22.1215
# 95 % prædiktionsinterval: [21.28, 22.12]
# 95 % af bremseskiverne vil have en tykkelse mellem
# 21.28 og 22.12 mm. 



