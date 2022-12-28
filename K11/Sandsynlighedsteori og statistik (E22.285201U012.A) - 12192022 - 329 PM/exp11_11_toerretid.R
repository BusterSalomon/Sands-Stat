

## Eksempel 11.11 om sammenhæng mellem en laks tørretid og mængde tilsat additiv
D = read.delim("Kap11/C11Ex11.TXT", header=TRUE)
x = D$amount
y = D$time

## a: Scatter plot af data
plot(x,y)

# Lineær regression giver en dårlig model
linmod1 = lm(y ~ x)
summary(linmod1)
# Det giver en dårlig model med R^2=0.43 og p-værdi for b1 på 0.06

## b: Polynomiel regression
# Nu fitter vi et andengradspolynomium til data: 
x2 = x^2      # Vi beregner kvadratet for hver målt x-værdi
linmod2 = lm(y ~ x + x2)
summary(linmod2)
# Nu får vi en god model med R^2=0.92 og signifikante koefficienter
b0 = 12.18
b1 = -1.85
b2 = 0.18
# Model: y = 12.185 - 1.847*x + 0.183*x^2

# NB: Vi kan også gøre det sådan, uden at beregne x2:
linmod2b = lm(y ~ x + I(x^2))
summary(linmod2b)


## c: Estimer tørretid for tilsat 6.5 g additiv:
x_0 = 6.5
y_0 = 12.185 - 1.847*x_0 + 0.183*x_0^2
# y_0 = 7.91 timer


# Minimum tørretid:
# y' = 2*0.183x - 1.847 = 0 => x = 1.847/(2*0.183) = 5.05
x_min = 1.847/(2*0.183)
y_min = 12.185 - 1.847*x_min + 0.183*x_min^2
# Minimum tørretid er 7.5 timer for 5.05 g additiv



## Ekstra

# Pænere plot med regressionskurven vist
# Først plottes målepunkterne:
plot(x, y, type="p",
     main = "Sammenhæng mellem tørretid af lak og tilsat additiv",
     xlab = "Tilsat additiv (g)",
     ylab = "Tørretid (timer)",
     xlim = c(0,8),
     ylim = c(0,13),
     col = "blue")
# Så lægges kurven for andengradspolynomiet ovenpå
# Det er en stykvis lineær kurve for mange punkter mellem yderpunkterne:
x_ny = seq(0, 8, 0.1)
y_ny = 12.185 - 1.847*x_ny + 0.183*x_ny^2
lines(x_ny, y_ny, col="red", lty=1)

#####################################################


# Hvordan laves polynomier?
linmod1a = lm(y ~ x)
summary(linmod1a)
linmod2a = lm(y ~ x + x^2)
summary(linmod2a)             # Samme resultat som linmod1a
linmod2b = lm(y ~ x + I(x^2))
summary(linmod2b)             # Korrekt 2-gradspol.
x2 = x^2 
linmod2c = lm(y ~ x + x2)
summary(linmod2c)             # Korrekt, som linmod2b

## 3-gradspolynomium:
linmod3 = lm(y~x + I(x^2) + I(x^3))
summary(linmod3)


## Korrelationskoefficient
r = cor(x,y)   # r = -0.6523. Negativ korrelation ml. x og y
R2 = r^2       # R2 = 0.4255
# R2 svarer til 'Multiple R-Squared' i output fra lm(y~x)
summary(lm(y~x))   # Multiple R-squared aflæses til 0.4255
