## M&R opgave 9.5, s. 293. Data fra opg. 7.63, s. 255
## En cigaretfabrikant p�st�r, at indholdet af tj�re er 14.0 i snit.
## Tj�reindholdet antages normalfordelt

mu = 14.0

# Stikpr�ve
x = c(14.5, 14.2, 14.4, 14.3, 14.6)
n = length(x)
x_streg = mean(x)
s2 = var(x)    # Stikpr�vevarians

alfa = 0.01

chi2_hoejre = qchisq(1-alfa/2, n-1)
chi2_venstre = qchisq(alfa/2, n-1)

KI_lav = (n-1)*s2/chi2_hoejre
KI_hoej = (n-1)*s2/chi2_venstre
# 99% konfidensinterval for variansen er [0.0067; 0.4831]