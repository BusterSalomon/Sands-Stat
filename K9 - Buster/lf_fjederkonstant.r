## Opgave om test af specifikation for fjedres fjederkonstant (kap 8)

## Baggrundsoplysninger
mu_0 = 4.0      # Producentens oplyste middelv�rdi
sigma_0 = 0.1   # Producentens oplyste standardafvigelse


## a: Stikpr�vest�rrelse
# Formlen for beregning af stikpr�vest�rrelsen:
# n = (z_alfahalve*sigma_0/B)^2 rundet op til n�rmeste heltal

alfa = 0.05     # Signifikansniveau (5 %)
B = 0.05        # �nsket bredde af konfidensinterval

z_alfahalve = qnorm(1-alfa/2)
n = (z_alfahalve*sigma_0/B)^2

# Resultatet er n = 15.3658, s� vi runder op til n = 16. 
# Ved at v�lge en stikpr�vest�rrelse p� 16 er vi mindst 95% sikre p�, 
# at den sande middelv�rdi mu ligger i intervallet x_streg +/- 0.05, 
# hvor x_streg er stikpr�vemiddelv�rdien. 


## Indl�sning af stikpr�vedata
D = read.table('K9 - Buster/Data_fjederkonstant.csv', header=T)
x = D$Fjederkonstant
n = length(x)


## b. Hypoteser for test af fjedrenes varians
# Hypotesetesten foretages for varians. Vi har f�et oplyst 
# producentens v�rdi for standardafvigelse, s� vi beregner variansen 
# som kvadratet af standardafvigelsen, sigma_0:

var_0 = (sigma_0)^2  # var_0 er oplyst varians. 
# var_0 = 0.01 (N/mm)^2

# Maskinfabrikkens mistanke er, at variansen i virkeligheden er  
# st�rre end oplyst af producenten, s� det er en ensidet hypotesetest
# H0: var = var_0
# Ha: var > var_0


## c: Testst�rrelsen
# Testst�rrelsen for test af varians i en enkelt stikpr�ve er 
# chi2_0 = (n-1)*s2/var_0, hvor s2 er stikpr�vevariansen 
# Testst�rrelsen f�lger en chi-i-anden fordeling med n-1 
# frihedsgrader


## d: Kritisk region, testst�rrelsen og konklusion
# Da vi har valgt en ensidig hypotesetest opadtil forkaster vi 
# nulhypotesen, hvis testst�rrelsen er st�rre end den kritiske 
# v�rdi, chi2_alfa, som har den egenskab, at arealet under kurven 
# for chi2 fordelingen over den kritiske v�rdi er netop alfa. 
# Dermed er den kritiske v�rdi
chi2_alfa = qchisq(1-alfa, n-1)   # chi2_alfa = 30.1435

# Stikpr�vevarians s2:
s2 = var(x)
# Testst�rrelse chi2_0:
chi2_0 = (n-1)*s2/var_0           # chi2_0 = 54.5

# Konklusion: 
# Testst�rrelsen chi2_0 er 54.5000 og chi2_alfa er 30.1435. 
# Da testst�rrelsen er over den kritiske v�rdi kan vi forkaste 
# nulhypotesen. 
# Variansen er alts� i virkeligheden over producentens angivne v�rdi. 
# Med andre ord er fjedrene ikke s� ensartede, som producenten har 
# lovet. 


## e: 95 % konfidensinterval
# Nedre v�rdi: 
KI_lav  = (n - 1)*s2/qchisq(1-alfa/2, n-1)
# �vre v�rdi:
KI_hoej = (n - 1)*s2/qchisq(alfa/2, n-1)

# Konfidensinterval: (0.0166, 0.0612)
# Bem�rk, at den oplyste varians p� 0.01 ikke ligger i intervallet.


## f: Antagelser
# Hypotesetesten for varians antager, at stikpr�ven er tilf�ldig og 
# kommer fra en normalfordeling.
# Producenten har oplyst, at fjedrene er normalfordelt, men vi kan 
# teste det med et normalfordelingsplot

qqnorm(x)
# Resultatet af normalfordelingsplottet er, at stikpr�vens 
# observationer ligger nogenlunde p�nt p� en linje. 
# Vi kan teste om stikpr�ven er tilf�ldig ved at plotte m�lingerne 
# efter r�kkef�lge
t = c(1:20)

plot(t,x, 
     main = 'Tidsplot af m�linger i stikpr�ven',
     xlab = 'R�kkef�lge af m�linger',
     ylab = 'M�lt fjederkonstant')

# Der er ikke nogen tydelig sammenh�ng mellem m�lingerne, s� vi har 
# ingen grund til at tro, at stikpr�ven ikke er tilf�ldig.


## g: Hypotesetest for fjedrenes middelv�rdi
# Maskinfabrikken har mistanke om, at middelv�rdien er lavere end 
# 4.0, derfor v�lger vi en ensidet test:
# H0: mu = mu_0
# Ha: mu < mu_0


## h: Testst�rrelsen
# Vi har f�et oplyst populations-standardafvigelsen sigma = 0.1 N/mm,  
# menden foreg�ende hypotesetest viser, at denne v�rdi ikke er  
# korrekt. 
# Derfor er det bedst at g� ud fra, at vi ikke kender standard-
#afvigelsen, s� den m� estimeres med stikpr�vens standardafvigelse. 
# Derfor er testst�rrelsen:
# t0 = (x_streg - mu_0)/(s/sqrt(n)), hvor x_streg og s er hhv. 
# middelv�rdi og standardafvigelse for stikpr�ven, og n er 
# stikpr�vest�rrelsen. 
# t0 er t-fordelt med n-1 frihedsgrader


## i: Kritisk v�rdi, testst�rrelsen og konklusion

t_alfa = qt(alfa, n-1)             # t_alfa = -1.7291

# Vi skal forkaste H0 hvis t0 < t_alfa

x_streg = mean(x)                  # x_streg = 3.94
s = sd(x)
t0 = (x_streg - mu_0)/(s/sqrt(n))  # t0 = -1.5843

# Konklusion: 
# Testst�rrelsen t_0 er -1.5843, mens den kritiske v�rdi t_alfa 
# er -1.7291. 
# Vi kan alts� ikke forkaste H0 p� 5 % signifikansniveau. Selv om
# stikpr�vens middelv�rdi er 3.94, og alts� under den lovede v�rdi p� 
# 4.0, s� giver stikpr�ven ikke bevis nok til at kunne sige, at den 
# sande middelv�rdi er under 4.0. 


## j: Antagelser
# I hypotesetesten for middelv�rdi har vi blot antaget den centrale
# gr�nsev�rdis�tning. Det er en mildere antagelse end for hypotese-
# test af varians, hvor vi antog at stikpr�ven kom fra en normal-
# fordeling. 
# Her er det tilstr�kkeligt, at stikpr�ven kommer fra
# en 'p�n' fordeling, dvs. en nogenlunde symmetrisk fordeling med et 
# enkelt toppunkt og udd�ende haler. Da stikpr�vest�rrelsen p� 20 er 
# forholdsvis h�j holder antagelsen, selv hvis fordelingen ikke er 
# s�rligt p�n. 
# Vi kan teste antagelsen om en p�n fordeling med stem-and-leaf plot 
# og med et histogram. 

stem(x)

# Vi kan ogs� teste om fordelingen er 'p�n' med et histogram:
hist(x)
# Begge diagrammer viser, ligesom normalfordelingsplottet i f), at 
# fordelingen er p�n.



