#' Create an auto-generated chart from a data file.
#'
#' @description This function reads a .csv or .xlsx file,
#' and automatically generates a chart (scatter plot, bar plot, or stacked bar plot)
#' based on the data types of the specified variables.
#'
#' Author: Arman Mahmud
#'
#' Email: armanmahmud.du18@gmail.com
#'
#' Website: https://sites.google.com/view/armanmahmud1
#'
#' @param file_path A character string specifying the path to the data file (.csv or .xlsx).
#' @param x_var A character string specifying the name of the variable for the x-axis.
#' @param y_var A character string specifying the name of the variable for the y-axis.
#'
#' @return A ggplot2 plot object.
#' @export
#'
#' @examples
#' # Assuming you have a file named "my_data.csv" with columns 'A' and 'B'
#' library(autochart)
#' autochart("my_data.csv", "A", "B")

autochart <- function(file_path, x_var, y_var) {
  # Your existing code goes here...
}

# v 1.0.0 Arman Mahmud 25aug2025
# Package_name: autochart
# Author: Arman Mahmud
# Email: armanmahmud.du18@gmail.com
# Website: https://sites.google.com/view/armanmahmud1


autochart <- function(file_path, x_var, y_var) {

  # Check for required packages
  if (!requireNamespace("ggplot2", quietly = TRUE)) {
    stop("The 'ggplot2' package is required. Please install it using install.packages('ggplot2').")
  }


  # file load (only .xlsx and .csv)
  if (grepl("\\.csv$", file_path, ignore.case = TRUE)) {
    data <- read.csv(file_path, stringsAsFactors = FALSE)
  }
  else if (grepl("\\.xlsx$", file_path, ignore.case = TRUE)) {
    if (!requireNamespace("readxl", quietly = TRUE)) {
      stop("The 'readxl' package is required for .xlsx files. Please install it using install.packages('readxl').")
    }
    data <- readxl::read_excel(file_path)
  } else {
    stop("Unsupported file type. This function only supports .csv and .xlsx files.")
  }


  # Check if variables exist in the data
  if (!(x_var %in% names(data)) || !(y_var %in% names(data))) {
    stop("One or both of the specified variables do not exist in the dataset.")
  }


  # Determine plot type and generate plot
  if (is.numeric(data[[x_var]]) && is.numeric(data[[y_var]])) {

    # Scatter plot for numeric vs. numeric
    return(ggplot2::ggplot(data, ggplot2::aes_string(x = x_var, y = y_var)) +
             ggplot2::geom_point())
  } else if (!is.numeric(data[[x_var]]) && is.numeric(data[[y_var]])) {

    # Bar plot for categorical vs. numeric
    return(ggplot2::ggplot(data, ggplot2::aes_string(x = x_var, y = y_var)) +
             ggplot2::geom_bar(stat = "identity", fill = "purple"))
  } else if (is.numeric(data[[x_var]]) && !is.numeric(data[[y_var]])) {

    # Bar plot for numeric vs. categorical
    return(ggplot2::ggplot(data, ggplot2::aes_string(x = y_var, y = x_var)) +
             ggplot2::geom_bar(stat = "identity", fill = "purple"))
  } else {

    # Stacked bar plot for categorical vs. categorical
    return(ggplot2::ggplot(data, ggplot2::aes_string(x = x_var, fill = y_var)) +
             ggplot2::geom_bar(position = "stack"))
  }

  # end
}

