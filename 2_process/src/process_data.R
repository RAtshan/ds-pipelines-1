############## Process data  ######################

project_output_dir <- '1_process/out'

dir.create(project_output_dir)


load_data <- function() {
  read_csv(mendota_file, col_types = 'iccd') %>%
    filter(str_detect(exper_id, 'similar_[0-9]+')) %>%
    mutate(col = case_when(
      model_type == 'pb' ~ '#1b9e77',
      model_type == 'dl' ~'#d95f02',
      model_type == 'pgdl' ~ '#7570b3'
    ), pch = case_when(
      model_type == 'pb' ~ 21,
      model_type == 'dl' ~ 22,
      model_type == 'pgdl' ~ 23
    ), n_prof = as.numeric(str_extract(exper_id, '[0-9]+')))
  
}

summary_model <- function () {
  readr::write_csv(load_data, path = file.path(project_output_dir, 'model_summary_results.csv'))
}
