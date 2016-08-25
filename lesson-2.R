## Tidy data concept

counts_df <- data.frame(
  day = c("Monday", "Tuesday", "Wednesday"),
  wolf = c(2, 1, 3),
  hare = c(20, 25, 30),
  fox = c(4, 4,4)
)

## Reshaping multiple columns in category/value pairs

library(tidyr)
counts_gather <- gather(counts_df, 
                        key = "species",
                        value = "count",
                        wolf:fox)

counts_spread <- spread(counts_gather,
                        key = species,
                        value = count,
                        fill = 0
                    )

## Exercise 1

counts_gather <- counts_gather[-2, ]

## Read comma-separated-value (CSV) files

surveys <- read.csv("data/surveys.csv", na.strings = "")

## Subsetting and sorting

library(dplyr)
surveys_1990_winter <- filter(surveys,
                              year == 1990,
                              month %in% 1:3)


surveys_1990_winter <- select(surveys_1990_winter, record_id, month, day, species_id, sex, hindfoot_length, weight)

sorted <- ...(surveys1990_winter, ...)

## Exercise 2

surveys_1990_winter <- filter(surveys,
                              species_id == "RO")
surveys_1990_winter <- select(surveys_1990_winter, record_id, sex, weight)
select(filter(surveys, species_id == "RO"), record_id,sex, weight)

## Grouping and aggregation

surveys_1990_winter_gb <- group_by(surveys_1990_winter, species_id)

counts_1990_winter <- summarize(surveys_1990_winter_gb, count = n())

## Exercise 3

surveys_DM <- filter(surveys, species_id == "DM")
surveys_DM <- group_by(surveys_DM, month)
summarize(surveys_DM, avg_wt = mean(weight, na.rm = T), avg_hft = mean(hindfoot_length, na.rm = T))



## Transformation of variables

prop_1990_winter <- mutate(counts_1990_winter, prop = count / sum(count))

## Exercise 4

surveys_1990_winter <- filter(surveys_1990_winter_gb, weight == min (weight))

# alternative way
surv_grp <- group_by(surveys_1990_winter, species_id)
filter(surv_grp, weight == min(weight, na.rm = T))

mutate(surv_grp, rank = row_number(hindfoot_length))

# row_number gives you ranking

## Chainning with pipes

prop_1990_winter_piped <- surveys %>% # runs the function on the left values
  filter(year == 1990, month %in% 1:3) %>%
  select(-year) %>%
  group_by(species_id) %>%
  summarize(count = n()) %>%
  mutate(prop = count/sum (count))
  
  ... # select all columns but year
  ... # group by species_id
  ... # summarize with counts
  ... # mutate into proportions
