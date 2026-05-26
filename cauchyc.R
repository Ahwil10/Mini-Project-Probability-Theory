n_sims <- 10000
cauchy_samples <- rcauchy(n_sims)
cauchy_cum_mean <- cumsum(cauchy_samples) / (1:n_sims)

plot(1:n_sims, cauchy_cum_mean, type = "l", col = "purple",
     main = "Empirical Mean of Cauchy Distribution",
     xlab = "Number of Realizations (n)", ylab = "Cumulative Mean")
abline(h = 0, col = "red", lty = 2)