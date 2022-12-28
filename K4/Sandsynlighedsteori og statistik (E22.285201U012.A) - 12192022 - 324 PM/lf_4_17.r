

## Opgave 4.17, s. 106 (binomialfordeling)
# 85 % af udstødningsventiler har korrekt afstand
# Der udtages 20

p = 0.85
n = 20

# a
# Jeg tolker 'at least 15' som 15 eller derover. 
# Vi kan beregne sandsynligheden for 14 eller derunder som
# pbinom(14, n, p). Så er komplementærhændelsen over 14 
# (eller med andre ord: 15 eller derover)
p_mindst_15 = 1 - pbinom(14, n, p)    # 0.9327

# MEN dette svar stemmer med facitlisten: 
p_mindst_15 = 1 - pbinom(15, n, p)    # 0.8298
# Enten fejl i facitlisten, eller i mine engelsk-kunskaber

# b
p_hoejst_10 = pbinom(10, n, p)        # 0.0002

# c 
p_praecis_18 = dbinom(18, n, p)       # 0.2293


