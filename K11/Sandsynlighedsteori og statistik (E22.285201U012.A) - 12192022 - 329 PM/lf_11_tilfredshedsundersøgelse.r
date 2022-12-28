
## Opgave kap. 11 om en tilfredshedsundersøgelse på et hospital

D = read.table("Kap11/data_tilfredshedsundersoegelse.csv", header=TRUE, sep=";")
y = D$Tilfredshed
A = D$Alder
S = D$Sygdom
B = D$Bekymring

n = length(y)


## a: Scatter plots
plot(A, y, type="p",
     main = "Sammenhæng ml. alder og tilfredshed",
     xlab = "Alder",
     ylab = "Tilfredshed",
     col = "blue")

plot(S, y, type="p",
     main = "Sammenhæng ml. sygdom og tilfredshed",
     xlab = "Sygdom",
     ylab = "Tilfredshed",
     col = "blue")

plot(B, y, type="p",
     main = "Sammenhæng ml. bekymring og tilfredshed",
     xlab = "Bekymring",
     ylab = "Tilfredshed",
     col = "blue")


## b: Multipel lineær regressionsmodel
linmod = lm(y ~ A + S + B)
summary(linmod)
# y_hat = 144.5826 - 1.1267*A - 0.5873*S + 1.3448*B


## c: Forudsigelse af tilfredshed for en patient
A_0 = 60
S_0 = 45
B_0 = 3.0
y_0 = 144.5826 - 1.1267*A_0 - 0.5873*S_0 + 1.3448*B_0
# Forventet tilfredshed: y_0 = 54.6


## d: Hvor godt forklarer modellen observationerne?
# Modellen har R2 = 0.9014 og Adjusted R2 = 0.8873. Det vil sige, at 
# modellen beskriver variationen i data godt. F-værdien på 64 og den 
# tilhørende p-værdi på 9.822e-11 siger, at det er ekstremt 
# usandsynligt, at alle tre regressorvariable er uden effekt 
# (altså at koefficienterne svarende til A, S og B i virkeligheden 
# alle er 0). 
# P-værdierne på estimaterne for koefficienterne er da også alle tæt 
# på 0, bortset fra for B (Bekymring). Her er p-værdien 0.2213, så 
# denne koefficient er ikke signifikant forskellig fra 0.


## e: Reduceret model
# Da koefficienten for regressoren Bekymring ikke er signifikant 
# forskellig fra 0, vil jeg teste den reducerede model, hvor kun de 
# signifikante regressorer indgår. En multipel regressionsanalyse med 
# kun Alder og Sygdom giver følgende resultat:
linmod2 = lm(y ~ A + S)
summary(linmod2)

# R2 og Adjusted R2 er reduceret marginalt til hhv. 0.894 og 0.8843, 
# så modellen beskriver variationen i data næsten lige så godt, men 
# til gengæld er modellen simplere med kun to variable, som begge har 
# signifikante koefficienter. Derfor vil jeg foretrække denne 
# reducerede model.


## f: Estimat, residual, konfidensinterval og prædiktionsinterval
y_hat = linmod$fitted.values
e = linmod$residuals

KI = predict(linmod, level=.95, interval='confidence')
KI_lav = KI[,2]
KI_hoj = KI[,3]

PI = predict(linmod, level=.95, interval='prediction')
PI_lav = PI[,2]
PI_hoj = PI[,3]

resultat = cbind(y_hat, e, KI_lav, KI_hoj, PI_lav, PI_hoj)
print(resultat)


## g: Modelantagelser
# Vi har antaget, at residualerne er normalfordelte med samme varians
# Derfor skal residualerne være tilfældige i residualplots, og ikke
# afhænge af regressorvariablene, eller af rækkefølgen på 
# observationerne

e = linmod$residuals
y_hat = linmod$fitted.values

## Residualplots
plot(y_hat, e, xlab="y_hat", ylab="e", main="Residualplot for estimeret tilfredshed")
abline(h=0)
# Residualerne ser ud til at fordele sig tilfældigt

plot(A, e, xlab="A", ylab="e", main="Residualplot for Alder")
abline(h=0)
# Residualerne ser ud til at fordele sig tilfældigt

plot(S, e, xlab="S", ylab="e", main="Residualplot for Sygdom")
abline(h=0)
# Residualerne ser ud til at fordele sig tilfældigt

plot(B, e, xlab="B", ylab="e", main="Residualplot for Bekymring")
abline(h=0)
# Residualerne ser ud til at fordele sig tilfældigt, måske med tendens
# til faldende residualer med stigende Bekymring

indx = c(1:n)
plot(indx, e, xlab="Patient nr", ylab="e", main="Residualplot for rækkefølge")
abline(h=0)
# Residualerne ser ud til at fordele sig tilfældigt

qqnorm(e)
qqline(e)
# Residualerne ser ud til at være normalfordelte

