

## Eksempel 7.20, hypotesetest med 1 stikprøve med ukendt sigma
#Blyindhold i vandprøver

# Oplysninger fra opgaven:
mu0 = 2.25
alfa = 0.025

#Indlæser data:
d = read.table("Kap07/exp0720.csv", header=TRUE)
bly = d$LeadConc    # Data er i kolonnen med navnet LeadConc

# Beregninger af data:
n = length(bly)
x_streg = mean(bly)
s = sd(bly)

# 1. Hypoteser
# H0: mu = mu0 = 2.25
# H1: mu > 2.25

# 2. Signifikansniveau
# Alfa er 0.025

# 3. Kriterier
# Teststørrelsen t0 = (x_streg - mu0)/(s/sqrt(n))
# er t-fordelt med n-1 frihedsgrader
# Vi forkaster H0, hvis t0 > t_alfa, hvor 
t_alfa = qt(1-alfa, n-1)
# t_alfa = 2.201

# 4. Beregn teststørrelsen
t0 = (x_streg - mu0)/(s/sqrt(n))
# t0 = 2.58

# 5. Beslutning
# Vi forkaster H0, da t0 > t_alfa
# Blyindholdet er over 2.25 på signifikansniveau 2.5 %

# P-værdi:
1 - pt(t0, n-1)
# P-værdien er 0.013. 
# Hvis H0 var sand, ville vi kun få sådan en stikprøve eller 
# en mere ekstrem i 1.3 % af tilfældene

# Konfidensinterval for mu:
t_alfahalve = qt(1-alfa/2, n-1)
B = t_alfahalve*s/sqrt(n)
KI_nedre = x_streg - B
KI_oevre = x_streg + B
# 98.75 % Konfidensinterval (!): [2.25; 2.72]


# Forsøg med funktionen t.test:
res = t.test(bly,                 # data
       alternative="greater",     # Vi har > i H1
       mu=2.25,                   # Værdien af mu0
       conf.level = 0.975)        # 1 - alfa

# For at få to-sidet konfidensinterval:
res2 = t.test(bly, 
             alternative="two.sided",
             mu=2.25,
             conf.level = 0.975)