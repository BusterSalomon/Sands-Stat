

## Eksempel 11.20. Data til tjek af regression med Matrix notation
D = read.delim("Kap11/C11Ex20.TXT", header=TRUE)
x = D$x
y = D$y

plot(x,y)
linmod = lm(y~x)
summary(linmod)

# multiplikaton mellem to matricer a og b med operatoren %*%
# C = A %*% B


# X'Xb = X'y <=> b = (X'X)^-1X'y
n = length(x)
en = integer(n)+1             # En vektor af 1-taller
X = cbind(en, x)              # X består af en søjle med n 1'er og x som 2. søjle
Xt = t(X)                     # X' er X transponeret
XtX = Xt %*% X                # X'X
det(XtX)                      # determinanten er ikke 0, så invers findes
XtX_inv = solve(XtX)          # (X'X)^-1
XtX_invXt = XtX_inv %*% Xt    # (X'X)^-1X'
XtX_invXty = XtX_invXt %*% y  # b = (X'X)^-1X'y
b = XtX_invXty                # b = (9, -2)

# Her beregnet i et hug: 
# b2 = (X'X)^-1X'y
b2 = solve(t(X) %*% X) %*% t(X) %*% y
