library(magrittr)

# ex 8, 10, 11 ----

milk <- c(6.3, 6.9, 3.0, 3.8, 4.7, 4.6, 3.0, 3.3, 3.6,
          1.2, 1.1, 3.6, 3.3, 9.4, 5.6, 3.0)

hist(milk)

mean(milk)
median(milk)
sd(milk)


sqrt((15*2.1^2 + 15*1.2^2)/30)

(4.15 - 2.59)/1.71/sqrt(1/8)
pt(2.58, df = 30, lower.tail = F)


# data: normal, skewed ----

x0 <- rnorm(n = 1000, 0, 1)
hist(x0, main = 'Normal (standard) data')
#abline(v = mean(x0), col = 'red', lwd = 2)
#abline(v = median(x0), col = 'blue', lwd = 2)

x0 <- x0 -10
qqnorm(x0, pch = 20, main = 'Q-Q plot: normal data')
qqline(x0, col = 'red', lwd = 2)

# heavy tailed (more likely to take more extreme values)
xt <- rt(n = 1000, df = 5)
hist(xt, breaks = 30, main = 'Student t (heavy tailed) data, df = 5')
qqnorm(xt, pch = 20, main = 'Q-Q plot: heavy tailed data')
qqline(xt, col = 'steelblue', lwd = 2)

# right skewed
x1 <- rbeta(n = 2000, shape1 = 1, shape2 = 10)
hist(x1, main = 'Right skewed data', breaks = 30)
abline(v = mean(x1), col = 'red', lwd = 2)
abline(v = median(x1), col = 'blue', lwd = 2)

qqnorm(x1, pch = 20, main = 'Q-Q plot: right skewed data')
qqline(x1, col = 'steelblue', lwd = 2)


# left skewed
x2 <- rbeta(n = 2000, shape1 = 10, shape2 = 1)
hist(x2, main = 'Left skewed data', breaks = 30)
abline(v = mean(x2), col = 'red', lwd = 2)
abline(v = median(x2), col = 'blue', lwd = 2)

qqnorm(x2, pch = 20, main = 'Q-Q plot: left skewed data')
qqline(x2, col = 'steelblue', lwd = 2)


par(mfrow = c(1, 2))

mean(x1)
mean(x2)
sd(x1)
sd(x2)



# birth ----
# install.packages('haven')
birth <- haven::read_dta(file = './MF9130/stata/data/birth.dta')
birth <- data.table::data.table(birth)
birth
# lwt
hist(birth$lwt, breaks = 20, main = 'LWT: Weight in pounds at last menstrual period')
hist(log(birth$lwt), main = 'log(LWT)')

qqnorm(birth$lwt, pch = 20, main = 'Q-Q plot: LWT')
qqline(birth$lwt, col = 'steelblue', lwd = 2)


# bwt
hist(birth$bwt, breaks = 20, main = 'BWT: Birth weight in grams')

qqnorm(birth$bwt, pch = 20, main = 'Q-Q plot: BWT')
qqline(birth$bwt, col = 'steelblue', lwd = 2)

plot(birth$lwt, birth$bwt)
plot(log(birth$lwt), birth$bwt)
plot(birth$age, birth$bwt)


# lung -----
pef <- haven::read_dta(file = './MF9130/stata/data/PEFH98-english.dta')
pef <- data.table::data.table(pef)
pef

pef$pefsitm %>% hist
pef[gender == 1] # female
pef[gender == 2] # male

pef_f <- pef[gender == 1, pefsitm]
pef_m <- pef[gender == 2, pefsitm]
pef_f %>% hist(breaks = 15, main = 'PEFsitm, female',
               xlim = c(250, 800), ylim = c(0, 10))
pef_m %>% hist(breaks = 15, main = 'PEFsitm, male',
               xlim = c(250, 800), ylim = c(0, 10))

qqnorm(pef_f, pch = 20, frame = F)
qqline(pef_f, col = 'steelblue', lwd = 2)

qqnorm(pef_m, pch = 20, frame = F)
qqline(pef_m, col = 'steelblue', lwd = 2)



# non para tests ----
# x1 <- c(110, 122, 125, 120, 140, 124, 123, 137, 135, 145)
# x2 <- c(125, 115, 130, 140, 140, 115, 140, 125, 140, 135)

x1 <- c(5260, 5470, 5640, 6180, 6390, 6515,
        6805, 7515, 7515, 8230, 8770)

x2 <- c(3910, 4220, 3885, 5160, 5645, 4680,
        5265, 5975, 6790, 6900, 7335)
# one sample: wilcoxon signed rank
# wilcox.test()


# paired sample: wilcoxon matched pairs
wilcox.test(x1,x2, paired = T)
?wilcox.test

# independent two samples: mann-whitney
wilcox.test(x, y)



# log -----

xx <- seq(0, 100, by = 0.1)
xx[1] <- xx[1] + 0.05
head(xx)
xxlog <- log(xx)
plot(xx, xxlog, type = 'l', main = c('Log transformation'),
     xlab = 'X', ylab = 'Log(X)')
abline(h = 0, col = 'red')
# abline(v = 1, col = 'red', 'dashed')
