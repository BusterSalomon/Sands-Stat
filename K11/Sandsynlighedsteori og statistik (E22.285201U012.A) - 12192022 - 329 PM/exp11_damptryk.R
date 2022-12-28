

## Eksempel om temperatur og damptryk (ikke fra bogen)
D = read.delim("Kap11/C11Ex_alj_damptryk.TXT", header=TRUE)
t = D$temp
p = D$damptryk

# Scatter plot af data
plot(t,p)

# Selv om sammenhængen ikke ser lineær ud prøver vi lineær regression
linmod = lm(p~t)
summary(linmod)
# Det er en god model. Den forklarer over 90% af variationen og begge
# hældningskoefficienter er signifikant med p-værdi på 0.00359. 
# Koefficienten for skæring er ikke signifikant forskellig fra 0

# Pænere plot med regressionslinje
plot(t, p, type="p",
     main = "Sammenhæng mellem temperatur og damptryk",
     xlab = "Temperatur (C)",
     ylab = "Damptryk (mmHG)",
     xlim = c(0,70),
     ylim = c(0,160),
     col = "blue")
abline(reg=linmod, col="red")

# Sammenhængen i data ser dog mere kurveformet end lineær ud
# Som følge af Clausius-Clapeyron ligningen er logaritmen til damptrykket 
# omvendt proportional med temperaturen i Kelvin:
# log(y) = b0 + b1*1/(273+x)
# Vi transformerer data, så der er lineær sammenhæng:
T = t + 273      # Transformation af temperatur fra Celsius til Kelvin
RT = 1/T         # Den reciprokke til temperaturen i Kelvin
lnp = log(p)     # Den naturlige logaritme til damptrykket
# Nu bør der gælde: lnp = b0 + b1*RT

linmod2 = lm(lnp ~ RT)
summary(linmod2)
# Det er en perfekt model, der forklarer al variationen (R-squared=1)
 
# Plot med regressionslinje for log(y) som funktion af x
plot(RT, lnp, type="p",
     main = "Sammenhæng mellem temperatur og damptryk",
     xlab = "Reciprok kelvintemperatur",
     ylab = "log(damptryk)",
     ylim = c(2.0,5.5),
     col = "blue")
abline(reg=linmod2, col="red")

# Jeg vil gerne plotte y mod x, så jeg transformerer tilbage
b0 = 20.79
b1 = -5255
# lnp = 20.79 - 5255*RT  =>
# p = exp(20.79-5255/(273+t)) 

# For at tegne kurven mellem t og p laver jeg en sekvens af sammenhørende
# Værdier
ny_t = seq(0, 70, 0.1)            
ny_p = exp(20.79-5255/(273+ny_t))

# Først plottes målepunkterne:
plot(t, p, type="p",
     main = "Sammenhæng mellem temperatur og damptryk",
     xlab = "Temperatur (C)",
     ylab = "Damptryk (mmHG)",
     xlim = c(0,70),
     ylim = c(0,160),
     col = "blue")
# Dernæst tegnes kurven: 
lines(ny_t, ny_p, col="red", lty=1)
