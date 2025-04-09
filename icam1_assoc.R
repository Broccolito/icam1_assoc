library(dplyr)
library(data.table)
library(ggplot2)
library(ggpubr)

geno = fread("genotype_master.csv")
pheno = fread("cdp_phenotyping_master.csv")

icam1 = select(geno, id, ICAM1_rs1799969G)

icam1 = left_join(pheno, icam1, by = "id") |>
  filter(genotype_exclude == 0)

lm(data = icam1, formula = sbp_mean ~ ICAM1_rs1799969G + sex + bmi) |> 
  summary()
