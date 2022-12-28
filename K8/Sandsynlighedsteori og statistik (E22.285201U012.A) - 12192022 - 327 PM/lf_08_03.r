

## Løsningsforslag til opg. 8.3 om to stikprøver af cement, hvor der 
## måles 'dynamic modulus'

# Stikprøve 1:
n_1 = 33
x_streg = 115.1
s_1 = 0.47

# Stikprøve 2:
n_2 = 31
y_streg = 114.6
s_2 = 0.38

# Data for hypotesetesten:
alfa = 0.05    # 5 % signifikansniveau
delta_0 = 0    # Vi tester om forskellen er 0


## 1. Hypoteser
# H0: mu_1 - mu_2 = delta_0 = 0
# H1: mu_1 - mu_2 <> 0   (hvor '<>' betyder 'forskellig fra')

## 2. Signifikansniveau
# Der er valgt 5 % signifikansniveau

## 3. Kriterier
# Da n_1, n_2 > 30 er det store stikprøver. Derfor kan vi bruge
# teststørrelsen: z_0 = (x_streg - y_streg)/sqrt(s_1^2/n_1 + s_2^2/n_2)
# Teststørrelsen følger standard normalfordelingen
# Da vi har tosidet test, er 
z_alfahalve = qnorm(1 - alfa/2)
# z_alfahalve = 1.96
# D.v.s. vi forkaster H0, hvis |z_0| > z_alfahalve

## 4. Beregning
z_0 = (x_streg - y_streg)/sqrt(s_1^2/n_1 + s_2^2/n_2)  
# z_0 = 4.6928

## 5. Konklusion
# Da z_0 > z_alfahalve, forkaster vi H0. Der er altså forskel på de
# to typer cement

# Der er ingen antagelser at teste, da vi har store stikprøver
