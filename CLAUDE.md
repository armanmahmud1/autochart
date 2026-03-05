# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

**autochart** is an R package that automatically generates charts (scatter plots, bar plots, or stacked bar plots) based on the data types of specified variables. It simplifies data visualization by eliminating manual plot type selection.

## Development Commands

### Package Development
- Build package: `R CMD build .`
- Check package: `R CMD check .`
- Install locally: `R CMD INSTALL .`
- Load in R: `library(autochart)`

### Testing
- No formal test suite exists yet
- Manual testing: Run `autochart()` with sample data
- Debug: Use R's debugging tools or add print statements

### Documentation
- Generate documentation: `devtools::document()`
- View help: `?autochart`

## Code Architecture

### Core Structure
- **Main function**: `R/autochart.R` contains the `autochart()` function
- **Package metadata**: `DESCRIPTION` file defines dependencies and metadata
- **Documentation**: Roxygen comments in source files

### Dependencies
- **ggplot2**: For creating visualizations
- **readxl**: For reading Excel files

### Plot Logic Flow
1. File loading (.csv or .xlsx)
2. Variable existence validation
3. Type detection (numeric vs categorical)
4. Plot type selection:
   - Numeric vs Numeric → Scatter plot
   - Categorical vs Numeric → Bar plot
   - Numeric vs Categorical → Bar plot
   - Categorical vs Categorical → Stacked bar plot

## Common Development Tasks

### Adding New Features
1. Edit `R/autochart.R`
2. Update documentation with Roxygen comments
3. Test with sample data
4. Rebuild package

### Fixing Issues
1. Check error messages for context
2. Validate file paths and variable names
3. Ensure required packages are installed
4. Test with minimal reproducible examples

### File Support
- Currently supports only .csv and .xlsx files
- Error handling for unsupported formats
- String parsing for CSV files

## Development Workflow

1. Edit R code in `R/autochart.R`
2. Update documentation comments
3. Rebuild and test locally
4. Check package for errors
5. Install and verify functionality

## Important Notes

- Package uses GPL-3 license
- Roxygen2 used for documentation generation
- No test suite currently implemented
- Manual installation of ggplot2 and readxl required
- Error messages guide users to install missing packages

## External Resources

- GitHub Issues: https://github.com/armanmahmud1/autochart/issues
- Author Website: https://sites.google.com/view/armanmahmud1
- CRAN package (when available): `install.packages("autochart")`