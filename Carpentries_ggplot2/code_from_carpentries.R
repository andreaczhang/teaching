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

p <- ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     color=continent))
p + geom_point()



# 3. line (group)
# same aes mapping, but use line instead of scatter
p <- ggplot(data = gapminder,
       mapping = aes(x = year,
                     y = lifeExp,
                     color=continent))
p + geom_line()



p <- ggplot(data = gapminder,
       mapping = aes(x=year,
                     y=lifeExp,
                     group=country,  # add group
                     color=continent))
p + geom_line()


# 3. scatter and line ----

p <- ggplot(data = gapminder,
       mapping = aes(x=year,
                     y=lifeExp,
                     group=country,  # add group
                     color=continent))
p <- p + geom_line()
p <- p + geom_point()
p




# __________ ----

# 4. facet ----

americas <- gapminder[gapminder$continent == "Americas",]
head(americas)

p <- ggplot(data = americas, mapping = aes(x = year, y = lifeExp))
p <- p + geom_line()
p <- p + facet_wrap( ~ country)
# p <- p + theme(axis.text.x = element_text(angle = 45))
p





# 5. text -----

p <- ggplot(data = americas,
            mapping = aes(x = year, y = lifeExp, color=continent))

p <- p + geom_line()
p <- p + facet_wrap( ~ country)
p <- p + theme(axis.text.x = element_text(angle = 90))
p <- p + labs(
  x = "Year",              # x axis title
  y = "Life expectancy",   # y axis title
  title = "Figure 1",      # main title of figure
  color = "Continent"      # title of legend
)
p



# 6. statistics ----
# log transformation, fit a regression line

p <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
p <- p + geom_point()
p

# this figure has large outliers
# change the scale of units: log_10

p <- ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp))
p <- p + geom_point(alpha = 0.5)
p <- p + scale_x_log10()
p

# fit a regression line on log transformed data
p <- p + geom_smooth(method = 'lm', linewidth = 1.5)
p


# 7. dplyr (filter), pipe ----

gapminder %>%
  # Filter countries located in the Americas
  filter(continent == "Americas") %>%
  # Make the plot
  ggplot(mapping = aes(x = year, y = lifeExp)) +
  geom_line() +
  facet_wrap( ~ country) +
  theme(axis.text.x = element_text(angle = 45))


# with mutate()

gapminder %>%
  # extract first letter of country name into new column
  mutate(startsWith = substr(country, 1, 1)) %>%
  # only keep countries starting with A or Z
  filter(startsWith %in% c("A", "Z")) %>%
  # plot lifeExp into facets
  ggplot(aes(x = year, y = lifeExp, colour = continent)) +
  geom_line() +
  facet_wrap(vars(country)) +
  theme_minimal()


# ____________ ----
# 8. save plot ----




