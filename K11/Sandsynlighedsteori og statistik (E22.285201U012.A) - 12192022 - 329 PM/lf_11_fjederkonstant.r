

## Opgave kap. 11 om bestemmelse af en fjeders fjederkonstant

D = read.table("K11/Sandsynlighedsteori og statistik (E22.285201U012.A) - 12192022 - 329 PM/data_hookes_lov.csv", header=TRUE, sep=";")
aar = D$Aar
m = D$Masse/1000   # Loddernes masse omregnet til kg
x = D$Laengde      # Fjederens forl�ngelse i mm
F = m*9.81         # Loddernes tyngdekraft p� fjederen (kg*m/s2 = N)


## a: Line�r regression
# Line�r regression, hvor F udtrykkes som funktion af x
linmod = lm(F~x)
summary(linmod)

# Fjederkonstanten k afl�ses som h�ldningskoefficienten, s� 
# k = b1 = 0.32732

# Man kan evt. �nske at tvinge b0 til at v�re 0, da vi forventer 
# at fjederen ikke forl�nges, hvis den ikke p�virkes. Der er jo 
# heller ikke noget konstantled p� Hooke's lov. 
# Det kan vi g�re s�dan:
linmod0 = lm(F~x - 1)
summary(linmod0)
# Det giver k = b1 = 0.29917
# Begge estimater af fjederkonstanten k er gyldige i besvarelsen


## b: Forklaring af modellens statistikker
# Jeg forklarer statistikkerne for modellen med intercept. 
# P-v�rdien for bestemmelsen af fjederkonstanten er 1.89e-05, s� vi er
# n�sten sikker p�, at v�rdien ikke er nul. Til geng�ld er p-v�rdien p� 
# 0.256 for koefficienten b0 = -0.56444, s� det er meget sandsynligt, 
# at den i virkeligheden er 0. Det er jo ogs� det, vi forventer af 
# Hookes lov:
#    b0 er 0 og b1 er en positiv konstant (fjederkonstanten). 
# R-squared er 0.9609 og Adjusted R-Squared er 0.9544, s� modellen 
# forklarer n�sten al variationen. Det er ikke s� overraskende for en 
# fysisk lov. 


## c. Figur(er)
plot(x, F, type="p",
     main = "Kraften p� en fjeder og dens udstr�kning",
     xlab = "Udstr�kning x (mm)",
     ylab = "Kraft F (N)",
     col = "blue")
# Tegner regressionslinjen
abline(reg=linmod, col="red")


## d. Bedre bestemmelse af fjederkonstanten
# Det er klart, at Hookes lov kun g�lder indenfor et interval, der er
# begr�nset af, hvor langt fjederen kan tr�kkes ud. N�r fjederen 
# n�rmer sig sin maksimale l�ngde vil en ekstra kraftp�virkning ikke 
# resultere i en yderligere forl�ngelse med proportionalitetsfaktoren 
# k. Derfor er det i orden at udelukke punkter, der lader til at 
# ligge udenfor intervallet, hvor Hookes lov g�lder. 

# Ud fra figuren i c) tyder det p�, at de  sidste to m�linger er 
# udenfor intervallet, hvor Hookes lov g�lder.  
# Derfor vil jeg udelukke de sidste to punkter og bestemme 
# fjederkonstanten ud fra de f�rste 6. Jeg vil desuden tvinge 
# modellen til at g� igennem (0,0).

x2 = x[1:6]
F2 = F[1:6]
linmod2 = lm(F2 ~ x2 - 1)
summary(linmod2)

# Nu bestemmes fjederkonstanten til k = 0.25396 N/mm. 

# Ikke overraskende er modellen nu endnu bedre. P-v�rdien for  
# bestemmelsen af fjederkonstanten er 3.55e-10, s� vi er n�sten 
# sikker p�, at v�rdien ikke er nul. 
# B�de R-squared og Adjusted R-Squared er 0.9997, s� modellen 
# forklarer n�sten al variationen. 

# Figur af den nye model:
plot(x2, F2, type="p",
     main = "Kraften p� en fjeder og dens udstr�kning",
     xlab = "Udstr�kning x (mm)",
     ylab = "Kraft F (N)",
     col = "blue")
abline(reg=linmod2, col="red")


## e. 95 % konfidensinterval for fjederkonstanten
ki = confint(linmod2, level=0.95)
# 95 %Konfidensintervallet for fjederkonstanten er 
# [0.2493; 0.2586]