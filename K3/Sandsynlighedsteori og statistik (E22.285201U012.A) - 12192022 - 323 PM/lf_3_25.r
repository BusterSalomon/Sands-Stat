

# Opgave 3.25, s. 66
# Kasse med 15 t�ndr�r, hvor 1 er defekt. Vi skal v�lge et s�t p� 4.

# a. 
# I de s�t af 4, der indeholder det defekte t�ndr�r, er det defekte 
# givet, s� der er kun tre tilbage at v�lge blandt de 14 ikke-defekte:
Antal_med_defekt = choose(14,3)   # 364


# Der er 14 t�ndr�r, der ikke er defekte i kassen. Fra dem kan vi 
# v�lge 4 p� '14 over 4' m�der:
Antal_uden_defekt = choose(14,4)   # 1001

# Bem�rk (ekstra)
# Antal m�der at tage 4 ud af de 15 t�ndr�r er summen af de to:
Antal_4_af_15 = choose(15,4)       # 1365 = 364 + 1001
# Dermed er sandsynligheden for at f� et 4-s�t med en defekt lig:
P_defekt = Antal_med_defekt/Antal_4_af_15   # 0.2667 = 4/15
