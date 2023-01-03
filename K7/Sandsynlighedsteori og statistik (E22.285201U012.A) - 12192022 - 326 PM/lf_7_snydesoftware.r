

## Opgave om snydesoftware i dieselbiler


D = read.table("K7/Sandsynlighedsteori og statistik (E22.285201U012.A) - 12192022 - 326 PM/snydesoftware.csv", header=TRUE)

x = D$NOx

mu0 = 0.08
alfa = 0.05
n = length(x)


## a. Hypoteser
# H0: mu = mu0
# Ha: mu > mu0
# Da man er bekymret for, om bilerne overskrider gr�nsev�rdien p� 0.08,
# v�lges en ensidet hypotesetest, hvor H0 forkastes, hvis testst�rrelsen
# er tilstr�kkeligt langt over en gr�nsev�rdi


## b. testst�rrelsens formel og fordeling
# Vi unders�ger populationsmiddelv�rdien mu og kender ikke populations-
# standardafvigelsen sigma. Derfor bruger vi testst�rrelsen:
# t0 = (x_streg - mu0)/(s/sqrt(n))
# t0 f�lger en t-fordeling med n-1 frihedsgrader


## c. Beregn kritisk region, testst�rrelsens v�rdi og konkluder
# Da det er en ensidet test skal vi bestemme t_alfa, s� arealet under 
# kurven over t_alfa er alfa, med alfa = 0.05
t_alfa = qt(1-alfa, n-1)           # t_alfa = 1.833

x_streg = mean(x)
s = sd(x)
t0 = (x_streg - mu0)/(s/sqrt(n))   # t0 = 2.5822

# Da t0 = 2.582 og t_alfa = 1.833, er t0 > t_alfa, s� vi forkaster
# nulhypotesen. Bilerne overskrider gr�nsev�rdien for udledning af NOx


## d. P-v�rdi
p_value = 1 - pt(t0, n-1)
# p-v�rdien er 0.0148, og den angiver det mindste signifikansniveau,
# der tillader os at forkaste nulhypotesen. Da 0.0148 < 0.05 forkaster
# vi H0
  
  
## e. Konfidensinterval:
t_alfahalve = qt(1-alfa/2, n-1)
E = t_alfahalve * s * sqrt(1/n)
KI_lav = x_streg - E
KI_hoj = x_streg + E
# 95 % konfidensinterval: [0.0805; 0.0877]
# Bem�rk at mu0 = 0.08 ikke er i konfidensintervallet


## f. Pr�diktionsinterval:
P = t_alfahalve * s * sqrt(1 + 1/n)
PI_lav = x_streg - P
PI_hoj = x_streg + P
# 95 % pr�diktionsinterval: [0.0722; 0.0960]


## g. Antagelser
# Vi har antaget CGS. Da n = 10 skal vi teste om n er tilstr�kkelig
# stor til at CGS holder. 

stem(x)

# Stem-and-leaf plottet viser at data kommer fra en p�n fordeling med 
# et enkelt toppunkt, lidt h�jresk�v, men nogenlunde symmetrisk og med 
# hurtigt udd�ende haler

qqnorm(x)

# Normalfordelingsplottet viser ikke en s�rligt line�r sammenh�ng, s� 
# vi er ikke overbevist om, at stikpr�vens fordeling ligner 
# normalfordelingen. 
# Det er lidt bekymrende, at der kun er 10 observationer i stikpr�ven. 
# Med over 30 observationer ville vi v�re n�sten sikre p�, at den 
# centrale gr�nsev�rdis�tning holder. Det kan derfor anbefales, at 
# bilproducenten foretager NOx m�lingen p� flere biler for at v�re 
# mere sikker p�, at modelantagelserne holder. 
