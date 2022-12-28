## Opgave om st�lbj�lker med metaltr�thed


## Oplyst i opgaven: 
# S: H�ndelsen at bj�lken er svag
# R: H�ndelsen at bj�lken udviser det s�rlige m�nster ved scanning
p_R_givet_S = 0.87      
# P(R|S) = 0.87, da 87 pct. af de svage (S) viser m�nsteret R
p_Rc_givet_S = 1 - p_R_givet_S 
# P(Rc|S) = 0.13. Vi ser kun p� de svage (givet S). Af dem viser 87 pct. 
# m�nsteret, s� resten (13 pct) viser det ikke


## a
p_S = 0.1               
# P(S) = 0.10, da 10 pct af st�lbj�lkerne er svage (S)
p_Sc = 1 - p_S        
# P(Sc) = 0.90, da resten (90 pct) er st�rke
p_R_givet_Sc = 0.07    
# P(R|Sc) = 0.07, da 7 pct. af de st�rke (Sc) viser m�nsteret R
p_Rc_givet_Sc = 1 - p_R_givet_Sc
# P(Rc|Sc) =  0.93. Vi ser kun p� de st�rke (givet Sc). Af dem viser 7 pct 
# m�nsteret, s� resten (93 pct) viser det ikke.


## b 
# Vi bruger reglen om den totale sandsynlighed
# P(R) = P(R|S)*P(S) + P(R|Sc)*P(Sc)
p_R = p_R_givet_S*p_S + p_R_givet_Sc*p_Sc
# P(R) = 0.15


## c
# P(S|R) = P(R|S)*P(S)/P(R) (Bayes)
p_S_givet_R = p_R_givet_S * p_S / p_R
# P(S|R) = 0.58


## d
# P(S|Rc) = P(Rc|S)*P(S)/P(Rc) (Bayes)
#         = (1 - P(R|S))*P(S)/(1 - P(R))
p_S_givet_Rc = (1 - p_R_givet_S) * p_S / (1 - p_R)
# P(S|Rc) = 0.0153

