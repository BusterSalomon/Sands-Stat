

## Opgave kap. 11 om forudsigelse af en vindmølles produktion

D = read.table("Kap11/data_vindmoelleproduktion.csv", header=TRUE, sep=";")
x = D$Vindhastighed
y = D$Produktion


## a: Lineær regression
# Lineær regression, hvor y udtrykkes som funktion af x
linmod = lm(y~x)
summary(linmod)

# Regressionsligning:
# Svar: y = 0.13088 + 0.24115*x
x_0 = 9.5
y_0 = 0.13088 + 0.24115*x_0
# Svar: Forventet strømproduktion svarende til 9.5 er 2.4218


## b: Hvor god er modellen?
# Beskrivelse af modellens kvalitet
# Både R-squared og Adjusted R-Squared er tæt på 0.90, så modellen 
# beskriver en acceptabelt høj del af variationen i data. 
# Koefficienten for hældningen (b1) er signifikant forskellig fra 0, 
# men det er koefficienten for skæring med y-aksen (b0) ikke (p-værdi 0.31). 


## c: Scatterplot og residualplot

# Scatterplot
plot(x, y, type="p",
     main = "Vindmølleproduktion og vindhastighed",
     xlab = "Vindhastighed",
     ylab = "Produceret strøm",
     col = "blue")
# Tegner regressionslinjen
abline(reg=linmod, col="red")

# Residualplot
yhat = 0.13088 + 0.24115*x
e = y - yhat
plot(yhat, e, type="p",
     main = "Residualplot",
     xlab = "Estimeret strømproduktion",
     ylab = "Residual",
     col = "blue")
# Tegner horisontal linje for 0
abline(h=0)

# Det fremgår tydeligt af figur 1, at sammenhængen mellem x og y ikke er 
# lineær. Derfor er der tendens til at den lineære model rammer for højt 
# lave og høje værdier af x og for lavt midt imellem. Det ses også i 
# residualplottet, hvor residualet er negativt for høje og lave værdier 
# af y_hat og positivt for værdier i midten. 
# Det tyder på, at en transformation kan give en bedre model. 


## d: Transformationer
# Først en logaritmisk transformation 
y1 = y
x1 = log(x)

linmod1 = lm(y1 ~ x1)
summary(linmod1)

# y1 = -0.83036 + 1.41677*x1

# Dernæst en reciprok transformation
y2 = y
x2 = 1/x

linmod2 = lm(y2 ~ x2)
summary(linmod2)

# y2 = 2.9789 - 6.9345*x2


## e: Scatterplots og residualplots
# Logaritmisk transformation
y1hat = -0.83036 + 1.41677*x1

plot(x1, y1, type="p",
     main = "Vindmølleproduktion og vindhastighed",
     xlab = "Vindhastighed logaritmisk (logx)",
     ylab = "Produceret strøm",
     col = "blue")
abline(reg=linmod1, col="red")

e1 = y1 - y1hat

plot(y1hat, e1, type="p",
     main = "Residualplot",
     xlab = "y1_hat, logaritmisk model",
     ylab = "Residual, logaritmisk mode",
     col = "blue")
abline(h=0)

# Reciprok transformation
y2hat = 2.9789 - 6.9345*x2

plot(x2, y2, type="p",
     main = "Vindmølleproduktion og vindhastighed",
     xlab = "Vindhastighed reciprok (1/x)",
     ylab = "Produceret strøm",
     col = "blue")
abline(reg=linmod2, col="red")

e2 = y2 - y2hat

plot(y2hat, e2, type="p",
     main = "Residualplot",
     xlab = "y2_hat, reciprok model",
     ylab = "Residual, reciprok mode",
     col = "blue")
abline(h=0)


## f: Konklusion
# Den logaritmiske model er bedre end den lineære uden transformation, 
# da både R-squared (0.98) og Adjusted R-Squared (0.9792) er højere end 
# for den utransformerede. 
# Desuden er p-værdierne mindre, og begge koefficienter er signifikante. 
# Residualplottet viser dog, at residualerne ikke er tilfældigt fordelt.

# Den reciprokke model er endnu bedre end den logaritmiske. Både 
# R-Squared
# og Adjusted R-Squared er tæt på 1, og p-værdierne for begge 
# koefficienter er tæt på nul. Scatterplottet med regressionsligningen 
# på viser, at punkterne ikke varierer ret meget omkring linjen, og 
# residualerne i residualplottet lader til at være tilfældigt fordelt. 
# Derfor vælges denne model som den bedste. Regressionsligningen er:
# y = 2.9789 - 6.9345/x

