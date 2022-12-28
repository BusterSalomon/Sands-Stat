

## Eksempel 13.3. 

D = read.delim("Kap13/C13Ex3.TXT", header=TRUE)
A = as.factor(D$A)          # Faktor A
B = as.factor(D$B)          # Faktor B
C = as.factor(D$C)          # Faktor C
y = D$delay                 # responsen forsinkelse (ms)
# NB Da data for A, B og C er heltal 1,2,3,... er vi nødt til at caste dem som 
# faktorer med as.factor()


fm1 = aov(y ~ A + B + C + A:B + B:C + A:B:C); 
# Det kan skrives enklere:
# fm1 = aov(y ~ A + B + C + A*B*C); 
summary(fm1)

#Man kan skridtvis fjerne det mindst signifikante led, her A:C:
fm1_test = aov(y ~ A + B + C + A:B + B:C + A:B:C); 
summary(fm1_test)
# Hvis man fortsætter ender man med y ~ A + C

# B har ikke signifikant effekt, heller ikke i interaktioner:
fm2 = aov(y ~ A + C + A:C); 
summary(fm2)

# Både A og B er har signifikant effekt, men der er ingen interaktion
fm3 = aov(y ~ A + C); 
summary(fm3)

tapply(y, list(A), mean)  # Find middelværdi (mean) over y for hver værdi af A
tapply(y, list(C), mean)  # Find middelværdi (mean) over y for hver værdi af C

TukeyHSD(fm1, "A", conf.level=0.99)
TukeyHSD(fm1, "B", conf.level=0.99)
TukeyHSD(fm1, "C", conf.level=0.99)

## Test af antagelse om varianshomogenitet
bartlett.test(y,A)
bartlett.test(y,B)
bartlett.test(y,C)
combo = as.factor(100*D[,1] + 10*D[,2] + D[,3])
bartlett.test(y,combo)

y_hat = predict(fm3)
opti = min(y_hat)
resid = y - y_hat
qqnorm(resid)
qqline(resid)

plot(y_hat, resid, xlab="y_hat", ylab="Residual")
abline(h=0)

plot(as.numeric(A), resid, xlab="A", ylab="Residual")
abline(h=0)

plot(as.numeric(B), resid, xlab="B", ylab="Residual")
abline(h=0)

plot(as.numeric(C), resid, xlab="C", ylab="Residual")
abline(h=0)
