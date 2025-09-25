# install packages from CRAN
p_needed <- c("tidyverse", # tidyverse packages
              "qwraps2"
)
packages <- rownames(installed.packages())
p_to_install <- p_needed[!(p_needed %in% packages)]
if (length(p_to_install) > 0) {
  install.packages(p_to_install)
}
lapply(p_needed, require, character.only = TRUE)
library(qwraps2 )

# Print message
print("All packages installed and loaded")
