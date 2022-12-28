

## L�sningsfoslag til opgave 08.21 om fysisk aktivitets indflydelse p�
## 16 personers v�gt

D = read.table("Kap08/8-21.txt", header=TRUE)
vaegtfoer = D$wtbefore
vaegtefter = D$wtafter
# Vi har v�gt f�r og efter fysisk aktivitet for 16 personer. Den i'te
# observation af vaegtfoer og vaegtefter er for samme person, s� de
# er afh�ngige. Vi skal bruge parret t-test. 

d = vaegtfoer - vaegtefter  # d angiver v�gttabet for hver person
n = length(d)


# Vi skal unders�ge om programmet til v�gttab er effektivt. Derfor 
# v�lger jeg en ensidet, h�jre-halet test ('>' i H1). Hvis det sande, 
# forventede v�gttab er < eller = 0, s� virker progrogrammet ikke.
## 1. Hypoteser
# H0: mu_D = delta0 = 0
# H1: mu_D > 0
delta0 = 0

## 2. Signifikansniveau
alfa = 0.01

## 3. Kriterier
# Testst�rrelsen t0 = (d_streg - delta0)/(s_d/sqrt(n))
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
# Da t0 > t_alfa, forkaster vi H0. Programmet bevirker alts� v�gttab.
# p-v�rdi:
p_val = 1 - pt(t0, n-1)
# p-v�rdien er 0.0005, s� vi har st�rkt bevis for at forkaste H0

# Test af antagelser
qqnorm(d)
stem(d)
# Stikpr�vest�rrelsen p� n = 16 er nogenlunde stor. Stem-and-leaf plot
# viser en p�n, nogenlunde symmetrisk fordeling, og normalfordelings-
# plottet er ogs� nogenlunde line�rt. Antagelserne holder, og vi kan 
# stole p� resultatet af hypotestesten.

# Tjek med t.test()
res = t.test(vaegtfoer, vaegtefter,
             alternative="greater",
             mu = 0,
             paired = TRUE)
print(res)
