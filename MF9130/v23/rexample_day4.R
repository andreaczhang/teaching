# proportiton
prop.test(x = 132, n = 222, p = 0.513)

xx <- rnorm(10000, 0, 1)
sum(xx > 1.96)/length(xx)
sum(xx > 2.43)/length(xx)

# two tailed p-val
pnorm(2.43, 0, 1, lower.tail = F)*2

pnorm(-0.658, 0, 1, lower.tail = T)

sqrt(0.13 * (1-0.13)/1000)
(0.123 - 0.13)/0.0106
# test proportion
binom.test(x = 132, n = 222, p = 0.513)

binom.test(x = 123, n = 1000, p = 0.13, alternative = 'less')
prop.test(x =123, n = 1000, p = 0.13, alternative = 'less')
# prop.test(x =123, n = 1000, p = 0.13, alternative = 'greater')

?binom.test
# risk ratio, RR ----
se <- sqrt((0.0014*(1-0.0014))/92340 + (0.0010*(1 - 0.0010))/87660)
0.0004 - 1.96*0.00016

se <- sqrt(1/132 - 1/92340 + 1/90 - 1/87660)
exp(log(1.392) + 1.96*se)

(132/92340)/(90/87660)

se <- sqrt(1/132 +1/92208 + 1/90 + 1/87570)

exp(log(1.393) - 1.96*se)


sid_table <- matrix(c(90, 87570, 132, 92208), nrow = 2, ncol = 2, byrow = T)
colnames(sid_table) <- c('SID','no SID')
rownames(sid_table) <- c('Girl', 'Boy')
sid_table
install.packages('mosaic')

mosaic::oddsRatio(sid_table, verbose = T)

pchisq(3.84, df = 1, lower = F)
qchisq(0.95, df = 1)

qchisq(0.95, df = 4)
pchisq(9.487, df = 4, lower = F)


