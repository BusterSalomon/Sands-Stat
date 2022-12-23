

## Opgave om slitage af to materialer

D = read.table("Kap08/slitage_2_materialer.csv", header=TRUE, sep=";")

materiale = D$Materiale
slitage   = D$SlitageIndeks

n_A = 12
n_B = 10


## a. Parallelt boksplot
boxplot(slitage~materiale,
        main="Slitageindeks for materialerne A og B")
# Boksplottet viser at A's median og interkvartile range ligger over 
# B's. B's koste er en anelse længere end A's, men ellers er de to 
# diagrammer meget sammenlignelige i størrelse, bortset fra at A's 
# ligger højere. B lader altså til at have et lavere slitageindeks
# og dermed være mere slidstærk. 
# Der lader ikke til at være outliers. 


## b. Hypoteser
alfa = 0.05                   # Signifikansniveau
delta0 = 2                    # Formodet forskel i middelværdier

# H0: mu_A - mu_B = delta0
# H1: mu_A - mu_B > delta0 
# N.B. Ensidig test, da udgangspunktet er at B er mere slidstærk end A


## c. Opstil og beregn teststørrelsen
# Teststørrelse, da vi har små stikprøvestørrelser
# t0 = (x_A_streg - y_B_streg - delta0)/(s_p*sqrt(1/n_A + 1/n_B))
# t0 er t-fordelt med n_A + n_B - 2 frihedsgrader

# Beregning
# Slitageindeks for hvert materiale
slitageA = slitage[1:n_A]
slitageB = slitage[(n_A+1):(n_A+n_B)]

# Stikprøve-middelværdier
x_A_streg = mean(slitageA)
y_B_streg = mean(slitageB)

# stikprøve-standardafvigelser
s_A = sd(slitageA)
s_B = sd(slitageB)

# Puljet standardafvigelse
s_p = sqrt(((n_A - 1)*s_A^2 + (n_B - 1)*s_B^2)/(n_A + n_B - 2))

# Teststørrelse
t0 = (x_A_streg - y_B_streg - delta0)/(s_p*sqrt(1/n_A + 1/n_B))
# t0 = 1.4450


## d. Kritisk region og konklusion
# Vi har en ensidet, højrehalet test: 
t_alfa = qt(1-alfa, n_A + n_B - 2)
# t_alfa = 1.7247 

# Da teststørrelsen t0 ikke er større end den kritiske grænse t_alfa, 
# kan vi ikke forkaste nulhypotesen. På 5 % siginifikansniveau er der 
# ikke en forskel på 2 i slitageindeks

# Kontrol med t.test()
res = t.test(slitageA, slitageB, 
             alternative="greater", 
             mu=2, 
             var.equal=TRUE)
print(res)
# Vi kan se, at teststørrelsen også  beregnes til 1.445 af t.test()


## e. Er der forskel på de to materialers slidstyrke?
# Ny test med delta0 = 0. Desuden giver det mening at lave den tosidet
# Hypoteser
# H0: 
# H0: mu_A - mu_B = 0
# H1: mu_A - mu_B <> 0 

delta0 = 0
t0 = (x_A_streg - y_B_streg - delta0)/(s_p*sqrt(1/n_A + 1/n_B))
# Nu er t0 = 2.4772
t_alfahalve = qt(1-alfa/2, n_A + n_B - 2)
# t_alfahalve = 2.0860

# Nu et t0 > t_alfahalve, så vi forkaster nulhypotesen. Der er altså
# forskel i slitageindeks på de to materialer

# Tjek med t.test()
res2 = t.test(slitageA, slitageB, 
             alternative="two.sided", 
             mu=0, 
             var.equal=TRUE)
print(res2)


## f. 95 % konfidensinterval for forskellen på middelværdier
E = t_alfahalve * s_p * sqrt(1/n_A + 1/n_B)
KI_lav = x_A_streg - y_B_streg - E
KI_hoj = x_A_streg - y_B_streg + E
# Konfidensintervallet er [0.758; 8.842]
# Vi kan konstatere, at 0 ikke er i konfidensintervallet, så der er
# forskel. Samme konfidensinterval fås med t.test() (i res2)


## g. Sammenholdning af boksplot, hypotesetest og konfidensinterval
# Boksplottet viser at der generelt er mere slitage på A end B, men 
# det er ikke et klart billede. Interkvartilet for B ligger under A, 
# men når kostene medtages er der stort overlap. 
# Hypotesetesten viser, at der er forskel på middelværdierne, 
# men forskellen er ikke over 2, som antaget. 
# 95 % konfidenstintervallet for forskellen af middelværdier 
# indeholder ikke 0, så det underbygger, at forskellen er større end 0


## h. Antagelser
# Vi har antaget, at stikprøverne kommer fra pæne fordelinger med 
# samme varians. 
stem(slitageA)
stem(slitageB)
# Begge stem-and-leaf plots viser, at stikprøvefordelingerne er pæne, 
# med et enkelt toppunkt. Fordelingerne er nogenlunde symmetriske, 
# dog med tendens til venstre-hale. 

qqnorm(slitageA)
qqnorm(slitageB)
# Begge normalfordelingsplots er nogenlunde lineære. 

# Boksplottene viser, at variansen er ensartet. Vi ser også, at 
# standardafvigelserne er tæt på hinanden (s_A = 4.2 og s_B = 4.9)
