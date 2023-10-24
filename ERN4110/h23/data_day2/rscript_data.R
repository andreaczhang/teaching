# some data from the lectures

library(magrittr)
library(haven)

heart <- read_dta("~/Documents/GitHub/teaching/ERN4110/h23/data_day2/heart.dta")
heart
hist(heart$WEIGHT)

# energy11 ----

energy11 <- data.frame(
  energy = c(5260, 5470, 5640, 6180,
             6515, 6805, 6390, 7515,
             7515, 8230, 8770)
)

mean(energy11$energy)
sd(energy11$energy)/sqrt(11)

t.test(energy11$energy)

write_dta(energy11, "~/Documents/GitHub/teaching/ERN4110/h23/data_day2/energy11.dta")



# fev ----
fev <- c(
  2.85, 3.19, 3.50, 3.69, 3.90, 4.14, 4.32, 4.50, 4.80, 5.20,
  2.85, 3.20, 3.54, 3.70, 3.96, 4.16, 4.44, 4.56, 4.80, 5.30,
  2.98, 3.30, 3.54, 3.70, 4.05, 4.20, 4.47, 4.68, 4.90, 5.43,
  3.04, 3.39, 3.57, 3.75, 4.08, 4.20, 4.47, 4.70, 5.00,
  3.10, 3.42, 3.60, 3.78, 4.10, 4.30, 4.47, 4.71, 5.10,
  3.10, 3.48, 3.60, 3.83, 4.14, 4.30, 4.50, 4.78, 5.10
)
fev <- data.frame(fev = fev)
head(fev)
length(fev)

hist(fev$fev)
mean(fev$fev)
sd(fev)
sd(fev$fev)/sqrt(57)

write_dta(fev, "~/Documents/GitHub/teaching/ERN4110/h23/exercise_data/fev.dta")

abline(v = mean(fev$fev), col = 'red', lwd = 4)
abline(v = 3.5, col = 'forestgreen', lwd = 4)
abline(v = 4.1, col = 'forestgreen', lwd = 4)


abline(v = mean(fev$fev)+1, col = 'red', lwd = 2, lty = 'dashed')
abline(v = mean(fev$fev)-1, col = 'red', lwd = 2, lty = 'dashed')

abline(v = mean(fev$fev)+0.2, col = 'red', lwd = 2, lty = 'dashed')
abline(v = mean(fev$fev)-0.2, col = 'red', lwd = 2, lty = 'dashed')


t.test(fev$fev, mu = 3.5)
?t.test

t.test(fev$fev, mu = 4.1)

# blood pressure ----

blood <- data.frame(
  medA = c(95, 96, 108, 87, 113, 98,
           116, 103, 97, 105, 96, 101),
  medB = c(90, 94, 100, 88, 110, 98,
           110, 105, 96, 100, 96, 97)
)
boxplot(blood)
blood$diff <- blood$medA - blood$medB
write_dta(blood, "~/Documents/GitHub/teaching/ERN4110/h23/data_day2/blodtrykksenkende_medA-B.dta")




# pef_82 ----

pef82 <- data.frame(
  pef = c(494, 395, 516, 434, 476,
          557, 413, 442, 650, 433),
  mini_pef = c(512, 430, 520, 428, 500,
               600, 364, 380, 658, 445)
)

boxplot(pef82)

pef82$difference <- pef82$pef - pef82$mini_pef

t.test(pef82$difference)

write_dta(pef82, "~/Documents/GitHub/teaching/ERN4110/h23/data_day2/pef_82.dta")

# pef_83 ----

men <- data.frame(
  pef = c(603, 628, 610, 639, 579, 637, 653, 612, 623, 550),
  gender = 'man'
)
women <- data.frame(
  pef = c(455, 456, 523, 458, 460, 435, 489, 399, 525, 464, 450),
  gender = 'woman'
)
pef_83 <- rbind(men, women)
pef_83
boxplot(pef ~ gender, data = pef_83)

write_dta(pef_83, "~/Documents/GitHub/teaching/ERN4110/h23/exercise_data/pef_83.dta")


# energi ----

lean <- data.frame(
  measurements = c(6.13, 7.05, 7.48, 7.53, 7.48,
                   7.58, 7.90, 8.08, 8.09,
                   8.11, 8.40, 10.15, 10.88),
  group = 'lean'
)
obese <- data.frame(
  measurements = c(8.79, 9.19, 9.21, 9.68,
                   9.69, 9.97, 11.51, 11.85,
                   12.79),
  group = 'obese'
)
energi <- rbind(lean, obese)
boxplot(measurements ~ group, data = energi)

t.test(measurements ~ group, data = energi)

write_dta(energi, "~/Documents/GitHub/teaching/ERN4110/h23/exercise_data/energi.dta")


# sbt_oppg ----

sbt <- data.frame(
  sbt_for = c(
    148, 142, 136, 134, 138,
    140, 132, 144, 128, 170,
    162, 150, 138, 154, 126, 116
  ),
  sbt_ette = c(
    152, 152, 134, 148, 144,
    136, 144, 150, 146, 174,
    162, 162, 146, 156, 132, 126
  )
)

boxplot(sbt)

sbt$diff <- sbt$sbt_ette - sbt$sbt_for

write_dta(sbt, "~/Documents/GitHub/teaching/ERN4110/h23/data_day3/sbt_oppg.dta")

unclass(as.Date('1971-01-01'))

# correlation ----

df <- data.frame(
  x = c(1,2,3,4,5),
  y = c(2,4,6,8,10)
)
df[6,] <- c(10, 3)
plot(df, pch = 18, col = 'red', cex = 2, xlim = c(1,15), y = c(1,15))
cor(df)

cor.test(df$x, df$y)
# cor(df[1:9, ])
cor(df, method = 'spearman')
?cor
cor(df$x, df$y, method = 'spearman')
cor.test(df$x, df$y, method = 'spearman')




# kaffe counts -----

marital_status <- c('Married', 'Divorced, separated, widowed', 'Single')
caffeine <- c('0', '1-150', '151-300', '>300')

coffee_count <- expand.grid(marital_status, caffeine)
coffee_count

coffee_count$n <- c(652, 36, 218,
                    1537, 46, 327,
                    598, 38, 106,
                    242, 21, 67)
coffee_count
colnames(coffee_count) <- c('Marital_status', 'Caffeine', 'N')
coffee_count
write_dta(coffee_count, "~/Documents/GitHub/teaching/ERN4110/h23/data_day6/kaffe.dta")



# trend ----

cb_vgdf <- expand.grid(
  cb = c('yes_cb','no_cb'),
  vgdf = c('never', 'seldom', 'weekly', 'daily_short', 'daily_long')
)

cb_vgdf
cb_vgdf$n <- c(37, 1000,
               27, 462,
               13, 182,
               16, 173,
               15, 103)
cb_vgdf

?expand.grid


# df <- 'chr start end samples
#         1   10   20    2
#         2   4    10    3'
# df <- read.table(text=df, header=TRUE)
# df
# df[rep(seq(nrow(df)), df$samples),]

cb_expand <- cb_vgdf[rep(seq(nrow(cb_vgdf)), cb_vgdf$n),]
cb_expand$id <- 1:nrow(cb_expand)
cb_expand$n <- NULL
rownames(cb_expand) <- NULL
cb_expand
table(cb_expand$cb, cb_expand$vgdf)

write_dta(cb_expand, "~/Documents/GitHub/teaching/ERN4110/h23/data_day6/cb_vgdf.dta")


