

## Opg. 5.21, s. 149
mu = 128
sigma = 16

# a. Sands. for at en vibrator ikke lever op til kravet om mindst 100 PdM
# p_fejl = P(X < 100)
x0 = 100
p_fejl = pnorm(x0, mu, sigma)
# p_fejl = 0.0401

# b. Hvilken andel vil fejle?
# 4 % if�lge a.

# c. Hvilken middelv�rdi skal vibratoren �ndres til, s� 5% fejler?
# Ny stokastisk variabel X2 med ny ukendt mu2 og samme sigma=16
# Vi kan standardisere: Z = (X-mu2)/sigma 
# Vi kan finde z0, s� P(Z < z0) = 0.05
alfa = 0.05
z0 = qnorm(alfa)
# z0 = -1.6449

# Nu kan vi transformere tilbage fra Z til X2:
# z0 = (x0 - mu2)/sigma => x0 - mu2 = z0 * sigma => mu2 = x0 - z0 * sigma
mu2 = x0 - z0 * sigma

# mu2 = 126.3
# M.a.o. hvis middelv�rdien er 126.3, vil 5 % ikke kunne leve op til kravet
# om at v�re over 100 PdM