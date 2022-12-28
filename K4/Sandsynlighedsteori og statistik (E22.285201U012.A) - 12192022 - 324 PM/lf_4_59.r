

# 4.59, s. 125 (Poisson)
# P� et samleb�nd produceres i snit 2 varer per minut
lambda = 2

# a. Der produceres h�jst 3 i 1 minut
ppois(3,lambda)                # 0.8571

# b. mindst 2 i 3 minutter
1 - ppois(1, 3*lambda)         # 0.9826

# c. h�jst 20 i 5 minutter
ppois(20, 5*lambda)            # 0.9984