

## Løsningsfoslag til opgave 08.21 om fysisk aktivitets indflydelse på
## 16 personers vægt

D = read.table("Kap08/8-21.txt", header=TRUE)
vaegtfoer = D$wtbefore
vaegtefter = D$wtafter
# Vi har vægt før og efter fysisk aktivitet for 16 personer. Den i'te
# observation af vaegtfoer og vaegtefter er for samme person, så de
# er afhængige. Vi skal bruge parret t-test. 

d = vaegtfoer - vaegtefter  # d angiver vægttabet for hver person
n = length(d)


# Vi skal undersøge om programmet til vægttab er effektivt. Derfor 
# vælger jeg en ensidet, højre-halet test ('>' i H1). Hvis det sande, 
# forventede vægttab er < eller = 0, så virker progrogrammet ikke.
## 1. Hypoteser
# H0: mu_D = delta0 = 0
# H1: mu_D > 0
delta0 = 0

## 2. Signifikansniveau
alfa = 0.01

## 3. Kriterier
# Teststørrelsen t0 = (d_streg - delta0)/(s_d/sqrt(n))
# er t-fordelt med n-1 frihedsgrader
# Vi forkaster H0, hvis t0 > t_alfa, hvor
t_alfa = qt(1-alfa, n-1)
# t_alfa = 2.6025

## 4. Beregninger
d_streg = mean(d)
s_d = sd(d)
t0 = (d_streg - delta0)/(s_d/sqrt(n))
# t0 = 4.0600

## 5. Konklusion
# Da t0 > t_alfa, forkaster vi H0. Programmet bevirker altså vægttab.
# p-værdi:
p_val = 1 - pt(t0, n-1)
# p-værdien er 0.0005, så vi har stærkt bevis for at forkaste H0

# Test af antagelser
qqnorm(d)
stem(d)
# Stikprøvestørrelsen på n = 16 er nogenlunde stor. Stem-and-leaf plot
# viser en pæn, nogenlunde symmetrisk fordeling, og normalfordelings-
# plottet er også nogenlunde lineært. Antagelserne holder, og vi kan 
# stole på resultatet af hypotestesten.

# Tjek med t.test()
res = t.test(vaegtfoer, vaegtefter,
             alternative="greater",
             mu = 0,
             paired = TRUE)
print(res)
