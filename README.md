# Synthetic data
Analysis of synthetic healthcare data to estimate crude and UK age-sex standardised prevalence of hypertension. Includes cohort definition, distributional analysis of blood pressure and BMI, and comparison with NHS benchmarks.

## Repository Structure
The repository is organised to separate inputs, analysis, and outputs.

- R-markdown file for analysis.Rmd: Main analysis script containing data cleaning, cohort definition, prevalence estimation, and visualisations.
- HTML file for the analysis.html and Analysis_report_word.docx: Rendered report files generated from the R Markdown file.
- input/: Folder containing all source materials required for the analysis including Synthetic datasets (patients, conditions, observations, medications, encounters), and data dictionaries (SNOMED-CT and LOINC mappings).
- uk_population/: Folder containing the ONS population data and the R script used to derive age-sex weights for standardisation.

## UK Population Data
Age-sex weights used for standardisation were derived from Office for National Statistics (ONS) 2021 population estimates.
The raw ONS data and the R script used to process and aggregate these data into study-specific age and sex strata are provided in the uk_population/ folder. The processing step involves mapping ONS age bands to the analysis age groups and calculating proportional weights for each age-sex stratum.
These weights are then applied to stratum-specific prevalence estimates using direct standardisation to produce estimates that are comparable with UK epidemiological benchmarks.
