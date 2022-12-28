

## Opg. M&R 7.11

alfa = 0.01
sigma = 1.4 
E = 0.25

z_alfahalve = qnorm(1-alfa/2)
n = (z_alfahalve*sigma/E)^2
# n = 208.07. Det skal rundes op til 209 for at sikre os, at fejlen E
# er *højst* 0.25. 
# Facitlisten runder fejlagtigt ned til n = 208.