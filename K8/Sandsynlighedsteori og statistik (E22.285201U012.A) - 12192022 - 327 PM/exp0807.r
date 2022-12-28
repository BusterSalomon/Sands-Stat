

## Eksempel 8.7, hypotesetest med 2 små stikprøver med ukendt sigma
# Elasticitet af genanvendt beton til vejbelægning fra to lokaliteter

# Oplysninger fra opgaven:
delta0 = 0
n1 = 6
n2 = 6
alfa = 0.05

#Indlæser data:
d = read.table("Kap08/C8Ex7.TXT", header=TRUE)
location = d$location    
resilmod = d$resiliencyMod

x = resilmod[1:6]
y = resilmod[7:12]

# Beregninger af data:
x_streg = mean(x)
s1 = sd(x)
y_streg = mean(y)
s2 = sd(y)

# 1. Hypoteser
# H0: mu1 - mu2 = delta0 = 0
# H1: mu1 - mu2 <> 0 (<> betyder her 'forskellig fra')

# 2. Signifikansniveau
# Alfa er 0.05

# 3. Kriterier
# Teststørrelsen 
# t0 = (x_streg - y_streg - delta0)/(sp*sqrt(1/n1 + 1/n2))
# hvor sp er den puljede standardafvigelse:
# sp = ((n1-1)*s1^2 + (n2-1)*s2^2)/(n1+n2-2)
# t0 er t-fordelt med n1+n2-2 frihedsgrader
df = n1+n2-2

# Vi forkaster H0, hvis t0 > t_alfahalve eller t0 < -t_alfahalve, 
# hvor 
t_alfahalve = qt(1-alfa/2, df)
# t_alfahalve = 2.228

# 4. Beregn teststørrelsen
sp = sqrt(((n1-1)*s1^2 + (n2-1)*s2^2)/(n1+n2-2))
t0 = (x_streg - y_streg - delta0)/(sp*sqrt(1/n1 + 1/n2))
# sp = 50.09
# t0 = 2.651

# 5. Beslutning
# Vi forkaster H0, da t0 > t_alfahalve (2.651 > 2.228)
# Der er forskel på elasticiteten af materialet fra de to 
# lokaliteter på signifikansniveau 5 %
#
# Grafisk test af om fordelingerne er pæne med nomalfordelingsplots
qqnorm(x, main='Lokalitet 1')
qqline(x)
qqnorm(y, main='Lokalitet 2')
qqline(y)
hist(x)
hist(y)
boxplot(x,y)
# x og y kommer fra fordelinger, der ligner normalfordelingen. 
# Samtidig er der ikke stor forskel på s1 og s2, så vi kan gå ud
# fra, at antagelserne holder



# P-værdi:
p = 2*(1 - pt(t0, df))
# P-værdien er 0.0243. 
# Hvis H0 var sand, ville vi kun få sådan en stikprøve eller 
# en mere ekstrem i 2.4 % af tilfældene

# Konfidensinterval for mu1 - mu2:
B = t_alfahalve*sp*sqrt(1/n1 + 1/n2)
KI_nedre = x_streg - y_streg - B
KI_oevre = x_streg - y_streg + B
# 95 % Konfidensinterval: [12; 141]
# Vi bemærker, at 0 ikke er i intervallet, så der er forskel


# Forsøg med funktionen t.test:
res = t.test(x, y,                 # data; de to stikprøver
       alternative="two.sided",    # Vi har <> i H1 (dflt)
       mu=0,                       # Værdien af delta0
       conf.level = 0.95,          # 1 - alfa
       var.equal=TRUE,             # sørger for at sp bruges
       )
print(res)
