

## Eksempel 7.1-7.2 om genbrugt beton til vejbelægning

alfa = 0.05
n = 18
x_streg = 168.2
s = 18.1

# Estimeret standardfejl
se = s/sqrt(n)             # se = 4.266


# Maksimal fejl på estimatet med 95 % sandsynlighed
t_alfahalve = qt(1-alfa/2, n-1)
E = t_alfahalve*s*sqrt(1/n)     # E = 9.001


# Konfidensinterval
K_lo = x_streg - E
K_hi = x_streg + E
# KI = [159.2; 177.2]


# Prædiktionsinterval
P = t_alfahalve*s*sqrt(1+1/n)
P_lo = x_streg - P
P_hi = x_streg + P
# PI = [129.0; 207.4]

