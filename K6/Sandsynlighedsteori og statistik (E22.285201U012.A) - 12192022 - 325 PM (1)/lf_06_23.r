## Opgave 6.23 s. 210 om tykkelsen af oliefilm 

sigma2 = 0.012
n = 25

s2 = 0.02
chi2_0 = (n-1)*s2/sigma2

# P(X > chi2_0) = 1 - pchisq(chi2_0, n-1)
p_0 = 1 - pchisq(chi2_0, n-1)
# p_0 = 0.0214

# Konklusion
# Hvis det er sandt, at sigma2 = 0.012, så vil vi tilfældigvis få en
# stikprøve med s2 = 0.02 eller derover med sandsynligheden 0.0214. 
# Det er altså usandsynligt, at det sker tilfældigt, så vi kan gå ud 
# fra, at der sandsynligvis er noget galt med produktionen. 

# NB. Facitlisten siger p_0 = 0.01 ?!