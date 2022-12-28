## Opgave 6.25 s. 210 om varians af to normalfordelte stikpr�ver 

# If independent random samples of size n1 = n2 = 8
# come from normal populations having the same variance,
# what is the probability that either sample variance will be at least 7 times as large as the other?

n1 = n2 =  8

# Vi ser p� situationen at den ene stikpr�ves varians er 7 gange den 
# andens selv om de kommer fra samme normalfordeling 

F_0 = 7 

# F_0 er F-fordelt med 7 frihedsgrader i b�de t�ller og n�vner, s� 
# P_0 = P(F0 > 7)= 1 - P(F0 < 7) = 1 - pf(7, 7, 7)
P_0 = 1 - pf(F_0, n1-1, n2-1)  # P_0 = 0.010

# Det sker tilf�ldigt i 1 % af tilf�ldene, at to stikpr�ver p� 8 
# observationer f�r et forhold mellem stikpr�vevarianser p� 7 eller 
# derover

# N.B. Facitlisten siger p_0 = 0.02. 
# Jeg tror facit for 6.23 og 6.25 er forbyttet