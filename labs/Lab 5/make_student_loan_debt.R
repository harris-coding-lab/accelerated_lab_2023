library(tidyverse)
library(readxl)

# CAREFUL with copy paste from pdfs. The quotes "" might change!
# We provide an R script with this code on canvas if you are having trouble.
# (And links to the resulting csv)
student_loan_debt <- 
  read_xlsx("data/area_report_by_year.xlsx", 
            sheet = "studentloan", 
            skip = 3) %>%
  filter(state != "allUS")  %>%
  pivot_longer(cols = -state, 
               names_to = "year", 
               values_to = "per_capita_student_debt") %>% 
  mutate(year = str_sub(year, 4, 7),
         year = as.numeric(year))

write_csv(student_loan_debt, "data/student_loan_debt.csv")