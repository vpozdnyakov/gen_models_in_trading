sim <- function(t0 = 0, T = 1, X0 = 0, N = 100, drift, sigma) {
  Z <- rnorm(N)
  X <- numeric(N + 1)
  Dt <- (T - t0) / N
  X[1] <- X0
  
  for (i in 1:N)
    X[i + 1] <- X[i] + drift * X[i] * Dt +
                sigma * X[i] * sqrt(Dt) * Z[i]
  
  X <- ts(X, start = t0 , deltat = Dt)
  invisible(X)
}

dcBS <- function(x, t, x0, drift, sigma) {
  ml <- log(x0) + (drift - sigma^2 / 2) * t
  sl <- sqrt(t) * sigma
  lik <- dlnorm(x,
                meanlog = ml,
                sdlog = sl,
                log = TRUE)
}

BS.lik <- function(drift , sigma) {
  n <- length(X)
  dt <- deltat(X)
  - sum(dcBS(
    x = X[2:n],
    t = dt,
    x0 = X[1:(n - 1)],
    drift = drift, 
    sigma = sigma
  ))
}

set.seed(123)
X <- sde.sim(drift = 0.5, sigma = 1, N=10000)
plot(X, main = "geometric Brownian Motion")

fit <-
  mle(
    BS.lik,
    start = list(drift = 0.1, sigma = 0.1),
    method = "L-BFGS-B",
    lower = c(0.01, 0.01)
  )

fit
