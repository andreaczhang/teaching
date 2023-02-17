# q1

# p(x = 0)
p <- 1/6
p0 <- choose(5, 0)*p^0 * (1-p)^5
p1 <- choose(5, 1)*p^1 * (1-p)^4
p2 <- choose(5, 2)*p^2 * (1-p)^3
p3 <- choose(5, 3)*p^3 * (1-p)^2
p4 <- choose(5, 4)*p^4 * (1-p)^1
p5 <- choose(5, 5)*p^5 * (1-p)^0

p0 + p1 + p2 + p3 + p4 + p5
# visualise
x <- rbinom(10000, size = 5, prob = 1/6)
hist(x, prob = T)


# bs <- hist(x, breaks=seq(-1, 5, by=1), plot=F)$breaks
# probs <- table(cut(x, bs)) / length(x)
probs <- matrix(c(p0,p1,p2,p3,p4,p5), nrow = 1, byrow = T)
probs
colnames(probs) <- 0:5

barplot(probs, ylab="Probability", las=0, main = 'Binomial distribution(n=5,p=1/6)')



# q2
# sensitivity, specificity

sensitivity <- 0.9
specificity <- 0.97
prevalence <- 0.02


ppv <- (sensitivity * prevalence)/(sensitivity*prevalence + (1-specificity)*(1-prevalence))
ppv

npv <- (specificity * (1-prevalence))/((1-specificity) * prevalence + specificity *(1-prevalence) )
npv

# positive cases
P <- 50000 * prevalence

# TP
P*sensitivity



