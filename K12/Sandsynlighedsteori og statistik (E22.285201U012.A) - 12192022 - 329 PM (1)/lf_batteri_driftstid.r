
## Opgave om driftstid for tre typer batterier til eksoskelet

D = read.csv("Kap12/data_batteri_driftstid.csv", sep=";", header=TRUE)
batteritype = D$Batteritype
driftstid   = D$Driftstid


## a: Parallelt boksplot for hver batteritype
boxplot(driftstid~batteritype, 
        main="M�lt driftstid for tre typer batterier",
        xlab="Batteritype",
        ylab="Driftstid (sekunder)")

# Batteritype A og C har nogenlunde samme median, men A's median er  
# en anelse over C. Medianen for type B ligger markant lavere.  
# Boksplottene for type B og C ser meget ensartede ud, bortset fra 
# niveauet, hvor type C ligger h�jere end type B. Type A ligger 
# p� niveau med type C, men lader til at have en del mere 
# variation end type B og C. 
# Da hvert boksplot er tegnet p� baggrund af kun 6 observationer, 
# er det sv�rt at konkludere, alene ud fra boksplottet, om der er 
# reelle forskelle p� de tre batterityper.


## b: Variansanalyse (ANOVA)

fm1 = aov(driftstid~batteritype)
summary(fm1)

# Variansanalysen har F = 3.6 og en tilh�rende p-v�rdi p� 0.0529. 
# Det vil sige, at vi kan ikke afvise p� 5 % signifikansniveau, at 
# alle 3 batterityper har samme driftstid (da 0.0529 > 0.05). 
# Med andre ord: Bed�mt ud fra variansanalysen kan alle tre 
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
# Vi ser ogs�, at p-v�rdien for forskellen p� type B og C er 0.047,
# alts� en smule under alfa = 0.05.


## d: Antagelser
# Vi har antaget, at residualerne er normalfordelte med samme
# varians (varianshomogenitet)

# Vi f�r beregnet residualerne af funktionen aov():
e = fm1$residuals
# Tilsvarende med y_hat: 
y_hat = fm1$fitted.values

# Jeg pr�senterer residualerne sammen med data og y_hat:
res = cbind(batteritype, driftstid, y_hat, e)
print(res)

# Test for normalfordelte residualer:
qqnorm(e)   
# Normalfordelingsplottet er nogenlunde line�rt

# Residualplot
# plot() laver et boksplot som default, n�r x-aksen er en faktor.
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
# Da p-v�rdien for testen er 0.18 kan vi ikke forkaste nul-
# hypotesen om en varians for alle tre behandlinger. 
# Antagelsen om varianshomogenitet holder alts� ogs�. 

## e. Valg af den bedste batteritype
# Valget st�r mellem type A og C, der begge har h�je driftstider. 
# Type B ligger generelt lavere i ydelse og er derfor ikke interes-
# sant. # If�lge boksplottet i a. har type A b�de den h�jeste median 
# og den h�jeste enkeltm�ling. Type C ligger n�sten p� samme niveau,
# men med variation. Da C lader til at yde b�de h�j og ensartet
# driftstid, bliver det den type, jeg v�lger. 

