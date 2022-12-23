

## Opgave om snydesoftware i dieselbiler

D = read.table("Kap07/snydesoftware.csv", header=TRUE)

x = D$NOx

mu0 = 0.08
alfa = 0.05
n = length(x)


## a. Hypoteser
# H0: mu = mu0
# Ha: mu > mu0
# Da man er bekymret for, om bilerne overskrider grænseværdien på 0.08,
# vælges en ensidet hypotesetest, hvor H0 forkastes, hvis teststørrelsen
# er tilstrækkeligt langt over en grænseværdi


## b. teststørrelsens formel og fordeling
# Vi undersøger populationsmiddelværdien mu og kender ikke populations-
# standardafvigelsen sigma. Derfor bruger vi teststørrelsen:
# t0 = (x_streg - mu0)/(s/sqrt(n))
# t0 følger en t-fordeling med n-1 frihedsgrader


## c. Beregn kritisk region, teststørrelsens værdi og konkluder
# Da det er en ensidet test skal vi bestemme t_alfa, så arealet under 
# kurven over t_alfa er alfa, med alfa = 0.05
t_alfa = qt(1-alfa, n-1)           # t_alfa = 1.833

x_streg = mean(x)
s = sd(x)
t0 = (x_streg - mu0)/(s/sqrt(n))   # t0 = 2.5822

# Da t0 = 2.582 og t_alfa = 1.833, er t0 > t_alfa, så vi forkaster
# nulhypotesen. Bilerne overskrider grænseværdien for udledning af NOx


## d. P-værdi
p_value = 1 - pt(t0, n-1)
# p-værdien er 0.0148, og den angiver det mindste signifikansniveau,
# der tillader os at forkaste nulhypotesen. Da 0.0148 < 0.05 forkaster
# vi H0
  
  
## e. Konfidensinterval:
t_alfahalve = qt(1-alfa/2, n-1)
E = t_alfahalve * s * sqrt(1/n)
KI_lav = x_streg - E
KI_hoj = x_streg + E
# 95 % konfidensinterval: [0.0805; 0.0877]
# Bemærk at mu0 = 0.08 ikke er i konfidensintervallet


## f. Prædiktionsinterval:
P = t_alfahalve * s * sqrt(1 + 1/n)
PI_lav = x_streg - P
PI_hoj = x_streg + P
# 95 % prædiktionsinterval: [0.0722; 0.0960]


## g. Antagelser
# Vi har antaget CGS. Da n = 10 skal vi teste om n er tilstrækkelig
# stor til at CGS holder. 

stem(x)

# Stem-and-leaf plottet viser at data kommer fra en pæn fordeling med 
# et enkelt toppunkt, lidt højreskæv, men nogenlunde symmetrisk og med 
# hurtigt uddøende haler

qqnorm(x)

# Normalfordelingsplottet viser ikke en særligt lineær sammenhæng, så 
# vi er ikke overbevist om, at stikprøvens fordeling ligner 
# normalfordelingen. 
# Det er lidt bekymrende, at der kun er 10 observationer i stikprøven. 
# Med over 30 observationer ville vi være næsten sikre på, at den 
# centrale grænseværdisætning holder. Det kan derfor anbefales, at 
# bilproducenten foretager NOx målingen på flere biler for at være 
# mere sikker på, at modelantagelserne holder. 
