set.seed(42)

# Inverse transform function for Cauchy (Standard: mu=0, sigma=1)
inv_transform_cauchy <- function(n, mu = 0, sigma = 1) {
  U <- runif(n, 0, 1)
  x <- mu + sigma * tan(pi * (U - 0.5))
  return(x)
}

# Generate 10,000 samples and compare
n_large <- 10000
my_cauchy <- inv_transform_cauchy(n_large)
r_cauchy <- rcauchy(n_large)

# b) Simulate various sample sizes
n_samples <- c(50, 100, 500, 1000)

for (n in n_samples) {
  sample_data <- inv_transform_cauchy(n)
  
  cat("\nSummary for n =", n, "\n")
  print(summary(sample_data))
  
  # Plotting (we restrict xlim because Cauchy has extreme outliers)
  par(mfrow = c(1, 2))
  
  # Histogram and Density
  hist(sample_data, breaks = 50, freq = FALSE, 
       main = paste("Cauchy Hist & Density (n=", n, ")", sep=""),
       xlim = c(-10, 10), xlab = "x")
  lines(density(sample_data), col = "blue", lwd = 2)
  curve(dcauchy(x), add = TRUE, col = "red", lty = 2, lwd = 2) # True density
  
  # Boxplot
  boxplot(sample_data, main = paste("Boxplot (n=", n, ")", sep=""), outline=FALSE) 
  # Note: outline=FALSE hides extreme outliers to make the box visible
}
par(mfrow = c(1, 1))