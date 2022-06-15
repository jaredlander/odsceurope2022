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
