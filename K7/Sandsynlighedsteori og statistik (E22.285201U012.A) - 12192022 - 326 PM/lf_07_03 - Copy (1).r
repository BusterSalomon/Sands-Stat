## Opgave M&R 7.3 + 7.4 s- 233

## Opgave 7.3
setwd("~/AllanDocs/ECEStat")
D = read.table('Kap07/7-3.txt', header=T)

x = D$Labor

x_streg = mean(x)
s = sd(x)
n = length(x)

alfa = 0.05
t_alfahalve = qt(1-alfa/2, n-1)

E = t_alfahalve * s  * sqrt(1/n)
# Med 95 % sikkerhed er fejlen under 0.3480


## Opgave 7.4: 95 % Konfidensinterval
KI_lav  = x_streg - E
KI_hoej = x_streg + E
# 95% konfidensinterval for mu: [1.5166; 2.2126]


## Ekstra 95% Prædiktionsinterval:
P = t_alfahalve * s  * sqrt(1 + 1/n)
PI_lav  = x_streg - P
PI_hoej = x_streg + P
# 95% konfidensinterval for mu: [-0.6687; 4.3979]
