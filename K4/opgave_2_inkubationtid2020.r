## Hvor stor en andel af smittede vil have en inkubationstid på under 7 døgn?
inku_7 <- 7 # Inkubationstid, der ønskes undersøgt
log_inku_7 <- log(inku_7) # Bemærk at i R er log() den naturlige logaritme.
# Variablen log_inku_7 = 1.9459 er den naturlige logaritme til inkubationstiden.

# Vi får at vide, at den naturlige logaritme til inkubationstiden følger en
# normalfordeling med mu = 1.6198 og standardafvigelse sigma = 0.4387
mu <- 1.6198 # Middelværdi
sigma <- 0.4387 # Standardafvigelse

andel_inku_under_7 <- pnorm(log_inku_7, mu, sigma)
# andel_inku_under_7 = 0.7714
# 77 pct af smittede vil have udvist Covid-19 symptomer efter en uge.

# a) Hvor stor en andel af smittede vil have en inkubationstid på over 14 døgn?
inku_14 <- 14 # Inkubationstid, der ønskes undersøgt
log_inku_14 <- log(inku_14)
andel_inku_under_14 <- pnorm(log_inku_14, mu, sigma)
andel_inku_over_14 <- 1 - andel_inku_under_14
andel_inku_over_14
# 99 pct af smittede vil have udvist Covid-19 symptomer efter to uger.
# dermed 1 pct vil ikke.

# b) Forskergruppen beregnede medianen for inkubationstiden til 5.1 døgn. M.a.o. vil halvdelen af
# Covid-19 smittede udvikle symptomer inden der er gået 5.1 døgn. Udregn medianen for
# inkubationstiden og oplys resultatet.

# først skal vi finde medianen på den logaritmiske skala og i en normal fordeling
# er den det samme som middelværdien dermed kan vi bare tage exp(mu)
exp(mu)
# exp(mu) = 5.05208 afrundet til 5.1

# c) 95% udvist symmptomer

# her kan vi bruge den inverse normal fordeling med p=0.95
exp(qnorm(0.95, mu, sigma))
# efter 10.4 dage afrundet til et decimal har 95% udvist symptomer

# d) empiriske interval
højt <- mu + 3 * sigma
lavt <- mu - 3 * sigma
pnorm(højt, mu, sigma) - pnorm(lavt, mu, sigma)
exp(lavt) # fra dag 1.4
exp(højt) # til dag 18.8 interval vil 99.7% udvise symptomer
