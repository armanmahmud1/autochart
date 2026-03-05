# autochart for R
Automatically generates a chart based on the data types of the specified variables.

## Description
This function reads a .csv or .xlsx file, and automatically generates a chart (scatter plot, bar plot, or stacked bar plot) based on the data types of the specified variables.

## Installing process
```
devtools::install_github("armanmahmud1/autochart")
library(autochart)
```
```
install.packages(c("ggplot2", "readxl", "haven", "feather", "jsonlite", "arrow"))
library(ggplot2)
library(readxl)
library(haven)
library(feather)
library(jsonlite)
library(arrow)
```
## Example code
```
autochart("D:/package_test/practice_clean.xlsx","resp_id", "work_h")
```
```
?autochart
```
## Instructions
1. Before using this package, please ensure that the ggplot2, readxl, haven, feather, jsonlite, and arrow packages are installed.
2. Currently, it supports .csv, .xlsx, .dta, .parquet, .feather, and .json file formats.
3. Based on the type of variables provided, the package can generate scatter plots, bar plots, or stacked bar plots.
4. The input data file must include the specified variables required for plot generation.
5. If an error occurs, please refer to the error message for guidance.

## Issues
For any issues, report: https://github.com/armanmahmud1/autochart/issues

## Author
Arman Mahmud, <br>
Email: armanmahmud.du18@gmail.com, <br>
Web: https://sites.google.com/view/armanmahmud1
