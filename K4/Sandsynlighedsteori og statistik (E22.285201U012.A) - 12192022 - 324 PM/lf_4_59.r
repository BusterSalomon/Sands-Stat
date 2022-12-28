

# 4.59, s. 125 (Poisson)
# På et samlebånd produceres i snit 2 varer per minut
lambda = 2

# a. Der produceres højst 3 i 1 minut
ppois(3,lambda)                # 0.8571

# b. mindst 2 i 3 minutter
1 - ppois(1, 3*lambda)         # 0.9826

# c. højst 20 i 5 minutter
ppois(20, 5*lambda)            # 0.9984