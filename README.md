# devil reproducibility repo

Repository containing the code to reproduce the scRNAseq differential expression analysis made using devil statistical tool

**Public datasets**

1) PBMC dataset (~160k cells) published by [Hao et al. (2021) Cell](https://doi.org/10.1016/j.cell.2021.04.048)
2) Human liver dataset (~170k cells) published by [Guilliams et al. (2022) Cell](https://doi.org/10.1016/j.cell.2021.12.018)
3) Human Muscle dataset (~130k nuclei), published by [Lai et al. (2024) Nature](https://doi.org/10.1038/s41586-024-07348-6)
4) Pancreas dataset (~8k cells), published by [Baron et al (2022) Cell Systems](https://doi.org/10.1016/j.cels.2016.08.011)
5) Breast cell atlas (~800k cells), published by [Reed et al (2024) Nat Genet](https://doi.org/10.1038/s41588-024-01688-9)
6) Immune system dataset across organs (~600k cells), published by [Suo et al. (2022) Science](https://doi.org/10.1126/science.abo0510)
7) Blood dataset (~1.3 million cells), published by [Yazar et al. (2022) Science](https://doi.org/10.1126/science.abf3041)
8) Breast dataset (~700k cells), published by [Kumar et al. (2023) Nature](https://doi.org/10.1038/s41586-023-06252-9)
9) Human liver dataset (~8k cells), published by [MacParland et al. (2018) Nat Comm](https://doi.org/10.1038/s41467-018-06318-7)
10) PBMC dataset (~45k cells), published by [Lee et al. (2020) Science Immunology](https://doi.org/10.1126/sciimmunol.abd1554)
11) Macaque brain (~2.5 million cells), published by [Chiou et al. (2020) Science Advances](https://www.science.org/doi/10.1126/sciadv.adh1914)
12) Healthy human blood (~1.9 million cells), published by [Terekhova et al. (2023) Immunity](https://www.sciencedirect.com/science/article/pii/S1074761323004533?via%3Dihub)

**Dataset Table**

| | Dataset name | Tissue | Cells | Cell-types | Genes | Samples | Access |
| --- | --- | --- | --- | --- | --- | --- | --- |
| 1. | Big Blood | Blood | 161,764 | 8 | 11,929 | 8 | [CELLxGENE](https://cellxgene.cziscience.com/collections/b0cf0afa-ec40-4d65-b570-ed4ceacc6813) |
| 2. | Big Liver | Liver | 167,598 | 14 | 11,712 | 19 | [CELLxGENE](https://cellxgene.cziscience.com/collections/74e10dc4-cbb2-4605-a189-8a1cd8e44d8c) |
| 3. | HLMA | Skeletal muscle | 126,124 | 2 | 16,489 | 22 | [HLMA](https://db.cngb.org/cdcp/hlma/) |
| 4. | Baron Pancreas | Pancreas | 8,569 | 14 | 20,125 | 4 | [Original paper](https://pubmed.ncbi.nlm.nih.gov/27667365/) |
| 5. | Bca | Breast | 800,198 | 15 | 34,535 | 54 | [CELLxGENE](https://cellxgene.cziscience.com/collections/48259aa8-f168-4bf5-b797-af8e88da6637) |
| 6. | Hsc | Multiple | 589,390 | 47 | 33,145 | 25 | [CELLxGENE](https://cellxgene.cziscience.com/collections/b1a879f6-5638-48d3-8f64-f6592c1b1561) |
| 7. | Yazar | Blood | 1,248,980 | 29 | 36,571 | 981 | [CELLxGENE](https://cellxgene.cziscience.com/collections/dde06e0f-ab3b-46be-96a2-a8082383c4a1) |
| 8. | Kumar | Breast | 714,331 | 39 | 33,145 | 126 | [CELLxGENE](https://cellxgene.cziscience.com/collections/4195ab4c-20bd-4cd3-8b3d-65601277e731) |
| 9. | Small liver | Liver | 8,444 | 15 | 32,839 | 5 | [Original paper](https://www.nature.com/articles/s41467-018-06318-7) |
| 10. | Small blood | Blood | 43,512 | 25 | 21,966 | 12 | [CELLxGENE](https://cellxgene.cziscience.com/e/4c4cd77c-8fee-4836-9145-16562a8782fe.cxg/) |
| 11. | Adult macaque brain | Brain | 2,583,967 | 14 | 19,147 | 5 | [CELLxGENE](https://cellxgene.cziscience.com/collections/8c4bcf0d-b4df-45c7-888c-74fb0013e9e7) |
| 12. | Healthy human blood | Blood | 1,003,209 | 9 | 36,601 | 166 | [HUman Cell Atlas](https://explore.data.humancellatlas.org/projects/896f377c-8e88-463e-82b0-b2a5409d6fe4) |



**Timing scaling**

The `timing_scaling` folder contains the code to assess devil performance against glmGamPoi in terms of computational efficiency, using both GPU and CPU versions.
The required datasets, i.e. datasets number 4 and 11, must be downloaded into the `timing_scaling/datasets` folder.
The results can be obtained by running the bash scripts in the `timing_scaling/bash_scripts` folder which will ultimately call the scripts stored in `timing_scaling/scripts`.
The results can be visualized and summarized using the R scripts in the `timing_scaling` folder.

**Synthetic datasets**

The `de_analysis` folder contains the code to assess DE tools' performance on artificially altered datasets.
The required datasets, i.e. datasets number 5, 6, 7, and 8, must be downloaded into the `de_analysis/nullpower/datasets` folder.
The results can be obtained by running the bash scripts in the `de_analysis/nullpower/bash_scripts` folder which will ultimately call the `de_analysis/nullpower/run_models.R` script.
The results then need to be parsed running the `de_analysis/nullpower/parse_results.R` script and then visualized and summarized using the `de_analysis/prep_images.R` and `de_analysis/prep_tables.R` scripts.

**Cell type analysis**

The `cell_types_analysis` folder contains the code to reproduce the cell type classification analysis through DE gene markers identification.
The required datasets, i.e. datasets number 1, 2, 9, and 10, must be downloaded into the `cell_types_analysis/datasets` folder.
The results can be obtained by running the bash script `cell_types_analysis/run_fit.sh` and then visualizations prepared using the `cell_types_analysis/run_plot.sh` script.

**Skeletal muscle analysis**

The `skeletal_analysis` folder contains the code to reproduce the skeletal muscle DE analysis.
The required dataset, i.e. dataset number 3, must be downloaded into the `cell_types_analysis/datasets` folder.
The results can be obtained by running `skeletal_analysis/run_rna.sh` first and then `skeletal_analysis/run_analysis.sh`.
