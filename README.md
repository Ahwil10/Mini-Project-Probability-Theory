# Mini-Project-Probability-Theory
Simulating Bernoulli randomn variables, Monte Carlo aproximation, Cauchy distributions.

**Yachay Tech University | School of Mathematical and Computer Sciences**

This repository contains R scripts and simulation results exploring fundamental concepts in probability and computational statistics. The project focuses on empirical moment convergence, the Inverse Transform method, heavy-tailed distributions, and Monte Carlo integration.

## 📊 Project Overview

The project is divided into three main analytical problems:

### Problem 1: Bernoulli Distributions & The Law of Large Numbers (LLN)
* **Objective:** Simulate independent Bernoulli trials for various probabilities ($P \\in \\{1/3, 2/3, 1/4\\}$) across different sample sizes ($n$ up to 10,000).
* **Technique:** Empirical estimation of population moments (mean and variance) using pseudorandom number generation in R.
* **Results:** The simulations provide a direct visual and numerical proof of the Strong Law of Large Numbers. Cumulative empirical means, initially chaotic due to stochastic noise at low $n$, strictly converge to the theoretical expected values ($P$) as $n \\to \\infty$. 
* **Visuals:** Reference the uploaded plots (e.g., `bernoulli_convergence.png`) to observe the random walk trajectories locking onto the true probabilities.

### Problem 2: Cauchy Distributions & The Inverse Transform Method
* **Objective:** Generate Cauchy-distributed random variables computationally and analyze their asymptotic behavior.
* **Technique:** **Probability Integral Transform**. By uniformly sampling $U \\sim \\text{Uniform}(0,1)$ and applying the inverse Cumulative Distribution Function ($x = \\mu + \\sigma \\tan(\\pi(U - 0.5))$), we accurately modeled a standard Cauchy distribution.
* **Results:** The empirical analysis highlights the breakdown of the Law of Large Numbers. Because the theoretical expected value (first moment) of a Cauchy distribution is undefined (diverges), the empirical mean never stabilizes. The simulation successfully captured the massive, discontinuous jumps caused by extreme outliers, proving the volatile nature of heavy-tailed distributions.
* **Visuals:** Reference the uploaded histograms and cumulative mean plots (e.g., `cauchy_mean_divergence.png`) to observe the extreme variance.

### Problem 3: Monte Carlo Integration
* **Objective:** Estimate the definite integral $I = \\int_{0}^{10} \\exp(-2|x - 5|) dx$ without using analytical antiderivatives.
* **Technique:** **Monte Carlo Expectation Method (LOTUS)**. The integral was mathematically reformulated as an expected value with respect to a Uniform distribution: $I = \\mathbb{E}_f [10 \\exp(-2|X - 5|)]$ where $X \\sim U(0, 10)$. 
* **Results:** By averaging 100,000 stochastic evaluations, the Monte Carlo estimate converged tightly to the true deterministic integral value (approx. 0.9999). This demonstrates how probabilistic uniform sampling can highly accurately approximate complex geometric areas.
* **Visuals:** Reference the uploaded terminal outputs or convergence graphs (e.g., `montecarlo_estimate.png`).

## 🚀 How to Run 

Since these scripts are standard `.R` files, they can be executed natively in the terminal or imported into an IDE like RStudio.

**To run directly from the Bash terminal:**
