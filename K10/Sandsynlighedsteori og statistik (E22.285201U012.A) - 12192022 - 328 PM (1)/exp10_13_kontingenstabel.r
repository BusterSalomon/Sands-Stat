
## Eksempel 10.13 og 10.14. Kontingenstabel. 
## Er performance i job og træningsprogram uafhængige?

r = 3            # Antal rækker
c = 3            # Antal søjler
# Jeg bruger matrix() til at indlæse data, så jeg lettere kan 
# beregne forventet antal 
O = matrix(c(23, 60, 29, 
             28, 79, 60, 
              9, 49, 63),   # Array med antal observerede
           nrow=r,          # Antal rækker
           ncol=c,          # Antal søjler
           byrow=TRUE       # Data skal læses ind rækkevis (default 
           )                # er søjlevis)
print(O)
n = sum(O)                  # Tjekker, at n = 400

## 1. Hypoteser
# H0: Performance i job og træningsprogram er uafhængige
# H1: Der er ikke uafhængige

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
# Da data er repræsenteret i en matrix kan jeg beregne 
# rækkesummer og søjlesummer som hhv 2x1 og 1x2 matricer
rsum = matrix(rowSums(O), nrow=r)  # Sum af elementer i hver række af O
ssum = matrix(colSums(O), ncol=c)  # Sum af elementer i hver søjle af O
print(rsum)
print(ssum)

# Beregning af forventet antal i matricen E
# E_ij = rsum_i*ssum_j/n
# matrix-multiplikation i R sker med operatoren %*%
E = rsum %*% ssum / n    
print(E)

# Nu er vi klar til at beregne teststørrelsen chi2_0:
chi2_0 = sum((E-O)^2/E)
# chi2_0 = 20.1789

## 5. Konklusion
# Da teststørrelsen chi2_0 = 20.1789 er større end den kritiske 
# grænse chi2_alfa = 3.84, må vi forkaste nulhypotesen. Dermed er 
# der afhængighed mellem hvordan man klarer sig i træningsprogrammet
# og i jobbet.


## Alternativ løsning med R funktionen chisq.test()

res = chisq.test(O, 
           correct=FALSE  # Vi skal undgå, at R laver en korrektion
           )
print(res)
E = res$expected

print(E)
print(O)

chi2_0 = sum((E-O)^2/E)
