

## L�sningsfoslag til opgave 08.11 om hydrauliske pumper

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
# Vi har to uafh�ngige stikpr�ver med lav stikpr�vest�rrelse, s� 
# Stikpr�vest�rrelsen:
# t0 = (x_streg - y_streg - delta_0)/s_p*sqrt(1/n_1 + 1/n_2)
# hvor s_p er den puljede standardafvigelse
# t_0 er t-fordelt med n_1 + n_2 - 2 frihedsgrader

# Vi har en tosidet test, s� den kritiske gr�nse er
t_alfahalve = qt(1-alfa/2, n_1+n_2-2)
# t_alfahalve = 2.1199

## 4. Beregning
# F�rst beregnes den puljede standardafvigelse, s_p:
s_p = sqrt(((n_1 - 1)*s_1^2 + (n_2 - 1)*s_2^2)/(n_1 + n_2 - 2))

t0 = (x_streg - y_streg - delta_0)/(s_p*sqrt(1/n_1 + 1/n_2))
# t0 = 2.2120

## 5. Konklusion
# Da testst�rrelsen t0 er st�rre end den kritiske gr�nse t_alfahalve, 
# forkastes H0. Der er forskel p� de to populationers middelv�rdi p� 
# 5 % signifikansniveau.

# P-v�rdi: Husk vi skal have arealet af begge haler, pga. tosidet test
p_vaerdi = 2*(1 - pt(t0, n_1 + n_2 - 2))

# Antagelser
# Vi har antaget, at de to populationer er normalfordelte med samme 
# varians. 
qqnorm(type_A)
qqnorm(type_B)
# Normalfordelingsplottene for de to stikpr�ver er ikke alarmerende. 
# Desuden er s_1 og s_2 ikke langt fra hinanden (2.1 og 2.6). 
# I f�lge bogen er testen ikke s�rligt f�lsom for dette og kan 
# acceptere op til 4 gange st�rrelsesforskel

# Alternativ l�sning til tjek:
res = t.test(type_A,                 # Den f�rste stikpr�ve
             type_B,                 # Den anden stikpr�ve
             var.equal = TRUE,       # Brug puljet std (s_p)
             mu = 0,                 # Formodet forskel p� pop.middelv.                 
             conf.level = 95         # �nsket konfidensinterval
             )        
print(res)
