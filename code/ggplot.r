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

# Small Multiples ####

# Trellis
# Facets

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    geom_smooth(aes(color=Boro), se=FALSE) +
    geom_smooth(color='black') +
    xlim(NA, 1000000) +
    facet_wrap( ~ Boro)

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro), show.legend=FALSE) +
    geom_smooth(aes(color=Boro), se=FALSE, show.legend=FALSE) +
    geom_smooth(color='black') +
    xlim(NA, 1000000) +
    facet_wrap( ~ Boro)

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    geom_smooth(aes(color=Boro), se=FALSE) +
    geom_smooth(color='black') +
    xlim(NA, 1000000) +
    facet_wrap( ~ Boro) +
    theme(legend.position='none')

ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    geom_smooth(aes(color=Boro), se=FALSE) +
    geom_smooth(color='black') +
    xlim(NA, 1000000) +
    facet_wrap( ~ Boro, ncol=1) +
    theme(legend.position='none')


# Themes ####

p <- ggplot(house, aes(x=SqFt, y=ValueSqFt)) +
    geom_point(shape=1, size=1, aes(color=Boro)) +
    geom_smooth(aes(color=Boro), se=FALSE) +
    geom_smooth(color='black') +
    xlim(NA, 1000000) +
    facet_wrap( ~ Boro) +
    theme(legend.position='none')
p

p + theme(legend.position='bottom')

library(ggthemes)

p + theme_economist()
p + theme_economist_white()

p + theme_economist() + scale_color_economist()

p + theme_stata() + scale_color_stata()

p + theme_fivethirtyeight() + scale_color_fivethirtyeight()

p + theme_excel() + scale_color_excel()
p + theme_excel_new() + scale_color_excel_new()

# Histograms and Density Plots ####

ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram()
ggplot(house, aes(x=ValueSqFt)) + geom_histogram(bins=10)
ggplot(house, aes(x=ValueSqFt)) + geom_histogram(bins=50)
ggplot(house, aes(x=ValueSqFt)) + geom_histogram(bins=100)

ggplot(house, aes(x=ValueSqFt)) + geom_histogram(binwidth=15)
ggplot(house, aes(x=ValueSqFt)) + geom_histogram(binwidth=50)

ggplot(house, aes(x=ValueSqFt, color=Boro)) +
    geom_histogram(bins=30)
ggplot(house, aes(x=ValueSqFt, fill=Boro)) +
    geom_histogram(bins=30)

ggplot(house, aes(x=ValueSqFt, fill=Boro)) +
    geom_histogram(bins=30, position=position_dodge())


ggplot(house, aes(x=ValueSqFt, fill=Boro)) +
    geom_histogram(bins=30, show.legend=FALSE) +
    facet_wrap( ~ Boro )

ggplot(house, aes(x=ValueSqFt)) +
    geom_density()
ggplot(house, aes(x=ValueSqFt)) +
    geom_density(fill='grey50')
ggplot(house, aes(x=ValueSqFt)) +
    geom_density(fill='hotpink')

ggplot(house, aes(x=ValueSqFt, fill=Boro)) +
    geom_density(aes(fill=Boro))

ggplot(house, aes(x=ValueSqFt, fill=Boro)) +
    geom_density(aes(fill=Boro), alpha=1/2)

ggplot(house, aes(x=ValueSqFt, fill=Boro)) +
    geom_density(show.legend=FALSE) +
    facet_wrap(~Boro)

ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram(bins=30, aes(y=..density..)) +
    geom_density()

ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram(
        aes(y=..density.., fill=Boro),
        show.legend=FALSE, bins=30, alpha=1/2
    ) +
    geom_density(aes(color=Boro), show.legend=FALSE) +
    facet_wrap(~Boro)

ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram(
        aes(y=..density.., fill=Boro),
        show.legend=FALSE, bins=30, alpha=1/2
    ) +
    geom_density(color='black', show.legend=FALSE) +
    facet_wrap(~Boro)

ggplot(house, aes(x=ValueSqFt)) +
    geom_density(color='black', show.legend=FALSE) +
    geom_histogram(
        aes(y=..density.., fill=Boro),
        show.legend=FALSE, bins=30
    ) +
    facet_wrap(~Boro)

ggplot(house, aes(x=ValueSqFt)) +
    geom_histogram(
        aes(y=..density.., fill=Boro),
        show.legend=FALSE, bins=30
    ) +
    geom_density(color='black', show.legend=FALSE) +
    facet_wrap(~Boro)

# Barplots ####

house |> count(Boro)

ggplot(house |> count(Boro), aes(x=Boro, y=n)) + geom_col()

ggplot(house, aes(x=Boro)) + geom_bar()

ggplot(house, aes(x=Boro)) +
    geom_bar() +
    geom_label(data=house |> count(Boro), aes(y=n, label=n))

ggplot(house, aes(x=Boro)) +
    geom_bar() +
    geom_label(data=house |> count(Boro), aes(y=n+50, label=n))

ggplot(house, aes(x=Boro)) +
    geom_bar() +
    geom_label(data=house |> count(Boro), aes(y=n+50, label=n)) +
    labs(title='Count by Boro', y='Count') +
    theme(plot.title=element_text(hjust=0.5))
