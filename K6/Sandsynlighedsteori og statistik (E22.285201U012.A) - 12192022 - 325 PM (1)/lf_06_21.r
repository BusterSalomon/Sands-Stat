## Opgave 6.21 s. 210 om postens leverencetid

# Posten lover, at pakker leveres p� 30 timer i gennesmnit:
mu = 30

# Her er leverencetiderne for 8 pakker:
x = c(28, 32, 20, 26, 42, 40, 28, 30)
n = length(x)
x_streg = mean(x)    # x_streg = 30.75
s = sd(x)

# Vi antager den centrale gr�nsev�rdis�tning:
t0 = (x_streg-mu)/(s/sqrt(n))

# t0 er t-fordelt med n-1 frihedsgrader
# P(t>t0) = 1 - P(t<t0) = 1 - pt(t0, n-1)
p_0 = 1 - pt(t0, n-1)   # p_0 = 0.389

# Konklusion. 
# Hvis posten har ret og mu = 30, s� er sandsynligheden for at f� en
# stikpr�ve p� 8 observationer med x_streg > 30.75 lig med 0.389. 
# Med andre ord vil knap 39 % af stikpr�ver ligne denne eller v�re 
# mere ekstrem. Vi kan ikke afvise postens p�stand med denne stikpr�ve