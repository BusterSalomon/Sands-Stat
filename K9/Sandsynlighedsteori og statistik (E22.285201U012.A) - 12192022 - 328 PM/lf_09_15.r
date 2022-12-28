## M&R opgave 9.15, s. 299
# Processorhastigheden af to forskellige processorer undersøges

n_1 = 12         # Antal målinger med første processor
s_1 = 0.1        # Stikprøvestandardafvigelsen af første processor
s2_1 = s_1^2     # Stikprøvevariansen af første processor

n_2 = 16         # Antal målinger med anden processor
s_2 = 0.15       # Stikprøvestandardafvigelsen af anden processor
s2_2 = s_2^2     # Stikprøvevariansen af anden processor

# NB. Teststørrelsens værdi, F_0 = s2_1/s2_2 afhænger af hvilken
# stikprøve, der kaldes nr. 1 og nr. 2. 
# Bogen foreslår, at man vælger den stikprøve med størst varians til 
# at være i tælleren, så teststørrelsen er større end eller lig med 1.
# Så skal man vurdere teststørrelsen mod den kritiske grænse for den
# højre hale (F_alfa ved ensidig test og F_alfahalve ved tosidig). 
# Her bevarer jeg nummereringen af stikprøver, så den mindste kommer
# i tælleren, og så F_0 bliver evalueret mod grænsen for den venstre
# hale. Jeg beregner også den alternative, F_0_alt og evaluerer mod
# højre hales grænse, så man kan se, at resultatet er det samme.

# 1. Hypoteser:
# H0: sigma2_1 = sigma2_2
# H1: sigma2_1 < sigma2_2

# 2. Signifikansniveau
alfa = 0.05

# 3. Kriterier
# Teststørrelsen F_0 = s2_1/s2_2 
# Alternativt: F_0_alt = s2_2/s2_1
# Teststørrelsen er F-fordelt med n_1-1 frihedsgrader i tælleren og 
# n_2-1 frihedsgrader i nævneren
# Vi forkaster H0, hvis F_0 er mindre end F_venstre, hvor 
F_venstre = qf(alfa, n_1-1, n_2-1)
# Alternativt, hvis F_0_alt er større end F_hoejre, hvor
F_hoejre  = qf(1-alfa, n_2-1, n_1-1)


# 4. Beregninger
F_0 = s2_1/s2_2 
F_0_alt = s2_2/s2_1

# 5. Konklusion
# Da F_0 = 0.4444 ikke er mindre end F_venstre = 0.3678, kan vi ikke
# forkaste H0. Varianserne af de to processorer kan være ens.

# Hvis vi havde byttet om på stikprøvernes numre, ville vi nå samme
# konklusion, for F_0_alt = 2.25 overstiger ikke den højre hales 
# grænse på F_hoejre = 2.2719

