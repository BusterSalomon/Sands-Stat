## Opgave om en spr�jterobot og helligdage

antal_m2 = 0.8            # Gennemsnitligt antal helligdage pr kvadratmeter
antal_skiver = 70
d = 1.2
areal_skive = pi * (d/2)^2


# a. Forventet antal helligdage p� en tilf�ldig skive
# lambda er antal helligdage pr kvadratmeter og 
# A_skive er en skives areal, s�
antal_pr_skive = antal_m2 * areal_skive


# b. Middelv�rdi, varians og standardafvigelse
# Det forventes at f�lge en Poissonfordeling, hvor lambda er gennemsnitlig
# antal helligdage pr skive, s� derfor er deskriptorerne givet som
middelvaerdi = antal_pr_skive
varians = antal_pr_skive
standardafv = sqrt(antal_pr_skive)


# c. Sandsynligheden for at alle 70 skiver er fejlfri
# Sandsynligheden for 0 helligdage p� 1 skive:
p_0_1 = dpois(0, antal_pr_skive)
# p_0_1 = 0.4046
# Samme sandsynlighed g�lder for alle skiver, og de er uafh�ngige, s�
p_0_70 = (p_0_1)^antal_skiver  # p_0_70 = 3.1201e-28

# Alternativt med dpois, vi forventer 70 gange s� mange helligdage,
# n�r vi ser p� 70 skiver:
p_0_70a = dpois(0, antal_skiver * antal_pr_skive)


# d. 
x = c(0:4)                    # Liste over antal helligdage 0,1,2,3,4 
x
p = dpois(x, antal_pr_skive)  # Liste med sands. for x helligdage
# Det f�rste element i listen p er p[1] = 0.4046, alts� p_0_1 fra c)
# Det femte element er sandsynligheden for *4* helligdage, p[5] = 0.0113.
# Vi bliver bedt om sandsynligheden for *4 eller flere* helligdage,
# det beregner vi med komplement�rmetoden:
p[5] = 1 - ppois(3, antal_pr_skive)

# Jeg tjekker lige, at sandsynlighederne summer op til 1:
tot = sum(p)

# Det forventede antal skiver i de fem kategorier findes ved at gange 
# med antal skiver:
n = p * antal_skiver

# Svar:
n               # 28.3241999 25.6271323 11.5934415  3.4964996  0.9587268
