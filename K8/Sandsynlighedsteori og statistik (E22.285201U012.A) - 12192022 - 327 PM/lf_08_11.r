

## Løsningsfoslag til opgave 08.11 om hydrauliske pumper

type_A = c(8, 6, 7, 9, 4, 11, 8, 10, 6, 9)
type_B = c(4, 3, 6, 7, 7, 1, 9, 6)

n_1 = length(type_A)
x_streg = mean(type_A)
s_1 = sd(type_A)

n_2 = length(type_B)
y_streg = mean(type_B)
s_2 = sd(type_B)

alfa = 0.05 
delta_0 = 0

## 1. Hypoteser
# H0: mu_1 - mu_2 = delta_0 = 0
# H1: mu_1 - mu_2 <> 0

## 2. Signifikansniveau
# Der er valgt 5 % signifikansniveau

## 3. Kriterier
# Vi har to uafhængige stikprøver med lav stikprøvestørrelse, så 
# Stikprøvestørrelsen:
# t0 = (x_streg - y_streg - delta_0)/s_p*sqrt(1/n_1 + 1/n_2)
# hvor s_p er den puljede standardafvigelse
# t_0 er t-fordelt med n_1 + n_2 - 2 frihedsgrader

# Vi har en tosidet test, så den kritiske grænse er
t_alfahalve = qt(1-alfa/2, n_1+n_2-2)
# t_alfahalve = 2.1199

## 4. Beregning
# Først beregnes den puljede standardafvigelse, s_p:
s_p = sqrt(((n_1 - 1)*s_1^2 + (n_2 - 1)*s_2^2)/(n_1 + n_2 - 2))

t0 = (x_streg - y_streg - delta_0)/(s_p*sqrt(1/n_1 + 1/n_2))
# t0 = 2.2120

## 5. Konklusion
# Da teststørrelsen t0 er større end den kritiske grænse t_alfahalve, 
# forkastes H0. Der er forskel på de to populationers middelværdi på 
# 5 % signifikansniveau.

# P-værdi: Husk vi skal have arealet af begge haler, pga. tosidet test
p_vaerdi = 2*(1 - pt(t0, n_1 + n_2 - 2))

# Antagelser
# Vi har antaget, at de to populationer er normalfordelte med samme 
# varians. 
qqnorm(type_A)
qqnorm(type_B)
# Normalfordelingsplottene for de to stikprøver er ikke alarmerende. 
# Desuden er s_1 og s_2 ikke langt fra hinanden (2.1 og 2.6). 
# I følge bogen er testen ikke særligt følsom for dette og kan 
# acceptere op til 4 gange størrelsesforskel

# Alternativ løsning til tjek:
res = t.test(type_A,                 # Den første stikprøve
             type_B,                 # Den anden stikprøve
             var.equal = TRUE,       # Brug puljet std (s_p)
             mu = 0,                 # Formodet forskel på pop.middelv.                 
             conf.level = 95         # Ønsket konfidensinterval
             )        
print(res)
