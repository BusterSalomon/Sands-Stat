
## Opgave om en sprøjterobot og helligdage
## Delopgave a.-d. er stillet i Kap. 4, e. i Kap. 10


antal_m2 = 0.8            # Gennemsnitligt antal helligdage pr kvadratmeter
antal_skiver = 70
d = 1.2
areal_skive = pi * (d/2)^2


# a. Forventet antal helligdage på en tilfældig skive
# lambda er antal helligdage pr kvadratmeter og 
# A_skive er en skives areal, så
antal_pr_skive = antal_m2 * areal_skive


# b. Middelværdi, varians og standardafvigelse
# Det forventes at følge en Poissonfordeling, hvor lambda er gennemsnitlig
# antal helligdage pr skive, så derfor er deskriptorerne givet som
middelvaerdi = antal_pr_skive
varians = antal_pr_skive
standardafv = sqrt(antal_pr_skive)


# c. Sandsynligheden for at alle 70 skiver er fejlfri
# Sandsynligheden for 0 helligdage på 1 skive:
p_0_1 = dpois(0, antal_pr_skive)
# p_0_1 = 0.4046
# Samme sandsynlighed gælder for alle skiver, og de er uafhængige, så
p_0_70 = (p_0_1)^antal_skiver  # p_0_70 = 3.1201e-28

# Alternativt med dpois, vi forventer 70 gange så mange helligdage,
# når vi ser på 70 skiver:
p_0_70a = dpois(0, antal_skiver * antal_pr_skive)


# d. 
x = c(0:4)                    # Liste over antal helligdage 0,1,2,3,4 
p = dpois(x, antal_pr_skive)  # Liste med sands. for x helligdage
# Det første element i listen p er p[1] = 0.4046, altså p_0_1 fra c)
# Det femte element er sandsynligheden for *4* helligdage, p[5] = 0.0113.
# Vi bliver bedt om sandsynligheden for *4 eller flere* helligdage,
# det beregner vi med komplementærmetoden:
p[5] = 1 - ppois(3, antal_pr_skive)

# Jeg tjekker lige, at sandsynlighederne summer op til 1:
tot = sum(p)

# Det forventede antal skiver i de fem kategorier findes ved at gange 
# med antal skiver:
E = p * antal_skiver

# Svar:
E               
# 28.3241999 25.6271323 11.5934415  3.4964996  0.9587268


## e. Goodness of fit test
# Observeret antal i de fem kategorier: 
O = c(22, 31, 10, 7, 0)

# Da forventet antal er under 5 i de sidste to kategorier,
# selv hvis vi slår dem sammen (3.50 + 0.96 = 4.46 < 5), 
# bliver vi nødt til at slå de sidste tre kategorier sammen 

E[3] = E[3]+E[4]+E[5]
E = E[1:3]
O[3] = O[3]+O[4]+O[5]
O = O[1:3]
print(O)
print(E)


# 1. Hypoteser:
# H0: Antal fejl pr skive er poisson-fordelt
# H1: Antal fejl pr skive er ikke poisson-fordelt

# 2. Signifikansniveau:
alfa = 0.01

# 3. Kriterier:
# Teststørrelse: chi2_0 = sum((E-O)^2/E)
# chi2_0 er chi-i-anden fordelt med k - m - 1 frihedsgrader
# Vi har ingen parametre beregnet ud fra data. Vi kendte antal hellig-
# dage pr m^2 og kunne omregne det til lambda = antal_pr_skive = 0.905
# Derfor er antal beregnede parametre m = 0
m = 0  

k = length(O)     # Antal kategorier
df = k - m - 1    # Frihedsgrader
chi2_alfa = qchisq(1-alfa, df)  # Kritisk værdi af Chi2
# chi2_alfa = 9.210

# Beregninger:
# Teststørrelsen:
chi2_0 = sum((O-E)^2/E)
# chi2_0 = 2.595

# 5. Konklusion:
# Da teststørrelsen chi2_0 = 2.595 ikke overstiger den kritiske grænse
# chi2_alfa = 9.210 kan vi ikke forkaste nulhypotesen. 
# Vi tror altså på, at vi kan beskrive antal helligdage som poisson-
# fordelt. 


