library(dplyr)
library(data.table)

geno = fread("genotype_master.csv")
pheno = fread("cdp_phenotyping_master.csv")

icam1 = select(geno, id, ICAM1_rs1799969G)

icam1 = left_join(pheno, icam1, by = "id")
