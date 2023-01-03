## M&R opgave 9.15, s. 299
# Two different computer processors are compared by
# measuring the processing speed for different operations performed by computers using the two processors.
# If 12 measurements with the first processor had a
# standard deviation of 0.1 GHz and 16 measurements
# with the second processor had a standard deviation
# of 0.15 GHz, can it be concluded that the processing
# speed of the second processor is less uniform? Use a
# 0.05 level of significance. What assumptions must be
# made as to how the two samples are obtained?

# Processorhastigheden af to forskellige processorer unders�ges

n_1 = 12         # Antal m�linger med f�rste processor
s_1 = 0.1        # Stikpr�vestandardafvigelsen af f�rste processor
s2_1 = s_1^2     # Stikpr�vevariansen af f�rste processor

n_2 = 16         # Antal m�linger med anden processor
s_2 = 0.15       # Stikpr�vestandardafvigelsen af anden processor
s2_2 = s_2^2     # Stikpr�vevariansen af anden processor

# NB. Testst�rrelsens v�rdi, F_0 = s2_1/s2_2 afh�nger af hvilken
# stikpr�ve, der kaldes nr. 1 og nr. 2. 
# Bogen foresl�r, at man v�lger den stikpr�ve med st�rst varians til 
# at v�re i t�lleren, s� testst�rrelsen er st�rre end eller lig med 1.
# S� skal man vurdere testst�rrelsen mod den kritiske gr�nse for den
# h�jre hale (F_alfa ved ensidig test og F_alfahalve ved tosidig). 
# Her bevarer jeg nummereringen af stikpr�ver, s� den mindste kommer
# i t�lleren, og s� F_0 bliver evalueret mod gr�nsen for den venstre
# hale. Jeg beregner ogs� den alternative, F_0_alt og evaluerer mod
# h�jre hales gr�nse, s� man kan se, at resultatet er det samme.

# 1. Hypoteser:
# H0: sigma2_1 = sigma2_2
# H1: sigma2_1 < sigma2_2

# 2. Signifikansniveau
alfa = 0.05

# 3. Kriterier
# Testst�rrelsen F_0 = s2_1/s2_2 
# Alternativt: F_0_alt = s2_2/s2_1
# Testst�rrelsen er F-fordelt med n_1-1 frihedsgrader i t�lleren og 
# n_2-1 frihedsgrader i n�vneren
# Vi forkaster H0, hvis F_0 er mindre end F_venstre, hvor 
F_venstre = qf(alfa, n_1-1, n_2-1)
# Alternativt, hvis F_0_alt er st�rre end F_hoejre, hvor
F_hoejre  = qf(1-alfa, n_2-1, n_1-1)


# 4. Beregninger
F_0 = s2_1/s2_2 
F_0_alt = s2_2/s2_1

# 5. Konklusion
# Da F_0 = 0.4444 ikke er mindre end F_venstre = 0.3678, kan vi ikke
# forkaste H0. Varianserne af de to processorer kan v�re ens.

# Hvis vi havde byttet om p� stikpr�vernes numre, ville vi n� samme
# konklusion, for F_0_alt = 2.25 overstiger ikke den h�jre hales 
# gr�nse p� F_hoejre = 2.2719

