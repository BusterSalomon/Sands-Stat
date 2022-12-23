

## Opgave om fjedres oplyste fjederkonstant

mu = 4.0
sigma = 0.1


## a. P(X=4)
P_a = 0           # Da fjederkonstanten er en kontinuert variabel


## b. P(X < 3.7)
P_b = pnorm(3.7, mu, sigma)         # P_b = 0.00135


## c. P(X > 4.1)
P_c = 1 - pnorm(4.1, mu, sigma)     # P_c = 0.1587


## d. Interval med 99% af fjedrene
# Intervallet omkring 4.0 med 99 % af fjedrene har 0.5 % i hver af halerne
# Jeg skal finde x_lav og x_hoej, så 
#   * P(X > x_hoej) = alfa/2 og
#   * P(X < x_lav)  = alfa/2  
# alfa = 0.01. Så er intervallet [x_lav; x_hoej]
alfa = 0.01
x_lav  = qnorm(alfa/2, mu, sigma)
x_hoej = qnorm(1-alfa/2, mu, sigma)
# 99 % intevallet er [3.74; 4.26]

