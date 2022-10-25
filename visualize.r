# Import country information from csv files
country_information <- read.csv("country_information.csv")

# Import information about total cases and total deaths of each country from csv files
data <- read.csv('total_cases_total_deaths.csv')

# Divide into 2 data frames and merge with the country information for visualize
total_cases_beta <- merge(data[,1:3], country_information)
total_cases <- total_cases_beta[total_cases_beta$total_cases != 'NULL', ]

total_deaths_beta <- merge(data[, c(1,2,4)], country_information)
total_deaths <- total_deaths_beta[total_deaths_beta$total_deaths != 'NULL', ]


# Plot the total_cases along with:
  # population
plot(x = total_cases$population/10^6, y = total_cases$total_cases/10^6,xlab = 'Population (million)', ylab='Total cases (million)')