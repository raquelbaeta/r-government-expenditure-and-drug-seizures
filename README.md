###
## Drug Seizures, Government Expenditure, and Single Convention on Narcotic Drugs 1961
###

### Overview

This repository contains a script titled "Multiple Regression and Causal Analysis" that explores the relationship between drug seizures, government expenditure, gross domestic product (GDP), and commitment to the Single Convention on Narcotic Drugs 1961. The script uses data from the World Bank and the United Nations Office on Drugs and Crime (UNODC) for the year 2017.

The analysis includes a series of univariate, bivariate, and multivariate analyses, including correlation matrices, scatterplot matrices, and multiple regression analyses. The script also includes data cleaning and preparation, as well as the creation of transformed variables.

### Installation

To run the script, first install the required packages using the following code:

install.packages(c("readr", "ggplot2", "corrplot", "stargazer"))

### Requirements

The script requires the following R packages:

library(c(readr, ggplot2, corrplot, stargazer)

### Data

The data used in this analysis is included in the repository as a CSV file titled "data.csv". The data includes the following variables:

1. year: the year of data collection (2017)
2. country: the name of countries included
3. exp: government expenditure in USD 
4. exp_ln: the natural logarithm of government expenditure
5. gdp: GDP per capita in constant 2010 US$
6. gdp_ln: the natural logarithm of GDP per capita
7. all_drugs: total volume of drug seizures, including cannabis, cocaine, and opioids
8. un1: a binary variable indicating whether the country has signed the United Nations Single Convention on Narcotic Drugs (1961)

### Analysis

The analysis begins with data cleaning and preparation, including the creation of a new data frame for the year 2017 and the removal of any NA values. The script then provides a descriptive analysis of government expenditure, GDP, drug seizures, and the United Nations Drug Control Treaty, including bar plots and summary statistics.

The following variables are transformed: government expenditure and GDP, and bar plots and summary statistics for these transformed variables are provided.

Next, the script includes a bivariate analysis, including a correlation matrix and scatterplot matrix, to explore the relationships between government expenditure, drug seizures, GDP, and the United Nations Drug Control Treaty.

Finally, a series of multiple regression analyses to explore the relationships between drug seizures, government expenditure, GDP, and the United Nations Drug Control Treaty. The script presents regression tables and a regression plot to summarize the results.

### Contributing

Contributions are welcome! If you find any issues or have suggestions for improvements, please open an issue or submit a pull request.

### Acknowledgements

The data sets used in this script were obtained from World Bank data Bank and the United Nations Office on Drugs and Crime.

### Contact

For any questions or inquiries, please contact Raquel at raquelcbaeta.sa@gmail.com.

Last Updated: 2023-03-19
