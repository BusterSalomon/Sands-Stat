## Opgave 6.23 s. 210 om tykkelsen af oliefilm 
# Engine bearings depend on a film of oil to keep shaft
# and bearing surfaces separated. Samples are regularly
# taken from production lines and each bearing in a sample is tested to measure the thickness of the oil film.
# After many samples, it is concluded that the population is normal. The variance is σ^2 = 0.012 when the
# process is in control. A sample of size 25 is collected
# each week. The process will be declared out of control if the sample variance exceeds 0.020. What is the
# probability that it will be declared out of control even
# though σ^2 = 0.012?

sigma2 = 0.012
n = 25

s2 = 0.02
chi2_0 = (n-1)*s2/sigma2

# P(X > chi2_0) = 1 - pchisq(chi2_0, n-1)
p_0 = 1 - pchisq(chi2_0, n-1)
# p_0 = 0.0214

# Konklusion
# Hvis det er sandt, at sigma2 = 0.012, s� vil vi tilf�ldigvis f� en
# stikpr�ve med s2 = 0.02 eller derover med sandsynligheden 0.0214. 
# Det er alts� usandsynligt, at det sker tilf�ldigt, s� vi kan g� ud 
# fra, at der sandsynligvis er noget galt med produktionen. 

# NB. Facitlisten siger p_0 = 0.01 ?!