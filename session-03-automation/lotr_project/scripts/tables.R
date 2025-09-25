## import clean data
lotr_dat <- read_tsv("./session-03-automation/lotr_project/data/processed/lotr_clean.tsv") %>% 
  # reorder Species based on words spoken
  mutate(Species = reorder(Species, Words, sum))

View(lotr_dat)

# Can you add a new script that creates a summary table of the words spoken by Species
# and Film and saves it to the `outputs/tables/` folder? You can use the `dplyr` package to
# create the summary table and the `write_tsv()` function to save it as a .tsv file. 
# Don't forget to source your new script in the `Makefile.R` script.

words_data_summary_table <- lotr_dat |>
  group_by(Film, Species) |>
  summarize(
    Characters = n(), words_spoken = sum(Words),
    .groups = "drop")

words_data_table <- summary_table(
  lotr_dat |>
    group_by(Film, Species) |>
    summarize(words_spoken = sum(Words), .groups = "drop")
)  

print(words_data_table)

write_tsv(words_data_summary_table, file = "./session-03-automation/lotr_project/data/processed/words_by_film_and_species.tsv")

View(words_data)

