set.seed(999)
N <- 100000 # Number of Monte Carlo samples
X_unif <- runif(N, min = 0, max = 10)

# Evaluate the function 10 * exp(-2 * |X - 5|)
Y <- 10 * exp(-2 * abs(X_unif - 5))

# The estimate is the mean of Y
I_estimate <- mean(Y)

# Compare with R's built-in numerical integration for verification
integrand <- function(x) { exp(-2 * abs(x - 5)) }
I_true <- integrate(integrand, lower = 0, upper = 10)$value

cat(sprintf("Monte Carlo Estimate: %f\n", I_estimate))
cat(sprintf("True Integral Value : %f\n", I_true))
# Monte Carlo Visualization Script
set.seed(999)
N <- 5000 # Reduced from 100,000 so the plot renders faster
X_unif <- runif(N, min = 0, max = 10)
Y <- 10 * exp(-2 * abs(X_unif - 5))

# Calculate the running cumulative average of the estimate
running_estimate <- cumsum(Y) / (1:N)
true_integral <- 0.999955

# Set up side-by-side plotting
par(mfrow=c(1,2))

# --- PLOT 1: The Function and the Area ---
x_seq <- seq(0, 10, length.out = 500)
y_seq <- exp(-2 * abs(x_seq - 5))

plot(x_seq, y_seq, type="l", col="blue", lwd=2, 
     main="f(x) and Uniform Sampling", xlab="x", ylab="f(x)")
# Shade the true area under the curve
polygon(c(0, x_seq, 10), c(0, y_seq, 0), col=rgb(0, 0, 1, 0.2), border=NA)

# Plot a small subset of the random Uniform X draws on the x-axis 
# to show how they "scan" the base of the function
points(X_unif[1:150], rep(0, 150), pch="|", col="red")


# --- PLOT 2: The Monte Carlo Convergence ---
# This shows the Law of Large Numbers in action for Problem 3
plot(1:N, running_estimate, type="l", col="purple", lwd=1.5,
     main="Estimate Convergence", xlab="Number of Samples (n)", 
     ylab="Estimated Area", ylim=c(0.8, 1.2))

# Add the true mathematical area as a benchmark
abline(h = true_integral, col="red", lwd=2, lty=2)

# Reset plotting parameters
par(mfrow=c(1,1))