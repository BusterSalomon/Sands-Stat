
## Eksempel p� Goodness of Fit problem fra powerpoint til kap. 10
# 60 studerende har afleveret et computerprogram. Underviseren 
# laver en oversigt over, hvor mange der har 0, 1, 2, ... fejl


N = c(0, 1, 2, 3)       # N er kategorier over antal fejl i programmerne
O = c(32, 15, 9, 4)     # O er observeret antal programmer i hver kategori
n = sum(O)              # Antal afleveringer ialt

lambda = sum(N*O)/n     # Estimering af lambda, hvis data er pois.ford.
p = dpois(N,lambda)     # Sandsynligheder, hvis det er poissonfordelt
p[4] = 1-ppois(2, lambda)  # Sidste kategori skal v�re "4 eller flere"
test = sum(p)           # Summen skal v�re 1

E = n*p                 # Forventet antal i hver kategori

# Tommelfingerregel: Da E[4]<5 sl�r vi de sidste to kategorier sammen
# I b�de O, p og E
O[3] = O[3]+O[4] 
O = O[1:3]
p[3] = p[3]+p[4]
p = p[1:3]
E = n*p

# Beregner testst�rrelsen
chi2_0 = sum((O-E)^2/E)   # chi2_0 = 2.9628

# Alternativt kan R's funktion til Goodness of Fit, chisq.test(), 
# benyttes til at f� beregnet E og chi2_0.
# Vi skal f�rst gendanne O og p
O = c(32, 15, 9, 4)     # O er observeret antal programmer i hver kategori
p = dpois(N,lambda)     # Sandsynligheder, hvis det er poissonfordelt
p[4] = 1-ppois(2, lambda)  # Sidste kategori skal v�re "4 eller flere"

res = chisq.test(O,             # Observationerne
                 p=p,           # vektor med sandsynligheder
                 correct=FALSE  # metoden skal ikke korrigere
                 )
# Funktionen giver en advarsel om at resultatet kan v�re ukorrekt. 
# Den siger ikke, at det skyldes, at det forventede antal er under 5
# i nogle af kategorierne (tommelfingerreglen). 
print(res)
chi2_0_alt = res$statistic
E_alt = res$expected
# Men man skal selv sl� kategorier sammen
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
# ikke,at vi har estimeret 1 parameter fra data (lambda), s� antal 
# frihedsgrader beregnes til df = n - 1 = 2. Det er forkert. 
# Antal frihedsgrader er df = n - 1 - 1 = 1. Det giver forkert p-v�rdi.

# Vi kan KUN bruge chisq.test() til at f� beregnet chi2_0 og E.

# Resten er vi n�dt til at g�re, uanset om chisq.test() er brugt eller ej
alfa = 0.05                     # Signifikansniveau
parms = 1                       # Vi har estimeret lambda ud fra obs.
df = length(O) - parms - 1      # Frihedsgrader
chi2_alfa = qchisq(1-alfa, df)  # Kritisk v�rdi af Chi2

p_vaerdi = 1 - pchisq(chi2_0, df)

# Da testst�rrelsen chi2_0 = 2.96 ikke overstiger den kritiske gr�nse
# chi2_alfa = 3.84 kan vi ikke forkaste nulhypotesen p� 5 % signifikans-
# niveau. P-v�rdien er 0.085.
# Vi kan alts� tro p�, at antal fejl er poissonfordelt.