
## Eksempel på Goodness of Fit problem fra powerpoint til kap. 10
# 60 studerende har afleveret et computerprogram. Underviseren 
# laver en oversigt over, hvor mange der har 0, 1, 2, ... fejl


N = c(0, 1, 2, 3)       # N er kategorier over antal fejl i programmerne
O = c(32, 15, 9, 4)     # O er observeret antal programmer i hver kategori
n = sum(O)              # Antal afleveringer ialt

lambda = sum(N*O)/n     # Estimering af lambda, hvis data er pois.ford.
p = dpois(N,lambda)     # Sandsynligheder, hvis det er poissonfordelt
p[4] = 1-ppois(2, lambda)  # Sidste kategori skal være "4 eller flere"
test = sum(p)           # Summen skal være 1

E = n*p                 # Forventet antal i hver kategori

# Tommelfingerregel: Da E[4]<5 slår vi de sidste to kategorier sammen
# I både O, p og E
O[3] = O[3]+O[4] 
O = O[1:3]
p[3] = p[3]+p[4]
p = p[1:3]
E = n*p

# Beregner teststørrelsen
chi2_0 = sum((O-E)^2/E)   # chi2_0 = 2.9628

# Alternativt kan R's funktion til Goodness of Fit, chisq.test(), 
# benyttes til at få beregnet E og chi2_0.
# Vi skal først gendanne O og p
O = c(32, 15, 9, 4)     # O er observeret antal programmer i hver kategori
p = dpois(N,lambda)     # Sandsynligheder, hvis det er poissonfordelt
p[4] = 1-ppois(2, lambda)  # Sidste kategori skal være "4 eller flere"

res = chisq.test(O,             # Observationerne
                 p=p,           # vektor med sandsynligheder
                 correct=FALSE  # metoden skal ikke korrigere
                 )
# Funktionen giver en advarsel om at resultatet kan være ukorrekt. 
# Den siger ikke, at det skyldes, at det forventede antal er under 5
# i nogle af kategorierne (tommelfingerreglen). 
print(res)
chi2_0_alt = res$statistic
E_alt = res$expected
# Men man skal selv slå kategorier sammen
O[3] = O[3]+O[4] 
O = O[1:3]
p[3] = p[3]+p[4]
p = p[1:3]

res = chisq.test(O,             # Observationerne
                 p=p,           # vektor med sandsynligheder
                 correct=FALSE  # metoden skal ikke korrigere
                 )
print(res)
# NB: chisq.test() oplyser chi2_0, df og p-value. Men funktionen ved  
# ikke,at vi har estimeret 1 parameter fra data (lambda), så antal 
# frihedsgrader beregnes til df = n - 1 = 2. Det er forkert. 
# Antal frihedsgrader er df = n - 1 - 1 = 1. Det giver forkert p-værdi.

# Vi kan KUN bruge chisq.test() til at få beregnet chi2_0 og E.

# Resten er vi nødt til at gøre, uanset om chisq.test() er brugt eller ej
alfa = 0.05                     # Signifikansniveau
parms = 1                       # Vi har estimeret lambda ud fra obs.
df = length(O) - parms - 1      # Frihedsgrader
chi2_alfa = qchisq(1-alfa, df)  # Kritisk værdi af Chi2

p_vaerdi = 1 - pchisq(chi2_0, df)

# Da teststørrelsen chi2_0 = 2.96 ikke overstiger den kritiske grænse
# chi2_alfa = 3.84 kan vi ikke forkaste nulhypotesen på 5 % signifikans-
# niveau. P-værdien er 0.085.
# Vi kan altså tro på, at antal fejl er poissonfordelt.