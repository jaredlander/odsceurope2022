library(dplyr)

# Reading Data ####

housing <- readr::read_csv('https://jaredlander.com/data/housing.csv')

housing

# Selecting Columns ####

housing

housing |> select(Neighborhood)
housing |> select(Neighborhood, Total.Units)

house <- housing |>
    select(
        Neighborhood, Class=Building.Classification, Units=Total.Units,
        Year=Year.Built, SqFt=Gross.SqFt,
        Income=Estimated.Gross.Income, Expense=Estimated.Expense,
        Value=Full.Market.Value, Boro
    )

house

house |> select(Class, Units, Year)

house |> select(2, 3, 4)

house |> select(-Boro)
house |> select(-Boro, -Class)
house |> select(-c(Boro, Class))
house |> select('Boro')

house |> select(where(is.character))

# Slicing Rows ####

house |> slice(5, 10, 12)
house |> tibble::rowid_to_column() |> slice(5, 10, 12)
house |> slice(-1)
house |> head()
house |> slice(1:6)
house |> slice_head(n=6)

# Filtering Rows by Logical Condition ####

house |> filter(Units <= 100)
house |> filter(Units == 100)

house |> filter(Boro == 'Queens')

house |>
    filter(Units <= 100 & SqFt <= 50000)

house |>
    filter(Units > 100 | SqFt > 100000)

house |>
    filter(Boro == 'Queens' & Units >= 100)

house |>
    filter(Boro == 'Queens' | Boro == 'Brooklyn')

house |>
    filter(Boro == 'Queens' | Boro == 'Brooklyn' | Boro == 'Manhattan')

# this does not work
# house |>
#     filter(Boro == 'Queens' | 'Brooklyn' | 'Manhattan')

house |>
    filter(Boro %in% c('Queens', 'Brooklyn', 'Manhattan'))

house |>
    filter(Boro %in% c('Queens', 'Brooklyn', 'Manhattan') & Units <= 100)

# Changing the data.frame ####

house <- house |> select(-Class)
house

house |> mutate(newcol=1)
house

house |> mutate(Value/SqFt)
house |> mutate(ValuePerSqFt=Value/SqFt)

house |>
    mutate(ValuePerSqFt=Value/SqFt) |>
    mutate(Double=ValuePerSqFt*2)

house |>
    mutate(ValuePerSqFt=Value/SqFt, Double=ValuePerSqFt*2)
house <- house |> mutate(ValuePerSqFt=Value/SqFt)
house

house |> mutate(Year - 10)
house |> mutate(Year=Year - 10)
house

# Sorting Data ####

house |> arrange(Value)
house |> arrange(-Value)
house |> arrange(Neighborhood, -Value)

# Counting ####

house |> count(Boro)
house |> count(Boro) |> arrange(-n)
house |> count(Boro, sort=TRUE)

house |> count(Boro, Neighborhood, sort=TRUE)
