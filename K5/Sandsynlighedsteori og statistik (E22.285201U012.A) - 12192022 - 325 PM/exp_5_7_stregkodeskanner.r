

## Eksempel 5.7 om stregkodeskanners dæmpning
mu = 10.1
sigma = 2.7

# a. mellem 8.5 og 13.0
# Jeg transformerer grænserne fra generel til standard normal:
z_0 = (8.5 - mu)/sigma
z_1 = (13.0 - mu)/sigma
p_a = pnorm(z_1) - pnorm(z_0)

# b
# Det følger af a: 58.18%

# c. Over 15.1
p_c = 1 - pnorm((15.1-mu)/sigma)

# ALTERNATIV udenom standardisering:
p_A = pnorm(13.0, mu, sigma) - pnorm(8.5, mu, sigma)

p_C = 1 - pnorm(15.1, mu, sigma)
