

# Opgave 3.25, s. 66
# Kasse med 15 tændrør, hvor 1 er defekt. Vi skal vælge et sæt på 4.

# a. 
# I de sæt af 4, der indeholder det defekte tændrør, er det defekte 
# givet, så der er kun tre tilbage at vælge blandt de 14 ikke-defekte:
Antal_med_defekt = choose(14,3)   # 364


# Der er 14 tændrør, der ikke er defekte i kassen. Fra dem kan vi 
# vælge 4 på '14 over 4' måder:
Antal_uden_defekt = choose(14,4)   # 1001

# Bemærk (ekstra)
# Antal måder at tage 4 ud af de 15 tændrør er summen af de to:
Antal_4_af_15 = choose(15,4)       # 1365 = 364 + 1001
# Dermed er sandsynligheden for at få et 4-sæt med en defekt lig:
P_defekt = Antal_med_defekt/Antal_4_af_15   # 0.2667 = 4/15
