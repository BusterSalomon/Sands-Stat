
# ---- a) Angiv værdien af følgende sandsynligheder:
p_s = 0.1
p_s
p_sc = 1 - p_s
p_sc
p_r_sc = 0.07
p_r_sc
p_rc_sc = 1 - p_r_sc
p_rc_sc

# b)
# Bruger Baye's regel
# Kender sandsynlighederne:
# 1) den udviser det særlige mønster og den er stærk
# 2) den udviser det særlige mønster og den er svag
# Bruger mulitplikationsreglen, og finder intersection. 
# Så sandsynligheden for at den er svag og udviser det særlige mønster, er disse to ganget og det samme med den anden
p_r_s = 0.87
p_r = p_r_sc * p_sc + p_r_s * p_s
p_r

# c)
# P(S|R) = (P(R|S)*P(S))/P(R)
p_s_r = (p_r_s*p_s)/p_r
p_s_r

# d)




