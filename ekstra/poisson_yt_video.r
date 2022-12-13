# https://www.youtube.com/watch?v=cPOChr_kuQs
# Average of 12 sales pr day, mean=12
# Propability of 10
a = dpois(10, 12)
a

# Probability for 10 or more
b = 1 - ppois(9, 12)
b

# Poisson assume that the number of events are evenly distributed our a time interval
# Them the sales pr hour is simply the sales pr day divided by 24
# That is 24/12=0.5
# Then the propability of more than one sales within the firts hour is
c = 1 - ppois(1, 0.5)
c
