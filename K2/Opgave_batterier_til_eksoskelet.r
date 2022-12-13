# a) Beregn middelværdi og standardafvigelse for alle målingerne af driftstid
data = read.csv(file = "K2/eksoskelet_batterier.csv", sep=";");
driftstid = data$Driftstid

# Middelværdi
mean(driftstid)

# Standardafvigelse
sd(driftstid)

# b) Beregn middelværdi og standardafvigelse for hver af de tre batterityper
driftstid1 = driftstid[0:5]
driftstid2 = driftstid[6:10]
driftstid3 = driftstid[11:15]

mean(driftstid1)
mean(driftstid2)
mean(driftstid3)

sd(driftstid1)
sd(driftstid2)
sd(driftstid3)

# c) Lav et parallelt boksplot, der viser driftstiden for hver batteritype.
boxplot(driftstid1, driftstid2, driftstid3, names=c("1", "2", "3"), col="lightblue", horizontal=FALSE, ylab="Driftstid (min)", xlab="Batteritype")

