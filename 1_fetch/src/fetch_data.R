############## Fetch data ######################



fetch_data <- function (mendota_file) {
                item_file_download('5d925066e4b0c4f70d0d0599', names = 'me_RMSE.csv', 
                                   destinations = mendota_file, overwrite_file = TRUE)
}


