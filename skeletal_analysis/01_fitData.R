rm(list=ls())
pkgs <- c("ggplot2", "dplyr","tidyr","tibble","reshape2", "Seurat", "glmGamPoi", "devil", "nebula")
sapply(pkgs, require, character.only = TRUE)

source("utils.R")

set.seed(12345)

## Input data
dataset_name <- "MuscleRNA"
data_path <- "datasets/seurat_counts_rna.RDS"

if (!(file.exists(paste0("results/", dataset_name)))) {
  dir.create(paste0("results/", dataset_name))
}

input_data <- read_data(dataset_name, data_path)
input_data <- prepare_rna_input(input_data)
#input_data <- prepare_atac_input(input_data)

# RNA analysis #
for (m in c("devil", "nebula", 'glmGamPoi')) {
  de_res <- perform_analysis_rna(input_data, method = m)
  saveRDS(de_res, paste0('results/', dataset_name, '/', m, '_rna', '.RDS'))
}
