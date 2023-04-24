library(ggplot2)

library(gapminder)
data("gapminder")
gapminder

# first plot ----

ggplot(data = gapminder,
       mapping = aes(x = gdpPercap,
                     y = lifeExp)) + geom_point()



# assign a variable
plt <- ggplot(data = gapminder,
              mapping = aes(x = gdpPercap,
                            y = lifeExp))
plt2 <- plt + geom_point()

plt
plt2



# year vs life exp ----
# base R plot
# plot(gapminder$year, gapminder$lifeExp)

# ggplot2
plt <- ggplot(data = gapminder,
              mapping = aes(x = year,
                            y = lifeExp))
plt2 <- plt + geom_point()


# year vs life exp, continent

plt <- ggplot(data = gapminder,
              mapping = aes(x = year,
                            y = lifeExp,
                            color = continent))
plt2 <- plt + geom_point()
plt2


# install.packages('RColorBrewer')
library(RColorBrewer)

plt2 + scale_color_brewer(palette = 'Blues')

plt3 <- plt2 + scale_color_brewer(palette = 'Dark2')
plt3


# line ----

plt <- ggplot(data = gapminder,
              mapping = aes(x = year,
                            y = lifeExp,
                            group = country,
                            color = continent))
plt + geom_line()

# line + scatter ----

plt <- ggplot(data = gapminder,
              mapping = aes(x = year,
                            y = lifeExp,
                            group = country,
                            color = continent))
plt + geom_line() + geom_point()


# ex 1 ----
# life exp vs gdp

plt <- ggplot(data = gapminder,
              mapping = aes(y = gdpPercap,
                            x = lifeExp))
plt2 <- plt + geom_point()
plt2






# ex 2 ----
# population vs year
str(gapminder)

head(gapminder)

plt <- ggplot(data = gapminder,
              mapping = aes(x = year,
                            y = pop,
                            group = country,
                            color = continent))
plt + geom_line()



# facets ----
# filter americas data

americas <- gapminder[gapminder$continent == 'Americas', ]
americas
head(americas)

# how many countries in americas
# what countries in americas
unique(americas$country)


plt <- ggplot(data = americas,
              mapping = aes(x = year,
                            y = lifeExp))
plt2 <- plt + geom_line()
plt2 + facet_wrap( ~ country)


gapminder$continent
unique(gapminder$continent)

# europe
europe <- gapminder[gapminder$continent == 'Europe', ]
unique(europe$country)

plt <- ggplot(data = europe,
              mapping = aes(x = year,
                            y = lifeExp))
plt <- plt + geom_line()
plt <- plt + facet_wrap( ~ country)
plt <- plt + theme(axis.text.x = element_text(angle = 90))


plt <- plt + labs(
  x = "Years",
  y = "Life expectancy",
  title = "Figure 1"
)
plt
plt + theme(axis.title = element_text(size = 25))
plt + theme(axis.text.x = element_text(size = 3))



# change size ----
# both axes
p + theme(axis.text = element_text(size = 15))

# this changes x axis text size
plt + theme(axis.text.x = element_text(size = 15))

# axis title size
p + theme(axis.title = element_text(size = 15))

# title text size
plt + theme(plot.title = element_text(size = 20))

# facet size
plt + theme(strip.text = element_text(size = 20))

plt + theme_bw()
plt + theme_minimal()


# transformation ----

plt <- ggplot(data = gapminder,
              mapping = aes(x = gdpPercap,
                            y = lifeExp))
plt <- plt + geom_point()
# plt + scale_y_log10()
plt <- plt + scale_x_log10()
plt <- plt + geom_smooth(
  method = 'lm', linewidth = 3
)
plt

?ggsave


au_subset <- gapminder[gapminder$country == 'Australia', ]
au_subset

write.csv(au_subset,
          file = 'australia.csv',
          sep = ",")


