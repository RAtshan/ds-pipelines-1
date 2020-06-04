
library(dplyr)
library(readr)
library(stringr)
library(sbtools)
library(whisker)

source("1_fetch/src/fetch_data.R")
source("2_process/src/process_data.R") 
source("3_visualize/src/visualize_data.R")

project_output_dir <- '1_fetch/out'
mendota_file <- file.path(project_output_dir, 'model_RMSEs.csv')

fetch_data(mendota_file)



project_output_dir <- '2_process/out'
eval_data <- load_data(mendota_file = mendota_file)
summary_model(mendota_file = eval_data)


project_output_dir <- '3_visualize/out'

plot_results( mendota_file = eval_data )
diagnostic_log_file(mendota_file = eval_data)

