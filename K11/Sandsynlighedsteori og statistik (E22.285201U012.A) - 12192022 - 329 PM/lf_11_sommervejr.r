

## Opgave kap. 11 om forudsigelse af sommervejr

D = read.table("Kap11/data_sommervejr.csv", header=TRUE, sep=";")
aar = D$Aar
x = D$Temp_forsommer
y = D$Temp_hoejsommer
n = length(aar)

# a. Regressionsmodel
linmod = lm(y~x)
summary(linmod)
# Regressionsligningen:
# y = 7.29627 + 0.63605*x

## b
# Begge koefficienter har en meget lille p-værdi tæt på 0. Der er
# utvivlsomt en sammenhæng mellem middeltemperaturen i forsommeren 
# og højsommeren. Anova testens F-værdi og den tilhørende p-værdi 
# siger det samme. Dog er både R2 og Adjusted R2 temmelig lave, kun
# omkring 0.4. Modellen forudsiger kun 40 % af variationen i data. 
# Det fortæller os, at der er meget usikkerhed i modellen. 
# Trods en signifikant sammenhæng mellem regressor og respons kan 
# modellen ikke forudsige det kommende vejr særligt præcist.

## c. Sommertemperatur for 2020, hvor forsommeren var 11.25 grader.
# Vi sætter ind i ligningen: 
x_2020 = 11.25
y_2020 = 7.29627 + 0.63605*x_2020
# y_2020 = 14.45

## d. Figur
# Estimerede værdier af sommertemperatuar:
plot(x, y, type="p",
     main = "Årlig middeltemperatur",
     xlab = "Forsommer (C)",
     ylab = "Højsommer (C)",
     col = "blue")
# Tegner regressionslinjen
abline(reg=linmod, col="red")


## e. Residualanalyse
e = linmod$residuals
y_hat = linmod$fitted.values

plot(y_hat, e, xlab="y_hat", ylab="e", main="Residualplot for y_hat")
abline(h=0)
# Residualerne lader til at være nogenlunde uafhængige af y_hat, dog er 
# der måske en tendens til større residualer i midterområdet. 

plot(x, e, xlab="x", ylab="e", main="Residualplot for x")
abline(h=0)
# Der lader til at være en tendens til højere residualer for tempera-
# turer i midterområdet

plot(aar, e, xlab="År", ylab="e", main="Residualplot for år")
abline(h=0)
# Residualerne ser ud til at være ensartede over tid

qqnorm(e)
# Residualerne lader til at være normalfordelte.

