## Opgave om test af specifikation for fjedres fjederkonstant (kap 8)

## Baggrundsoplysninger
mu_0 = 4.0      # Producentens oplyste middelværdi
sigma_0 = 0.1   # Producentens oplyste standardafvigelse


## a: Stikprøvestørrelse
# Formlen for beregning af stikprøvestørrelsen:
# n = (z_alfahalve*sigma_0/B)^2 rundet op til nærmeste heltal

alfa = 0.05     # Signifikansniveau (5 %)
B = 0.05        # Ønsket bredde af konfidensinterval

z_alfahalve = qnorm(1-alfa/2)
n = (z_alfahalve*sigma_0/B)^2

# Resultatet er n = 15.3658, så vi runder op til n = 16. 
# Ved at vælge en stikprøvestørrelse på 16 er vi mindst 95% sikre på, 
# at den sande middelværdi mu ligger i intervallet x_streg +/- 0.05, 
# hvor x_streg er stikprøvemiddelværdien. 


## Indlæsning af stikprøvedata
D = read.table('Kap09/Data_fjederkonstant.csv', header=T)
x = D$Fjederkonstant
n = length(x)


## b. Hypoteser for test af fjedrenes varians
# Hypotesetesten foretages for varians. Vi har fået oplyst 
# producentens værdi for standardafvigelse, så vi beregner variansen 
# som kvadratet af standardafvigelsen, sigma_0:

var_0 = (sigma_0)^2  # var_0 er oplyst varians. 
# var_0 = 0.01 (N/mm)^2

# Maskinfabrikkens mistanke er, at variansen i virkeligheden er  
# større end oplyst af producenten, så det er en ensidet hypotesetest
# H0: var = var_0
# Ha: var > var_0


## c: Teststørrelsen
# Teststørrelsen for test af varians i en enkelt stikprøve er 
# chi2_0 = (n-1)*s2/var_0, hvor s2 er stikprøvevariansen 
# Teststørrelsen følger en chi-i-anden fordeling med n-1 
# frihedsgrader


## d: Kritisk region, teststørrelsen og konklusion
# Da vi har valgt en ensidig hypotesetest opadtil forkaster vi 
# nulhypotesen, hvis teststørrelsen er større end den kritiske 
# værdi, chi2_alfa, som har den egenskab, at arealet under kurven 
# for chi2 fordelingen over den kritiske værdi er netop alfa. 
# Dermed er den kritiske værdi
chi2_alfa = qchisq(1-alfa, n-1)   # chi2_alfa = 30.1435

# Stikprøvevarians s2:
s2 = var(x)
# Teststørrelse chi2_0:
chi2_0 = (n-1)*s2/var_0           # chi2_0 = 54.5

# Konklusion: 
# Teststørrelsen chi2_0 er 54.5000 og chi2_alfa er 30.1435. 
# Da teststørrelsen er over den kritiske værdi kan vi forkaste 
# nulhypotesen. 
# Variansen er altså i virkeligheden over producentens angivne værdi. 
# Med andre ord er fjedrene ikke så ensartede, som producenten har 
# lovet. 


## e: 95 % konfidensinterval
# Nedre værdi: 
KI_lav  = (n - 1)*s2/qchisq(1-alfa/2, n-1)
# Øvre værdi:
KI_hoej = (n - 1)*s2/qchisq(alfa/2, n-1)

# Konfidensinterval: (0.0166, 0.0612)
# Bemærk, at den oplyste varians på 0.01 ikke ligger i intervallet.


## f: Antagelser
# Hypotesetesten for varians antager, at stikprøven er tilfældig og 
# kommer fra en normalfordeling.
# Producenten har oplyst, at fjedrene er normalfordelt, men vi kan 
# teste det med et normalfordelingsplot

qqnorm(x)
# Resultatet af normalfordelingsplottet er, at stikprøvens 
# observationer ligger nogenlunde pænt på en linje. 
# Vi kan teste om stikprøven er tilfældig ved at plotte målingerne 
# efter rækkefølge
t = c(1:20)

plot(t,x, 
     main = 'Tidsplot af målinger i stikprøven',
     xlab = 'Rækkefølge af målinger',
     ylab = 'Målt fjederkonstant')

# Der er ikke nogen tydelig sammenhæng mellem målingerne, så vi har 
# ingen grund til at tro, at stikprøven ikke er tilfældig.


## g: Hypotesetest for fjedrenes middelværdi
# Maskinfabrikken har mistanke om, at middelværdien er lavere end 
# 4.0, derfor vælger vi en ensidet test:
# H0: mu = mu_0
# Ha: mu < mu_0


## h: Teststørrelsen
# Vi har fået oplyst populations-standardafvigelsen sigma = 0.1 N/mm,  
# menden foregående hypotesetest viser, at denne værdi ikke er  
# korrekt. 
# Derfor er det bedst at gå ud fra, at vi ikke kender standard-
#afvigelsen, så den må estimeres med stikprøvens standardafvigelse. 
# Derfor er teststørrelsen:
# t0 = (x_streg - mu_0)/(s/sqrt(n)), hvor x_streg og s er hhv. 
# middelværdi og standardafvigelse for stikprøven, og n er 
# stikprøvestørrelsen. 
# t0 er t-fordelt med n-1 frihedsgrader


## i: Kritisk værdi, teststørrelsen og konklusion

t_alfa = qt(alfa, n-1)             # t_alfa = -1.7291

# Vi skal forkaste H0 hvis t0 < t_alfa

x_streg = mean(x)                  # x_streg = 3.94
s = sd(x)
t0 = (x_streg - mu_0)/(s/sqrt(n))  # t0 = -1.5843

# Konklusion: 
# Teststørrelsen t_0 er -1.5843, mens den kritiske værdi t_alfa 
# er -1.7291. 
# Vi kan altså ikke forkaste H0 på 5 % signifikansniveau. Selv om
# stikprøvens middelværdi er 3.94, og altså under den lovede værdi på 
# 4.0, så giver stikprøven ikke bevis nok til at kunne sige, at den 
# sande middelværdi er under 4.0. 


## j: Antagelser
# I hypotesetesten for middelværdi har vi blot antaget den centrale
# grænseværdisætning. Det er en mildere antagelse end for hypotese-
# test af varians, hvor vi antog at stikprøven kom fra en normal-
# fordeling. 
# Her er det tilstrækkeligt, at stikprøven kommer fra
# en 'pæn' fordeling, dvs. en nogenlunde symmetrisk fordeling med et 
# enkelt toppunkt og uddøende haler. Da stikprøvestørrelsen på 20 er 
# forholdsvis høj holder antagelsen, selv hvis fordelingen ikke er 
# særligt pæn. 
# Vi kan teste antagelsen om en pæn fordeling med stem-and-leaf plot 
# og med et histogram. 

stem(x)

# Vi kan også teste om fordelingen er 'pæn' med et histogram:
hist(x)
# Begge diagrammer viser, ligesom normalfordelingsplottet i f), at 
# fordelingen er pæn.



