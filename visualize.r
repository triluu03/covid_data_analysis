# Import country information from csv files
country_information <- read.csv("country_information.csv")

# Import information about total cases and total deaths of each country from csv files
data <- read.csv('total_cases_total_deaths.csv')

# Divide into 2 data frames and merge with the country information for visualize
total_cases_beta <- merge(data[,1:3], country_information)
total_cases <- total_cases_beta[total_cases_beta$total_cases != 'NULL', ]

total_deaths_beta <- merge(data[, c(1,2,4)], country_information)
total_deaths <- total_deaths_beta[total_deaths_beta$total_deaths != 'NULL', ]


# Colors according to the continents
color <- as.factor(total_cases$continent)
levels(color) <- c('red', 'green', 'blue', 'black', 'violet', 'yellow')

# Plot the total cases along with:
  # population
plot(
  x = total_cases$population, 
  y = total_cases$total_cases,
  xlab = 'Population', 
  ylab = 'Total cases', 
  main = 'Total Cases ~ Population',
  log='xy',
  col = as.vector(color),
  pch = 16
)
legend('topleft', legend = levels(as.factor(total_cases$continent)), col = levels(color), pch = 20)
  

# Plot the total deaths along with:
  # population
plot(
  x = total_deaths$population,
  y = total_deaths$total_deaths,
  xlab = 'Population',
  ylab = 'Total Deaths',
  main = 'Total Deaths ~ Population',
  log = 'xy',
  col = as.vector(color),
  pch = 16
)
legend('topleft', legend = levels(as.factor(total_cases$continent)), col = levels(color), pch = 20)