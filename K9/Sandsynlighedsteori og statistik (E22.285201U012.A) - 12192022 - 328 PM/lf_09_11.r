## M&R opgave 9.11, s. 299
# En golfspiller spiller 10 runder med middelscore 71.3 og standard-
# afvigelse 2.64. 

n = 10
x_streg = 71.3
s = 2.64

## a. Test om sand standardafvigelse er sigma = 2.4 med 5 % signifikans-
# niveau
sigma0 = 2.4

# 1. Hypoteser
# H0: sigma = sigma0
# H1: sigma > sigma0

# 2. Signifiansniveau
alfa = 0.05

# 3. Kriterier
# Teststørrelsen er chi2_0 = (n-1)*s^2/sigma0^2.
# Den er chi-i-anden fordelt med n-1 frihedsgrader
# Vi forkaster H0, hvis chi2_0 overskrider den kritiske grænse 
# chi2_alfa, hvor
chi2_alfa = qchisq(1-alfa, n-1)
# chi2_alfa = 16.9190

# 4. Beregninger
chi2_0 = (n-1)*s^2/sigma0^2
# chi2_0 = 10.89

# 5. Konklusion
# Da teststørrelsen chi2_0 = 10.89 ikke overskrider den kritiske 
# grænse chi2_alfa = 16.9190, kan vi ikke forkaste H0
# Vi har antaget, at golfspillerens scorer er normalfordelte, så det
# burde testes med normalfordelingsplot, hvis vi havde data.


## b. 
# Hvis fordelingen af golfspillerens score har en lang højre-hale, så
# kan vi afvise, at den er normalfordelt, og derfor holder 
# antagelserne bag hypotesetesten ikke. Så kan vi ikke stole på 
# resultaterne