#' ---
#' title: "Wiener process"
#' author: "Vitaliy Pozdnyakov"
#' date: "January 2020"
#' output: pdf_document
#' ---

# ex1.06.R
set.seed(123)
N <- 100
T <- 1
Delta <- T/N
W <- numeric(N+1)
t <- seq(0,T, length=N+1)
for(i in 2:(N+1))
  W[i] <- W[i-1] + rnorm(1) * sqrt(Delta)
plot(t,W, type="l", main="Wiener process" , ylim=c(-1,1))