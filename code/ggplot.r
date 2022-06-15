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

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1)

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1)

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro, shape=Boro)) +
    geom_point()

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(aes(shape=Boro))

## Deal with Overplotting ####

### Opacity ####

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1, alpha=1/3)

### Jittering ####

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_jitter(shape=1, size=1)

### Zoom In ####

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1) +
    xlim(NA, 1000000)

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1) +
    scale_x_continuous(limits=c(NA, 1000000))

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1) +
    coord_cartesian(xlim=c(NA, 1000000))

# Smoothing Line ####

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1) +
    geom_smooth()

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1) +
    geom_smooth() +
    xlim(NA, 1000000)

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1) +
    geom_smooth() +
    coord_cartesian(xlim=c(NA, 1000000))

ggplot(house, aes(x=SqFt, y=ValueSqFt, color=Boro)) +
    geom_point(shape=1, size=1) +
    geom_smooth() +
    xlim(NA, 1000000)

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    geom_smooth(color='black') +
    xlim(NA, 1000000)

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    geom_smooth(aes(color=Boro), se=FALSE) +
    geom_smooth(color='black') +
    xlim(NA, 1000000)
