

# Opgave 3.41, s. 77
# A og B er 'mutually exclusive'. P(A) = 0.45, P(B) = 0.30
P_A = 0.45
P_B = 0.3

# a
P_Ac = 1 - P_A               # 0.55

# b
P_A_U_B = P_A + P_B          # 0.75

# c
# Venn diagram viser, at det er det samme som A
P_A_n_Bc = P_A               # 0.45

# d
# Venn diagram viser, at det er området udenfor både A og B:
P_Ac_n_Bc = 1 - P_A - P_B    # 0.25
