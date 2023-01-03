

## Eksempel 8.12, hypotesetest med m�linger af sikkerhed p� 10 fabrikker
# f�r og efter indf�relsen af et sikkerhedsprogram. Sikkerheden er 
# m�lt som antal mistede arbejdstimer pr uge pga. ulykker

# Opgaven skal l�ses som en parret t-test, da x_i og y_i er sikkerhed 
# f�r og efter for den i-te fabrik. Data er parvist afh�ngige. 
# Men bagefter vil jeg regne den som var det to uafh�ngige stikpr�ver.
# Her viser det sig, at der ikke er signifikant forskel, fordi vi
# ignorerer, at observationerne er parvist afh�ngige.

#Indl�ser data:
M = read.delim("Kap08/C8Ex12.TXT", header=TRUE)
x = M$Before   
y = M$After

delta0 = 0
n = 10
alfa = 0.05

#########################################
# PARRET T-TEST

d = x-y
d_streg = mean(d)
s_d = sd(d)

# 1. Hypoteser
# H0: delta = delta0 = 0
# H1: delta <> 0 (<> betyder her 'forskellig fra')

# 2. Signifikansniveau
# Alfa er 0.05

# 3. Kriterier
# Testst�rrelsen 
# t0 = (d_streg - delta0)/(s_d/sqrt(n))
# t0 er t-fordelt med n-1 frihedsgrader

# Vi forkaster H0, hvis t0 > t_alfa, 
# hvor 
t_alfa = qt(1-alfa, n-1)
# t_alfa = 1.833

# 4. Beregn testst�rrelsen
t0 = (d_streg - delta0)/(s_d/sqrt(n))
# t0 = 4.033

# 5. Beslutning
# Vi forkaster H0, da t0 > t_alfa (4.033 > 1.833)
# Der er forskel p� sikkerheden f�r og efter indf�relsen af 
# sikkerhedspakken p� signifikansniveau 5 %
p_vaerdi = 1 - pt(t0, n-1)
# p_vaerdi = 0.00148


#########################################
# To uafh�ngige stikpr�ver

# Oplysninger fra opgaven:
n1 = n
n2 = n

# Beregninger af data:
x_streg = mean(x)
s1 = sd(x)
y_streg = mean(y)
s2 = sd(y)

# 1. Hypoteser
# H0: mu1 - mu2 = delta0 = 0
# H1: mu1 - mu2 > 0 (flere mistede timer f�r)

# 2. Signifikansniveau
# Alfa er 0.05

# 3. Kriterier
# Testst�rrelsen 
# t0 = (x_streg - y_streg - delta0)/(sp*sqrt(1/n1 + 1/n2))
# hvor sp er den puljede standardafvigelse:
# sp = ((n1-1)*s1^2 + (n2-1)*s2^2)/(n1+n2-2)
# t0 er t-fordelt med n1+n2-2 frihedsgrader
df = n1+n2-2

# Vi forkaster H0, hvis t0 > t_alfa, hvor 
t_alfa = qt(1-alfa, df)
# t_alfa = 1.734

# 4. Beregn testst�rrelsen
sp = sqrt(((n1-1)*s1^2 + (n2-1)*s2^2)/(n1+n2-2))
t0 = (x_streg - y_streg - delta0)/(sp*sqrt(1/n1 + 1/n2))
# sp = 31.55
# t0 = 0.369

# 5. Beslutning
# Vi kan ikke forkaste H0, da t0 < t_alfa (0.369 < 1.734)
# Der er er ikke signifikant forskel p� antal mistede arbejdstimer 
# som f�lge af ulykker f�r og efter sikkerhedspakken p� signifikans-
# niveau 5 %
#
p_vaerdi = qt(1-t0, df)
# p_vaerdi = 0.34

# p-v�rdi
boxplot(x,y,
        horizontal=TRUE,
        names= c("F�r","Efter"), 
        main="Tabte arbejdstimer pr. uge pga. ulykker"
        )