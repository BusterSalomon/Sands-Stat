D = read.table("K7/snydesoftware.csv", header=TRUE)
x = D$NOx
mu0 = 0.08
alfa = 0.05
n = length(x)

# a) Man ønsker at slå fast med et signifikansniveau på 5 %, om NOx udledningen for bilmodellen
#    er over grænseværdien på 0.08 g/km. Opstil nulhypotese og alternativhypotese for denne
#    hypotesetest.
# Hvad er en ensidet hypotesetest?


# Nulhypotese: H0: mu = 0.08 g/km
# Alternativhypotese: H1: mu > 0.08 g/km


# b) Opstil en formel for teststørrelsen. Angiv hvilken fordeling den følger.
# Hvad menes der med teststørrelsen?

# Bruger t0 = (x_streg - mu0)/(s/sqrt(n))

