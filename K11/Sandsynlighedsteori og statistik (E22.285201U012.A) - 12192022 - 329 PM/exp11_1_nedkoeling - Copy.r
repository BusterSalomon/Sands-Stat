
## Eksempel 11.1 om at nedkølingshastigheden (F/time) af en legering
## afhænger af hvor meget der er tilsat af en bestemt komponent

D = read.table("Kap11/C11coolingr.TXT", header=TRUE)
x = D$x
y = D$y

# Indledningsvis laves et simpelt scatterplot af y mod x
plot(x, y, type="p")

# Regressionsanalyse
linmod = lm(y ~ x)      # Lineær regression med y som respons og x som regressor
summary(linmod)         # Resultatet af analysen

# Plot af resultatet
plot(x, y, type="p",
     main = "Nedkølingsratens afhængighed af tilsat komponent",
     xlab = "Tilsat komponent (%)",
     ylab = "Nedkølingshastighed (F/time)",
     ylim = c(0,70),
     col = "blue")

abline(reg=linmod, col="red")

###########################################################

# Konfidensinterval for koefficienterne (formler s. 338)
KI = confint(linmod, level=0.99)
print(KI) 

# manuel test af 99% konfinterval for beta1:
b1 = 6       # (aflæst fra summary)
s_e = 6.7082 # (fra summarys 'residual standard error')
alfa = 0.01
n = 8
t_alfahalve = qt(1-alfa/2, n-2)
S_xx = 30    # (regnet manuelt)
B = s_e*t_alfahalve/sqrt(S_xx)
KI_lav = b1 - B
KI_hoej = b1 + B
# Jubii - samme resultat som confint()

###########################################################

# Anova
linmod = lm(y ~ x)
anova(linmod)

###########################################################

# 95% Konfidensinterval for y:
lvl = .95
predict(linmod, level=lvl, interval='confidence')

# 95% Prædiktionsinterval for y:
predict(linmod, level=lvl, interval='prediction')

# Plot af resultatet med konf. og præd. intervaller
ny_x = seq(min(x), max(x), 0.05)
ki = predict(linmod, 
             newdata=data.frame(x=ny_x), 
             interval="confidence",
             level = lvl)
pi = predict(linmod, 
             newdata=data.frame(x=ny_x), 
             interval="prediction",
             level = lvl)

plot(x, y, type="p",
     main = "Nedkølingsratens afhængighed af tilsat komponent",
     xlab = "Tilsat komponent (%)",
     ylab = "Nedkølingshastighed (F/time)",
     ylim = c(0,80),
     col = "blue")
abline(reg=linmod, col="red")

# Tegner konfidensinterval i plottet over data og regressionslinje
lines(ny_x, ki[,2], col="green", lty=3) # lty=3 giver prikket linje
lines(ny_x, ki[,3], col="green", lty=3)

# Tegner prædiktionsinterval 
lines(ny_x, pi[,2], col="brown", lty=2) # lty=2 giver stiplet linje
lines(ny_x, pi[,3], col="brown", lty=2)

# Tegner legende
legend("topleft", 
       legend=c("Regressionslinje","Konfidensinterval","Prædiktionsinterval"),
       col=c("red", "green", "brown"), lty=c(1,3,2))

###########################################################

## Residualanalyse
e = linmod$residuals
y_hat = linmod$fitted.values
res = cbind(x, y, y_hat, e)
print(res)

## Residualplots
plot(y_hat, e, xlab="y_hat", ylab="e", main="Eksempel 11.1: Residualplot for y_hat")
abline(h=0)

plot(x, e, xlab="x", ylab="e", main="Eksempel 11.1: Residualplot for x")
abline(h=0)

indx = c(1:length(x))
plot(indx, e, xlab="Måling nr", ylab="e", main="Eksempel 11.1: Residualplot for rækkefølge")
abline(h=0)

qqnorm(e)
qqline(e)

###########################################################

## Korrelationskoefficient
r = cor(x,y) 
r2 = r^2
# r2 = 0.8, dvs. som determinationskoefficienten R-squared

###########################################################

# Tester for sjov: 
linmod2 = lm(x ~ y)      # Lineær regression med y som respons og x som regressor
summary(linmod2)         # Resultatet af analysen
anova(linmod2)
