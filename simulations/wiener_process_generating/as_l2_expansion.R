#' ---
#' title: "Wiener process as $L^2$ expansion"
#' author: "Vitaliy Pozdnyakov"
#' date: "January 2020"
#' output: pdf_document
#' ---

#' $$W(t) = \sum_{i=0}^{+\infty} Z_i(\omega)\phi_i(t), 0 \leq t \leq T$$
#' where 
#' $$\phi_i(t) = \frac{2\sqrt{2T}}{(2i+1)\pi} \sin{\frac{(2i+1)\pi t}{2T}}$$
set.seed(2)
phi <- function(i, t, T){
  (2*sqrt(2*T))/((2*i+1)*pi) * sin(((2*i+1)*pi*t)/(2*T))
}
T <- 1
N <- 100
t <- seq(0, T, length = N+1)
W <- numeric(N+1)
n <- 10
Z <- rnorm(n)
for(i in (2:N+1))
  W[i] <- sum(Z*sapply(1:n, function(x) phi(x, t[i], T)))
plot(t, W, type = "l", col = 'black', ylim=c(-1,1))

n <- 50
Z <- rnorm(n)
for(i in (2:N+1))
  W[i] <- sum(Z*sapply(1:n, function(x) phi(x, t[i], T)))
lines(t, W, col = 'red')

n <- 100
Z <- rnorm(n)
for(i in (2:N+1))
  W[i] <- sum(Z*sapply(1:n, function(x) phi(x, t[i], T)))
lines(t, W, col = 'blue')
