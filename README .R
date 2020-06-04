
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
summary_model(eval_df = eval_data, project_output_dir = '2_process/out')
diagnostic_log_file(mendota_file = eval_data, project_output_dir = '2_process/out')

#Source 3 "visualizing"
plot_results( mendota_file = eval_data, project_output_dir = '3_visualize/out')


