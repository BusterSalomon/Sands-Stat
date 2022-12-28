

## Eksempel 11.12 Antal knæk, en stang kan klare, inden den brækker, 
## afhænger af hvor meget, der er tilsat af to stoffer A og B

D = read.delim("Kap11/C11Ex12.TXT", header=TRUE)
y = D$NoTwists
x1 = D$percentA
x2 = D$percentB


## Scatter plots af data
plot(x1,y, xlab="Pct A", ylab="Antal knæk")
# Positiv korrelation mellem x1 og y
plot(x2,y, xlab="Pct B", ylab="Antal knæk")
# Negativ korrelation mellem x2 og y

# multipel regression 
linmod = lm(y ~ x1 + x2)
summary(linmod)

# ANOVA
anova(linmod) # Dette giver ikke den forventede ANOVA tabel
# Jeg har ikke fundet en R-funktion, der kan

# Alternativ ANOVA beregning af F og tilhørende p-værdi:
constmod = lm(y ~ 1)   # Her laves den konstante model uden hældning: y = b_0
summary(constmod)      # Resultatet af den konstante model
anova(constmod,linmod) # F beregnes ved sammenligningen af de to modeller


# Residualanalyse
y_hat = linmod$fitted.values  # Prædikterede værdier af modellen: y_hat
e = linmod$residuals   
# Residualer 

plot(y_hat, e, xlab="y_hat", ylab="e", main="Eksempel 11.12: Residualplot for y_hat")
abline(h=0)

plot(x1, e, xlab="x1", ylab="e", main="Eksempel 11.12: Residualplot for x1")
abline(h=0)

plot(x2, e, xlab="x2", ylab="e", main="Eksempel 11.12: Residualplot for x2")
abline(h=0)

indx = c(1:16)
plot(indx, e, xlab="Måling nr", ylab="e", main="Eksempel 11.12: Residualplot for rækkefølge")
abline(h=0)

qqnorm(e)
qqline(e)
