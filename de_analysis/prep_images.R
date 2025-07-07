
rm(list = ls())
require(tidyverse)
require(patchwork)
source("utils_plots.R")
source("utils_supp_plots.R")

method_cellwise <- c("glmGamPoi (cell)", "Devil (base)", "limma", "Nebula")
method_patientwise <- c("Nebula", "Devil (mixed)", "limma", "glmGamPoi (cell)")
method_levels <- c("limma", "glmGamPoi", "glmGamPoi (cell)", "Nebula", "NEBULA", "Devil (mixed)", "Devil (base)", "Devil", "devil")

author = "hsc"
for (author in c("hsc", "kumar", "yazar", "bca")) {
  MCCs_boxplots = plot_MCCs_boxplots(author)
  pvalues_plot = plot_pvalues(author, method_cellwise, method_patientwise)
  MCCs_plot = plot_MCCs(author, method_cellwise, method_patientwise)
  ks_plots = plot_ks(author, method_cellwise, method_patientwise)
  timing_plot = plot_timing(author)

  dir.create(file.path("img/RDS/", author), recursive = TRUE, showWarnings = F)

  saveRDS(MCCs_boxplots, file.path("img/RDS/", author, "MCCs_boxplots.RDS"))
  saveRDS(pvalues_plot, file.path("img/RDS/", author, "pvalues.RDS"))
  saveRDS(MCCs_plot, file.path("img/RDS/", author, "MCCs.RDS"))
  saveRDS(ks_plots, file.path("img/RDS/", author, "ks_test.RDS"))
  saveRDS(timing_plot, file.path("img/RDS/", author, "timing.RDS"))
}

# All methods all together
all_models_plots = plot_all_models()
saveRDS(all_models_plots, file.path("img/RDS/", "all_models.RDS"))
