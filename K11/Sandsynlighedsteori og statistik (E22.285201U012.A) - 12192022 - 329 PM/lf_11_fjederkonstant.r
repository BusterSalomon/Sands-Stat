

## Opgave kap. 11 om bestemmelse af en fjeders fjederkonstant

D = read.table("Kap11/data_hookes_lov.csv", header=TRUE, sep=";")
aar = D$Aar
m = D$Masse/1000   # Loddernes masse omregnet til kg
x = D$Laengde      # Fjederens forlængelse i mm
F = m*9.81         # Loddernes tyngdekraft på fjederen (kg*m/s2 = N)


## a: Lineær regression
# Lineær regression, hvor F udtrykkes som funktion af x
linmod = lm(F~x)
summary(linmod)

# Fjederkonstanten k aflæses som hældningskoefficienten, så 
# k = b1 = 0.32732

# Man kan evt. ønske at tvinge b0 til at være 0, da vi forventer 
# at fjederen ikke forlænges, hvis den ikke påvirkes. Der er jo 
# heller ikke noget konstantled på Hooke's lov. 
# Det kan vi gøre sådan:
linmod0 = lm(F~x - 1)
summary(linmod0)
# Det giver k = b1 = 0.29917
# Begge estimater af fjederkonstanten k er gyldige i besvarelsen


## b: Forklaring af modellens statistikker
# Jeg forklarer statistikkerne for modellen med intercept. 
# P-værdien for bestemmelsen af fjederkonstanten er 1.89e-05, så vi er
# næsten sikker på, at værdien ikke er nul. Til gengæld er p-værdien på 
# 0.256 for koefficienten b0 = -0.56444, så det er meget sandsynligt, 
# at den i virkeligheden er 0. Det er jo også det, vi forventer af 
# Hookes lov:
#    b0 er 0 og b1 er en positiv konstant (fjederkonstanten). 
# R-squared er 0.9609 og Adjusted R-Squared er 0.9544, så modellen 
# forklarer næsten al variationen. Det er ikke så overraskende for en 
# fysisk lov. 


## c. Figur(er)
plot(x, F, type="p",
     main = "Kraften på en fjeder og dens udstrækning",
     xlab = "Udstrækning x (mm)",
     ylab = "Kraft F (N)",
     col = "blue")
# Tegner regressionslinjen
abline(reg=linmod, col="red")


## d. Bedre bestemmelse af fjederkonstanten
# Det er klart, at Hookes lov kun gælder indenfor et interval, der er
# begrænset af, hvor langt fjederen kan trækkes ud. Når fjederen 
# nærmer sig sin maksimale længde vil en ekstra kraftpåvirkning ikke 
# resultere i en yderligere forlængelse med proportionalitetsfaktoren 
# k. Derfor er det i orden at udelukke punkter, der lader til at 
# ligge udenfor intervallet, hvor Hookes lov gælder. 

# Ud fra figuren i c) tyder det på, at de  sidste to målinger er 
# udenfor intervallet, hvor Hookes lov gælder.  
# Derfor vil jeg udelukke de sidste to punkter og bestemme 
# fjederkonstanten ud fra de første 6. Jeg vil desuden tvinge 
# modellen til at gå igennem (0,0).

x2 = x[1:6]
F2 = F[1:6]
linmod2 = lm(F2 ~ x2 - 1)
summary(linmod2)

# Nu bestemmes fjederkonstanten til k = 0.25396 N/mm. 

# Ikke overraskende er modellen nu endnu bedre. P-værdien for  
# bestemmelsen af fjederkonstanten er 3.55e-10, så vi er næsten 
# sikker på, at værdien ikke er nul. 
# Både R-squared og Adjusted R-Squared er 0.9997, så modellen 
# forklarer næsten al variationen. 

# Figur af den nye model:
plot(x2, F2, type="p",
     main = "Kraften på en fjeder og dens udstrækning",
     xlab = "Udstrækning x (mm)",
     ylab = "Kraft F (N)",
     col = "blue")
abline(reg=linmod2, col="red")


## e. 95 % konfidensinterval for fjederkonstanten
ki = confint(linmod2, level=0.95)
# 95 %Konfidensintervallet for fjederkonstanten er 
# [0.2493; 0.2586]