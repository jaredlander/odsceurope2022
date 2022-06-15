library(ggplot2)
library(dplyr)

# Get Data ####

housing <- readr::read_csv('https://jaredlander.com/data/housing.csv')

house <- housing |>
    select(
        Neighborhood, Class=Building.Classification, Units=Total.Units,
        Year=Year.Built, SqFt=Gross.SqFt,
        Income=Estimated.Gross.Income, Expense=Estimated.Expense,
        Value=Full.Market.Value, Boro
    ) |>
    mutate(ValueSqFt=Value/SqFt)

house

# Scatterplot ####

ggplot(house)
ggplot(house, aes(x=SqFt, y=ValueSqFt))
ggplot(house, aes(x=SqFt, y=ValueSqFt)) + geom_point()

## Add Coolor ####

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Year)) + geom_point()
ggplot(house, aes(x=SqFt, y=ValueSqFt)) + geom_point(aes(color=Year))

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) + geom_point()

ggplot(house, aes(x=SqFt, y=ValueSqFt)) + geom_point(color='red')
ggplot(house, aes(x=SqFt, y=ValueSqFt)) + geom_point(aes(color=Boro))

## Point Shape and Size ####



