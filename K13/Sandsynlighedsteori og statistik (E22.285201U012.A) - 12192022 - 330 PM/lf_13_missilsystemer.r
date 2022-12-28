## Eksempel 13.3. 

D = read.csv("Kap13/data_missilsystemer.csv", sep=";", header=TRUE)
Missilsystem = as.factor(D$MissilSystem)    # Faktor 1
Braendstof = as.factor(D$Braendstof)        # Faktor 2
Fremdriftskraft = D$Fremdriftskraft         # Respons


## a: Parallelle boksplot for hver faktor

# Missilsystem
boxplot(Fremdriftskraft ~ Missilsystem, 
        main="Fremdriftskraft for tre missilsystemer",
        xlab="Missilsystem",
        ylab="Fremdriftskraft")
# Missilsystem 2 ser bedst ud, med højeste median og med
# mindste variation.
# Missilsystem 2 og 3 ser mere ensartede ud, hvor 2 har en lidt 
# højere median end 3, men også lidt mere variation

# Brændstof
boxplot(Fremdriftskraft ~ Braendstof, 
        main="Fremdriftskraft for fire brændstoffer",
        xlab="Brændstof",
        ylab="Fremdriftskraft")
# Brændstof 1 ser bedst ud med høj median og lille variation
# Brændstof 2 har næsthøjeste median og lidt mere variation 
# end 1, men mindre end 3 og 4
# Brændstof 3 og 4 har ensartet median og variation, målt som 
# forskellen på enden af kostene. Der er dog forskel på deres
# interkvartile range, dvs. længden af kasserne. Dette kan 
# sagtens skyldes, at der kun er 6 observationer til at tegne
# hver boksplot


## b:
fm1 = aov(Fremdriftskraft ~ Missilsystem + Braendstof + Missilsystem:Braendstof)
summary(fm1)
# Analysen viser, at missilsystemet har en signifikant effekt 
# på fremdriftskraften (p-værdi 0.00350). Ligeledes er der 
# signifikant effekt af brændstof (p-værdi 0.00022). Selv om der 
# lader til at være interaktion imellem missilsystem og brændstof, 
# så viser analysen at interaktionen ikke er signifikant 
# (p-værdi 0.19063).


## c: Parvise sammenligninger:
alfa = 0.05

# Tukey HSD:
TukeyHSD(fm1, "Missilsystem", conf.level=1-alfa)
# På 5 % signifikansniveau er der forskel på missilsystem 1 og 2 
# (p-værdi 0.041) og på 2 og 3 (p-værdi 0.0029). Der er ikke 
# signifikant forskel på 1 og 3 (p-værdi 0.33). 
# Med andre ord er missilsystem 2 forskellig fra de to andre, der
# ikke er forskellige

TukeyHSD(fm1, "Braendstof", conf.level=1-alfa)
# Brændstoftype 1 er signifikant forskellig fra 2, 3 og 4. 
# Brændstoftype 2 er signifikant forskellig fra 1, men ikke 3 og 4.
# Brændstoftype 3 er signifikant forskellig fra 1, men ikke 3 og 4. 
# Brændstoftype 4 er signifikant forskellig fra 1, men ikke 2 og 3.
# Med andre ord er brændstoftype 1 forskellig fra de tre andre, som
# ikke adskiller sig signifikant fra hinanden. 

## d: Valg af bedste kombination
# Vi har set, at missilsystem 2 er bedre end de andre og at der er
# signifikant forskel til de andre. Vi har ligeledes set, at brænd-
# stof 1 er bedre end de andre og at der er signifikant forskel til
# de andre. 
# Kombinationen af missilsystem 2 og brændstof 1 er ikke nødvendig-
# vis bedst, for interaktion kan ændre det billede. Men vi så i b.,
# at der ikke er signifikant interaktion. 

# Her laves et parallelt boksplot med alle 12 kombinationer af 
# missilsystem og brændstof:
boxplot(Fremdriftskraft ~ Missilsystem + Braendstof)

# Boksplottet viser 12 kasser, hvor de første 3 er for missilsystem
# 1, med hhv. brændstof 1, 2 og 3, osv. Den bedste kombination er 
# kasse nr. to fra venstre, der netop er for kombinationen af 
# missilsystem 2 og brændstof 1. Denne kombination har den højeste
# median og samtidig en ret lille variation (godt nok kun målt med
# 2 observationer).

# Jeg vil vælge missilsystem 2 og brændstoftype 1, fordi det både 
# har den højeste forventede fremdriftskraft og desuden mindre 
# variabilitet end de andre kombinationer med høj fremdriftskraft, 
# altså højere pålidelighed.


## e. Antagelser
# Vi har antaget, at fremdriftskraften kan beskrives som en over-
# ordnet middelværdi med en effekt af missilsystem, en effekt af 
# brændstofsystem og en effekt af interaktion mellem de to. 
# Residualet har vi antaget er normalfordelt med middelværdi 0 og 
# samme varians for alle faktorer. Residualerne skal derfor gerne 
# være tilfældige og uafhængige af faktorniveau i residual plots. 

e = fm1$residuals
y_hat = fm1$fitted.values

qqnorm(e)
# Normalfordelingsplottet viser residualerne nogenlunde på en ret
# linje, så antagelsen om normalfordeling holder
plot(y_hat, e, type="p",
     main="Residualplot for fremdriftskraft",
     xlab="Estimeret fremdriftskraft",
     ylab="Residual",
     col="blue")
abline(h=0, col="red")
# Dette residualplot viser at residualerne er nogenlunde tilfældige
# og uafhængige af estimeret værdi

plot(as.integer(Missilsystem), e, type="p",
     main="Residualplot for missilsystemer",
     xlab="Missilsystem",
     ylab="Residual",
     col="blue")
abline(h=0, col="red")
# Her ser vi, at residualerne ikke er uafhængige af missil-
# system. Residualerne er størst for missilsystem 1 og mindst 
# for nr. 3.

plot(as.integer(Braendstof), e, type="p",
     main="Residualplot for typer af brændstof",
     xlab="Brændstof",
     ylab="Residual",
     col="blue")
abline(h=0, col="red")
# Residualerne for brændstoftype 1 og især 4 er mindre end for 
# 2 og 3.

# Da antagelsen om at residualerne er uafhængige af behandlinger
# ser ud til at fejle, laver jeg bartlett's tests for hver 
# faktor
bartlett.test(Fremdriftskraft, Missilsystem)
# Med en p-værdi på 0.27 kan vi ikke forkaste testens nulhypo-
# tese om, at missilsystemerne har samme varians. Det kan 
# altså have været tilfældige forskelle, vi så i residual-
# plottet. 

bartlett.test(Fremdriftskraft, Braendstof)
# Her kan vi heller ikke afvise, at brændstoftyperne har samme
# varians, for p-værdien er 0.16.

combo = as.factor(10*as.integer(Missilsystem) + as.integer(Braendstof))
# Funktionen bartlett.test() kan kun undersøge 1 faktor. Derfor
# kombinerer jeg vores to faktorer sammen til 1, der hedder 
# combo. F.eks. svarer combo=23 til kombinationen missilsystem 
# 2 sammen med brændstoftype 3. 
bartlett.test(Fremdriftskraft, combo)
# Med p-værdien 0.327 kan denne test heller ikke afvise, at 
# hver af de 12 kombinationer har samme varians. 

# Jeg konkluderer således, at både antagelsen om normalfordelte
# residualer og varianshomogenitet holder. 
