

## Eksempel 13.1. To-faktor eksperiment med styrke (resiliens) af to typer 
# genbrugt materiale fra tre lokaliteter

D = read.delim("Kap13/C13Ex1.TXT", header=TRUE)
lok = D$A          # Lokalitet (Faktor A)
mat = D$B          # Materiale type (Faktor B)
res = D$resilmod   # responsen residual modulus
# NB Da der står bogstaver for niveauerne af både faktor A (MN, CO, TX) og 
# faktor B (RCA, RPA) kan R automatisk opfatte dem som faktorer

fm1 = aov(res ~ lok + mat + lok:mat); 
summary(fm1)

TukeyHSD(fm1,"lok", conf.level=0.99)
TukeyHSD(fm1,"mat", conf.level=0.99)
TukeyHSD(fm1, conf.level=0.99)



# Uden interaktion: 
summary(aov(res ~ lok + mat))

summary(aov(res ~ mat + lok:mat))
# Giver modellen mening?