# this is the code from the official carpentries ggplot course
# https://swcarpentry.github.io/r-novice-gapminder/08-plot-ggplot2/index.html


library(ggplot2)
install.packages('gapminder')
library(gapminder)
head(gapminder)

# 6 variables
# country, continent, year, lifeExp, pop, gdpPercap

# 1. scatter plot ----
p <- ggplot(data = gapminder,
            mapping = aes(x = gdpPercap,
                          y = lifeExp))
p <- p + geom_point()
p



# __________ ----

# visualize over time

# 2. color aes (group) ----

# add color as aes

ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     color=continent)) +
  geom_point()

# 3. line (group)
# same aes mapping, but use line instead of scatter
ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     color=continent)) +
  geom_line()



ggplot(data = gapminder,
       mapping = aes(x=year,
                     y=lifeExp,
                     group=country,  # add group
                     color=continent)) +
  geom_line()


# 3. scatter and line ----

ggplot(data = gapminder,
       mapping = aes(x=year,
                     y=lifeExp,
                     group=country,  # add group
                     color=continent)) +
  geom_line() + geom_point()



# __________ ----

# 4. facet ----

americas <- gapminder[gapminder$continent == "Americas",]
ggplot(data = americas, mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45))


# 5. text -----

ggplot(data = americas, mapping = aes(x = year, y = lifeExp, color=continent)) +
  geom_line() + facet_wrap( ~ country) +
  labs(
    x = "Year",              # x axis title
    y = "Life expectancy",   # y axis title
    title = "Figure 1",      # main title of figure
    color = "Continent"      # title of legend
  ) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


# 6. statistics ----
# log transformation, fit a regression line


# 7. save plot ----




