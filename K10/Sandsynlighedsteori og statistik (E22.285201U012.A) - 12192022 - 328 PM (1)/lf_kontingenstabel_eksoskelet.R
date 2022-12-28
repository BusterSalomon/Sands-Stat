
## Opgave om mænds og kvinders foretrukne design af eksoskelettet 
## SwiftLift (kontingenstabel) 


## a. til d. har vi regnet i kap. 3


## e. Beregn forventet antal
# Man behøver ikke at bruge R til at beregne forventet antal. I dette 
# tilfælde er det sikkert lettere i andre værktøjer, eller i hånden. 
# Bemærk, at sidst i scriptet beregnes forventet antal med en R funktion.
 
# Jeg har brugt matricer med R's funktion matrix():
r = 2            # Antal rækker
c = 2            # Antal søjler
O = matrix(c(6, 11, 13, 7), nrow=r, ncol=c, byrow=TRUE)
print(O)
# NB matrix() indlæser data kolonnevis, hvis vi ikke har byrow=T

n = sum(O)                # Samlet antal skal være 37 testpersoner

# Rækkesummer og søjlesummer som hhv 2x1 og 1x2 matricer
rsum = matrix(rowSums(O), nrow=2)
ssum = matrix(colSums(O), ncol=2)

# Beregning af forventet antal i matricen E
# E_ij = rsum_i*ssum_j/n
E = rsum %*% ssum / n    # matrix-multiplikation i R med operatoren %*%
print(E)


## f. Hypoteser
# H0: Præference for prototypedesign er uafhængigt af køn
# H1: De er ikke uafhængige


## g. Teststørrelsen
# chi2_0 = sum((E-O)^2/E)
# chi2_0 er chi-i-anden fordelt med v = (r-1)*(c-1) = 1 frihedsgrader
v = (r-1)*(c-1)


## h. Beregning og konklusion
alfa = 0.05
chi2_alfa = qchisq(1-alfa, v)
chi2_0 = sum((E-O)^2/E)

# Konklusion
# Da teststørrelsen chi2_0 = 3.25 ikke overstiger den kritiske grænse
# chi2_alfa = 3.84, kan vi ikke forkaste nulhypotesen. Dermed er de 
# forskelle i præferencer, vi har observeret mellem kønnene ikke 
# tilstrækkeligt store til, at vi kan udelukke, at de er tilfældige.


## Alternativ løsning med R funktionen chisq.test()

# R funktionen til kontingenstabel, chisq.test(), beregner bla.
# forventet antal, givet at der der er uafhængighed, for os automatisk.
res = chisq.test(O,                 # O er array med observationer
                 correct = FALSE)   # Vigtigt for at undgå en automatisk 
                                    # korrektion for små tabeller
print(res)

E = res$expected          # Array med forventet antal findes i expected
chi2_0 = res$statistic    # Teststørrelsens værdi findes i statistic

X = (E-O)^2/E             # Hver celles bidrag til teststørrelsen
chi2_0_alt = sum(X)       # Tester at summen stemmer

