

## 4.41, s. 117 om deskriptorer af biomialfordelte variable

# a. Antal krone med 676 møntkast
n = 676
p = 0.5
mu = n*p                 # 338
std = sqrt(n*p*(1-p))    # 676

# b. Antal firere med 720 terningkast
n = 720
p = 1/6
mu = n*p                 # 120
std = sqrt(n*p*(1-p))    # 10

# c. Antal fejl i 600 dele, når 4 % af delene har fejl
n = 600
p = 0.04
mu = n*p                 # 24
std = sqrt(n*p*(1-p))    # 4.8

# d. Antal studerende der ikke kan lide maden blandt 800, 
# når det gælder for 65 %, at de ikke kan lide maden
n = 800
p = 0.65
mu = n*p                 # 520
std = sqrt(n*p*(1-p))    # 13.49

