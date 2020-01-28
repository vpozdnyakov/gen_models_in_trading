#' ---
#' title: "Geometric Brownian motion generating"
#' author: "Vitaliy Pozdnyakov"
#' date: "January 2020"
#' output: pdf_document
#' ---

#' $$S(t) = x \exp{\left\{\left(r - \frac{\sigma^2}{2}\right)t + \sigma W(t)\right\}}, t>0$$

T <- 1
n <- 100
delta <- 1/n
t <- seq(0, T, length = n)
W <- numeric(n)
for (i in 2:n) {
  W[i] <- W[i-1] + sqrt(delta) * rnorm(1)
}
x = 10
sigma = 0.5
r = 1
S = x * exp((r - sigma^2/2)*t + sigma*W)
plot(t, S, type = 'l')
