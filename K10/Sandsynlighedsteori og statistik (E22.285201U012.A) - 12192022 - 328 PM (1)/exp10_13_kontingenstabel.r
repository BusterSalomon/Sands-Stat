
## Eksempel 10.13 og 10.14. Kontingenstabel. 
## Er performance i job og tr�ningsprogram uafh�ngige?

r = 3            # Antal r�kker
c = 3            # Antal s�jler
# Jeg bruger matrix() til at indl�se data, s� jeg lettere kan 
# beregne forventet antal 
O = matrix(c(23, 60, 29, 
             28, 79, 60, 
              9, 49, 63),   # Array med antal observerede
           nrow=r,          # Antal r�kker
           ncol=c,          # Antal s�jler
           byrow=TRUE       # Data skal l�ses ind r�kkevis (default 
           )                # er s�jlevis)
print(O)
n = sum(O)                  # Tjekker, at n = 400

## 1. Hypoteser
# H0: Performance i job og tr�ningsprogram er uafh�ngige
# H1: Der er ikke uafh�ngige

## 2. Signifikansniveau
alfa = 0.01

## 3. Kriterier
# chi2_0 = sum((E-O)^2/E) er chi-i-anden fordelt med (r-1)*(c-1) 
# frihedsgrader.
# Vi forkaster nulhypotesen hvis chi2_0 > chi2_alfa
df = (r-1)*(c-1)
chi2_alfa = qchisq(1-alfa, df)
# chi2_alfa = 13.277

## 4. Beregninger
# Vi har brug for at beregne forventet antal, E.
# Da data er repr�senteret i en matrix kan jeg beregne 
# r�kkesummer og s�jlesummer som hhv 2x1 og 1x2 matricer
rsum = matrix(rowSums(O), nrow=r)  # Sum af elementer i hver r�kke af O
ssum = matrix(colSums(O), ncol=c)  # Sum af elementer i hver s�jle af O
print(rsum)
print(ssum)

# Beregning af forventet antal i matricen E
# E_ij = rsum_i*ssum_j/n
# matrix-multiplikation i R sker med operatoren %*%
E = rsum %*% ssum / n    
print(E)

# Nu er vi klar til at beregne testst�rrelsen chi2_0:
chi2_0 = sum((E-O)^2/E)
# chi2_0 = 20.1789

## 5. Konklusion
# Da testst�rrelsen chi2_0 = 20.1789 er st�rre end den kritiske 
# gr�nse chi2_alfa = 3.84, m� vi forkaste nulhypotesen. Dermed er 
# der afh�ngighed mellem hvordan man klarer sig i tr�ningsprogrammet
# og i jobbet.


## Alternativ l�sning med R funktionen chisq.test()

res = chisq.test(O, 
           correct=FALSE  # Vi skal undg�, at R laver en korrektion
           )
print(res)
E = res$expected

print(E)
print(O)

chi2_0 = sum((E-O)^2/E)
