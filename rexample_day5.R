library(magrittr)
x0 <- rnorm(n = 1000, 0, 1)
hist(x0, main = 'Normal (standard) data')
#abline(v = mean(x0), col = 'red', lwd = 2)
#abline(v = median(x0), col = 'blue', lwd = 2)

qqnorm(x0, pch = 20, main = 'Q-Q plot: normal data')
qqline(x0, col = 'steelblue', lwd = 2)

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



# birth
install.packages('haven')
birth <- haven::read_dta(file = './MF9130/stata/data/birth.dta')
birth <- data.table::data.table(birth)
birth
hist(birth$lwt, breaks = 20, main = 'LWT: Weight in pounds at last menstrual period')
hist(log(birth$lwt))

hist(birth$bwt, breaks = 20, main = 'BWT: Birth weight in grams')

plot(birth$lwt, birth$bwt)
plot(log(birth$lwt), birth$bwt)
plot(birth$age, birth$bwt)


# lung
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



