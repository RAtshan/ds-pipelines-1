
library(dplyr)
library(readr)
library(stringr)
library(sbtools)
library(whisker)
#referring to the functions source/path. 
source("1_fetch/src/fetch_data.R")
source("2_process/src/process_data.R") 
source("3_visualize/src/visualize_data.R")

project_output_dir <- '1_fetch/out' #project directory"
mendota_file <- file.path(project_output_dir, 'model_RMSEs.csv') #declaring variable with path to fetch the data.

fetch_data(mendota_file)


#Source 2 "processing" 
eval_data <- load_data(mendota_file = mendota_file)  # declaring variable to load_data function output. argument = variable above. 
summary_model(eval_df = eval_data, model_summary_file = '2_process/out/model_summary_results.csv')
diagnostic_log_file(mendota_diagnostic_data = eval_data, model_diagnostic_summary = '2_process/out/model_diagnostic_text.txt')

#Source 3 "visualizing"
plot_results( mendota_proc_data = eval_data, plot_file = '3_visualize/out/figure_1.png')


