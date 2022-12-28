

## Popcorn

D = read.delim("Kap11/C11Ex_alj_popcorn.txt", header=TRUE)
x1 = D$Temp       # Temperatur
x2 = D$Oil        # Oliemængde
x3 = D$Time       # Popningstid
y  = D$Bad        # Antal uspiselige popcorn

linmod = lm(y ~ x1 + x2 + x3)
summary(linmod)



linmod = lm(y ~ x1 + x2 + x3 + I(x1^2) + I(x2^2) + I(x3^2) + x1:x2 + x1:x3 + x2:x3)
summary(linmod)

# Det kan også skrives sådan:
linmod = lm(y ~ x1 + x2 + x3 
            + I(x1^2) + I(x2^2) + I(x3^2) 
            + I(x1*x2) + I(x1*x3) + I(x2*x3))
summary(linmod)


# Den efter min mening bedste model:
linmod = lm(y ~ x1 + x3 
            + I(x1^2) + I(x3^2) 
            + I(x1*x3))
summary(linmod)

