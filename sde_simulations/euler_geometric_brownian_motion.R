sde.sim <- function(t0 = 0,
                    T = 1,
                    X0 = 1,
                    N = 100,
                    drift,
                    sigma) {
  drift <- 1
  sigma <- 1
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

set.seed(123)
X <- sde.sim()
plot(X, main = "geometric Brownian Motion")

