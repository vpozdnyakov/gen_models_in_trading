#' ---
#' title: "Preferential sampling"
#' author: "Vitaliy Pozdnyakov"
#' date: "January 2020"
#' output: pdf_document
#' ---

# ex1.02.R
set.seed(123)
n <- 10000
beta <- 1
K <- 1
x <- rnorm(n)
y <- sapply(x, function(x) max(0, K-exp(beta*x)))

# the true value
K*pnorm(log(K)/beta)-exp(beta^2/2)*pnorm(log(K)/beta-beta)

t.test(y[1:100])
t.test(y[1:1000])
t.test(y)

# ex1.03.R
n <- 10000
beta <-1
K <- 1
x <- rexp(n,rate=0.5)
h <- function(x) (max(0,1-exp(beta*sqrt(x)))+max(0,1-exp(-beta*sqrt(x))))/sqrt(2*pi*x)
y <- sapply(x, h)

# the true value
K*pnorm(log(K)/beta)-exp(beta^2/2)*pnorm(log(K)/beta-beta)

t.test(y[1:100])
t.test(y[1:1000])
t.test(y)