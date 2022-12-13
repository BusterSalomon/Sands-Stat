# a) Hvor mange helligdage må der forventes at være på en tilfældig skive?
skive_areal = (1.2/2)^2 * pi
skive_areal
helligdage_pr_km = 0.8

helligdage_pr_skive = skive_areal * helligdage_pr_km
helligdage_pr_skive


# b) Hvilken sandsynlighedsfordeling vil du bruge til at beskrive antal
#    helligdage på en skive, og hvad er fordelingens middelværdi, varians
#    og standardafvigelse?

# " Hvad er sandsynligheden for at få x helligdage,
#   når der i gennemsnittet fås y helligdage "
# " Hvad er sandsynligheden for at a sker x gange,
#   når x i gennemsnittet sker b gange "
#   Dette er poisson fordelingen. Hvor mean er givet ved helligdage pr skive
#   mean = helligdage pr skive
#   standard deviation = mean
#   deviation = \sqrt {mean}
lamb = helligdage_pr_skive
lambda
standard_dev = lamb
standard_dev
dev = sqrt(lamb)
dev

# c
# bruger r funktion dpos
dpois(0, lambda=lamb)

# d
# Starter med at lave en liste med antal helligdage
x = c(0:4)
x # == [0, 1, 2, 3, 4]

# Herefter udregner jeg sandsynligheden for 0, 1, 2, 3 og 4 helligdage
p = dpois(x, lamb)
p

# Den sidste er sandsynligheden for 4 helligdage, 
# men vi vil gerne have sandsynligheden for 4 eller flere
# Beregnes ved det samlede minus sandsynligheden for 0, 1, 2 og 3 lagt sammen
# Til dette kan ppois bruges, som giver værdien til den kummulerede tæthedsfunktion
sum(p[1:4]) == ppois(3, lamb) # = TRUE

# Så derfor sættes 5 element til sands for 4 eller flere i stedet for 4
p[5] = 1 - ppois(3, lamb)
sum(p) # Sandsynligheden skulle gerne summe til en


# Denne liste indeholder sandsynlighederne, for at få antallet af de enkelte ganges med antallet af skiver
antal = p * 70
antal
