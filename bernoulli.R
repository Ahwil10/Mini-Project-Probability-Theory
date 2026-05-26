# Parameters
probs <- c(1/3, 2/3, 1/4)
n_sizes <- c(10, 500, 1000, 10000)
max_n <- max(n_sizes)

# Set up plotting area (1 row, 3 columns)
par(mfrow = c(1, 3))

for (p in probs) {
  # 1. Generate max_n Bernoulli realizations
  set.seed(123) # For reproducibility
  X <- rbinom(max_n, size = 1, prob = p)

  # Calculate empirical mean and variance for specific n
  cat(sprintf("\n--- Results for P = %.3f ---\n", p))
  for (n in n_sizes) {
    sample_n <- X[1:n]
    emp_mean <- mean(sample_n)
    emp_var <- var(sample_n) # R's var() uses 1/(n-1)
    cat(sprintf("n = %-5d | Emp Mean: %.4f (True: %.4f) | Emp Var: %.4f (True: %.4f)\n",
                n, emp_mean, p, emp_var, p*(1-p)))
  }

  # 2. Display the empirical mean as a function of the number of realizations
  cumulative_mean <- cumsum(X) / (1:max_n)

  plot(1:max_n, cumulative_mean, type = "l", col = "blue",
       xlab = "Number of realizations (n)",
       ylab = "Empirical Mean",
       main = paste("Convergence for P =", round(p, 2)),
       ylim = c(0, 1))
  # Add a line for the true probability
  abline(h = p, col = "red", lwd = 2, lty = 2)
}

# Reset plotting area
par(mfrow = c(1, 1))
