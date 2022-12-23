mu = 4.0 # Middelværdi
sigma = 0.1 # Standardafvigelse

# a) Beregn sandsynligheden for at en tilfældig fjeder af den omtalte type
#    har en fjederkonstant på præcis 4.0 N/mm.
# Det kan ikke lade sig gøre.
# Ved kontinuerte fordelinger er det kun intervaler der har relevans
dnorm(4.0, mu, sigma)

# b) Beregn sandsynligheden for at fjederens fjederkonstant er under 3.7 N/mm.
# Må bruge den kummulerede fordelingsfunktion
res = pnorm(3.7, mu, sigma)
print(res)


# c) Beregn sandsynligheden for at fjederens fjederkonstant er større end 4.1 N/mm.
res = 1 - pnorm(4.1, mu, sigma)
print(res)

# d) Beregn et interval omkring middelværdien, som 99% af fjedrene vil tilhøre.
alpha = 0.005
x_hojre = qnorm(1-alpha, mu, sigma)
x_venstre = qnorm(alpha, mu, sigma)
x_hojre
x_venstre

# Giver intervallet [3.74; 4.26]