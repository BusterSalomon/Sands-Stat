
## Opgave om driftstid for tre typer batterier til eksoskelet

D = read.csv("Kap12/data_batteri_driftstid.csv", sep=";", header=TRUE)
batteritype = D$Batteritype
driftstid   = D$Driftstid


## a: Parallelt boksplot for hver batteritype
boxplot(driftstid~batteritype, 
        main="Målt driftstid for tre typer batterier",
        xlab="Batteritype",
        ylab="Driftstid (sekunder)")

# Batteritype A og C har nogenlunde samme median, men A's median er  
# en anelse over C. Medianen for type B ligger markant lavere.  
# Boksplottene for type B og C ser meget ensartede ud, bortset fra 
# niveauet, hvor type C ligger højere end type B. Type A ligger 
# på niveau med type C, men lader til at have en del mere 
# variation end type B og C. 
# Da hvert boksplot er tegnet på baggrund af kun 6 observationer, 
# er det svært at konkludere, alene ud fra boksplottet, om der er 
# reelle forskelle på de tre batterityper.


## b: Variansanalyse (ANOVA)

fm1 = aov(driftstid~batteritype)
summary(fm1)

# Variansanalysen har F = 3.6 og en tilhørende p-værdi på 0.0529. 
# Det vil sige, at vi kan ikke afvise på 5 % signifikansniveau, at 
# alle 3 batterityper har samme driftstid (da 0.0529 > 0.05). 
# Med andre ord: Bedømt ud fra variansanalysen kan alle tre 
# batterityper godt have samme forventede driftstid. 


## c: Parvis sammenligning af batterityperne 
# Signifikansniveau:
alfa = 0.05

# Tukey HSD:
TukeyHSD(fm1, conf.level=1-alfa)
# 95 % Konfidensinterval for hvert par:
# B-A: [-2784;  517]  Der er ikke forskel
# C-A: [-1114; 2187]  Der er ikke forskel
# C-B: [   19; 3321]  Der er forskel, for 0 er ikke i intervallet
# Vi ser også, at p-værdien for forskellen på type B og C er 0.047,
# altså en smule under alfa = 0.05.


## d: Antagelser
# Vi har antaget, at residualerne er normalfordelte med samme
# varians (varianshomogenitet)

# Vi får beregnet residualerne af funktionen aov():
e = fm1$residuals
# Tilsvarende med y_hat: 
y_hat = fm1$fitted.values

# Jeg præsenterer residualerne sammen med data og y_hat:
res = cbind(batteritype, driftstid, y_hat, e)
print(res)

# Test for normalfordelte residualer:
qqnorm(e)   
# Normalfordelingsplottet er nogenlunde lineært

# Residualplot
# plot() laver et boksplot som default, når x-aksen er en faktor.
# Derfor laver jeg A, B og C om til integers 1, 2, 3 med koden
# as.integer(batteritype):
plot(as.integer(batteritype), e, type="p",
     main="Residualplot for batterityper",
     xlab="Batteritype",
     ylab="Residual",
     col="blue")
abline(h=0, col="red")
# Residualerne er nogenlunde ensartet fordelt for de tre 
# batterityper, dog er der lidt mere variation for batteri A.

# Bartlett's test
bartlett.test(driftstid, batteritype)
# Da p-værdien for testen er 0.18 kan vi ikke forkaste nul-
# hypotesen om en varians for alle tre behandlinger. 
# Antagelsen om varianshomogenitet holder altså også. 

## e. Valg af den bedste batteritype
# Valget står mellem type A og C, der begge har høje driftstider. 
# Type B ligger generelt lavere i ydelse og er derfor ikke interes-
# sant. # Ifølge boksplottet i a. har type A både den højeste median 
# og den højeste enkeltmåling. Type C ligger næsten på samme niveau,
# men med variation. Da C lader til at yde både høj og ensartet
# driftstid, bliver det den type, jeg vælger. 

