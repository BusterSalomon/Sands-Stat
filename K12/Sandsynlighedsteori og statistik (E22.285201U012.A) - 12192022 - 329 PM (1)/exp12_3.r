

## Eksempel 12.3. Enkelt-faktor eksperiment med styrke af tre resiner
D = read.delim("Kap12/C12Ex3.TXT", header=TRUE)
resin = D$resin
styrke = D$strength

plot(resin, styrke)

boxplot(styrke~resin, 
        main="Boksplot for eksperiment med styrke af 3 resiner",
        names=c("ED","MD","PF"),
        xlab="Resin",
        ylab="Styrke")

# Det er n�dvendigt at deklarere resin som en faktor, da der bare st�r 1, 2, 3 (tal)
# i datas�ttet. Havde der st�et ED, MD og PF, ville anova virke. 
f_resin = as.factor(D$resin)

anova(lm(styrke~f_resin))

# alternativ metode:
fm1 = aov(styrke~f_resin)
summary(fm1)


pairwise.t.test(styrke, f_resin, p.adjust.method = "bonferroni")
# Ikke optimalt, for metoden giver ikke konfidensintervaller, men tilsyneladende kun 
# p-v�rdier for om forskellen er 0

# Tukey HSD:
fm1 = aov(styrke~f_resin)
summary(fm1)
TukeyHSD(fm1, conf.level=0.95)


## Antagelser: 
# Vi har antaget, at residualerne er normalfordelte med samme
# varians (varianshomogenitet)

# Vi f�r beregnet y_hat og residualerne med aov funktionen:
e = fm1$residuals
y_hat = fm1$fitted.values

# Jeg pr�senterer residualerne sammen med data og y_hat:
res = cbind(f_resin, styrke, y_hat, e)
print(res)

# Test for normalfordelte residualer:
qqnorm(e)   
# Normalfordelingsplottet er nogenlunde line�rt

# Residualplot
plot(resin, e, type="p",
     main="Residualplot for resin typer",
     xlab="Resin type",
     ylab="Residual",
     col="blue")
abline(h=0, col="red")
# Residualerne er ensartet fordelt for de tre typer resin

plot(y_hat, e, type="p",
     main="Residualplot for estimeret styrke",
     xlab="Estimeret styrke (y_hat)",
     ylab="Residual",
     col="blue")
abline(h=0, col="red")
# Residualerne er uafh�ngige af y_hat

# Test af varianshomogenitet med Bartlett's test
bartlett.test(styrke,f_resin)





