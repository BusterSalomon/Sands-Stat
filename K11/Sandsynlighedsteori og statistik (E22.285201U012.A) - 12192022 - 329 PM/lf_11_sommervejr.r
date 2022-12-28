

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
# Begge koefficienter har en meget lille p-v�rdi t�t p� 0. Der er
# utvivlsomt en sammenh�ng mellem middeltemperaturen i forsommeren 
# og h�jsommeren. Anova testens F-v�rdi og den tilh�rende p-v�rdi 
# siger det samme. Dog er b�de R2 og Adjusted R2 temmelig lave, kun
# omkring 0.4. Modellen forudsiger kun 40 % af variationen i data. 
# Det fort�ller os, at der er meget usikkerhed i modellen. 
# Trods en signifikant sammenh�ng mellem regressor og respons kan 
# modellen ikke forudsige det kommende vejr s�rligt pr�cist.

## c. Sommertemperatur for 2020, hvor forsommeren var 11.25 grader.
# Vi s�tter ind i ligningen: 
x_2020 = 11.25
y_2020 = 7.29627 + 0.63605*x_2020
# y_2020 = 14.45

## d. Figur
# Estimerede v�rdier af sommertemperatuar:
plot(x, y, type="p",
     main = "�rlig middeltemperatur",
     xlab = "Forsommer (C)",
     ylab = "H�jsommer (C)",
     col = "blue")
# Tegner regressionslinjen
abline(reg=linmod, col="red")


## e. Residualanalyse
e = linmod$residuals
y_hat = linmod$fitted.values

plot(y_hat, e, xlab="y_hat", ylab="e", main="Residualplot for y_hat")
abline(h=0)
# Residualerne lader til at v�re nogenlunde uafh�ngige af y_hat, dog er 
# der m�ske en tendens til st�rre residualer i midteromr�det. 

plot(x, e, xlab="x", ylab="e", main="Residualplot for x")
abline(h=0)
# Der lader til at v�re en tendens til h�jere residualer for tempera-
# turer i midteromr�det

plot(aar, e, xlab="�r", ylab="e", main="Residualplot for �r")
abline(h=0)
# Residualerne ser ud til at v�re ensartede over tid

qqnorm(e)
# Residualerne lader til at v�re normalfordelte.

