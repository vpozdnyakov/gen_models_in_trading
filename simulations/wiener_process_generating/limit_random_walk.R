#' ---
#' title: "Wiener process as the limit of a random walk"
#' author: "Vitaliy Pozdnyakov"
#' date: "January 2020"
#' output: pdf_document
#' ---

#' $$W(t) = \frac{S_{[nt]}}{\sqrt n}$$
#' where
#' $$S_n = X_1 + \dots + X_n$$
set.seed(1)
n <- 10
T <- 1
t <- seq(0, 1, length=100)
S <- cumsum(2*(runif(n)>0.5)-1)
W <- numeric(100)
for(i in (2:100))
  W[i] <- ifelse(t[i]*n > 0, S[t[i]*n] / sqrt(n), 0)
palette(rainbow(6))
plot(t, W, type = "l", ylim = c(-1, 1), col=palette()[1])

n <- 100
S <- cumsum(2*(runif(n)>0.5)-1)
W <- numeric(100)
for(i in (2:100))
  W[i] <- ifelse(t[i]*n > 0, S[t[i]*n] / sqrt(n), 0)
lines(t, W, col=palette()[5])

n <- 1000
S <- cumsum(2*(runif(n)>0.5)-1)
W <- numeric(100)
for(i in (2:100))
  W[i] <- ifelse(t[i]*n > 0, S[t[i]*n] / sqrt(n), 0)
lines(t, W, col=palette()[3])

