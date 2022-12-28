

# Opgave 3.79, s. 90 
# En testmetode for rust i kølesystem på a-kraftværk. 
# Hændelser:
# R: Der er rust
# T: Testen siger, der er rust

# Oplysniger fra opgaven:
# Testen detekterer rust korrekt i 70 % af tilfældene
P_T_givet_R = 0.7
# Testen siger der er rust, selvom der ikke er i 20 % af tilfældene:
P_T_givet_Rc = 0.2
# Sandsynligheden for rust, før der laves test, er 10 %:
P_R = 0.1

# a. Sandsynligheden for rust, givet at testen er positiv. 
# Vi bruger Bayes:
# P(R|T) = P(T|R)*P(R)/P(T)
# Vi har alle sandsynlighederne, bortset fra P(T). Den kan regnes
# Med reglen om den totale sandsynlighed:
# P(T) = P(T|R)*P(R) + P(T|Rc)*P(Rc)
# Her har vi også alle sandsynligheder, bortset fra P(Rc), men som
# følge af reglen om komplementærhændelse har vi:
# P(Rc) = 1 - P(R)
# Nu kan det hele samles:
# P(R|T) = P(T|R)*P(R)/(P(T|R)*P(R) + P(T|Rc)*(1 - P(R)))
P_R_givet_T = P_T_givet_R*P_R/(P_T_givet_R*P_R + P_T_givet_Rc*(1-P_R))
# P(R|T) = 0.28

# b
# Vi bruger igen Bayes:
# P(R|Tc) = P(Tc|R)*P(R)/(P(Tc|R)*P(R) + P(Tc|Rc)*(1 - P(R)))
# Vi mangler P(Tc|R), men den beregnes som (1 - P(T|R))
# P(R|Tc) = (1-P(T|R))*P(R)/((1-P(T|R))*P(R) + (1-P(T|Rc))*(1 - P(R)))
P_R_givet_Tc = (1-P_T_givet_R)*P_R/((1-P_T_givet_R)*P_R + (1-P_T_givet_Rc)*(1-P_R))
# P(R|Tc) = 0.04
  


