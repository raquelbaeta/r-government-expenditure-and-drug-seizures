# Start 

# title: "Multiple Regression and Causal Analysis"
# author: "Raquel Baeta"
# date: '2022-06-12'

# load packages 
library(readr)
library(ggplot2)
library(corrplot)
library(stargazer)

# load data
data <- read_csv("data.csv", show_col_types = FALSE)


# pull put the year 2017 and make a new data frame 
df_2017 <- data[which(data$year == "2017"),]

# remove nas
df_2017 <- na.omit(df_2017)

# peak at data
str(df_2017) # structure 
dim(df_2017) # dimension 
head(df_2017) # first few rows 
summary(df_2017) # summary 

###
# Univariate analysis 
###

# Figure 1: A bar plot of the raw variable of ‘government expenditure’ from the World Bank.
barplot(df_2017$exp,
        xlab = "Countries", 
        ylab = "Government Expenditure",
        main = "Government Expenditure: A brief overview")

# Figure 2: A bar plot of the raw variable ‘gdp’ from the World Bank.
barplot(df_2017$gdp,
        xlab = "Countries", 
        ylab = "Gross Domestic Product (GDP)",
        main = "Gross Domestic Product (GDP): A Brief overview")

# Figure 3: A bar plot of ‘all_drugs’ that includes cannabis, cocaine and opioid seizures from the UNODC.
barplot(df_2017$all_drugs,
        xlab = "Countries", 
        ylab = "All drugs: number of seziures",
        main = "All drugs: A Brief overview")

# Figure 4: A bar plot of the variable ‘un1’ of number of countries that have signed (0) or haven’t signed (1). 
hist(df_2017$un1,
     xlab = "Countries that have signed the 1961 treaty", 
     ylab = "Countries",
     main = "Single Convention on Narcotic Drugs (1961): A Brief overview")

# overviews
summary(df_2017$exp) # government expenditure 
summary(df_2017$gdp) # gross domestic product 
summary(df_2017$all_drugs) # cannabis, cocaine and opioids

# filtering all countries that have signed a convention
signed <- df_2017[which(df_2017$un1 == "1"),]

# filtering all countries that haven't signed a convention
not_signed <- df_2017[which(df_2017$un1 == "0"),]

###
# Transfromed variables
###

# Figure 5: A bar plot of the transformed variable of ‘government expenditure’ from the World Bank.
barplot(df_2017$exp_ln,
        xlab = "Countries", 
        ylab = "Government Expenditure",
        main = "Government Expenditure (ln): A brief overview")

# Figure 6: A bar plot of the transformed variable of ‘gdp’ from the World Bank.
barplot(df_2017$gdp_ln,
        xlab = "Countries", 
        ylab = "Gross Domestic Product (GDP)",
        main = "Gross Domestic Product (GDP) (ln): A Brief overview")

# overviews
summary(df_2017$exp_ln) # government expenditure 
summary(df_2017$gdp_ln) # gross domestic product 

###
# Bivariate analysis 
###

# correlation matrix 
drugsdf <- subset(df_2017, select = c(exp_ln, all_drugs, gdp_ln, un1))

# correlation 
drugs.cor = cor(drugsdf)

# Figure 7: A correlation matrix of variables: ‘government expenditure’, ‘all drugs’, ‘gdp’, and ‘un1’.

# correlation plot
corrplot(drugs.cor)

# correlation matrix
orrelation.matrix <- cor(drugsdf[,c("all_drugs","exp_ln","gdp_ln", "un1")])
stargazer(correlation.matrix, title = "Correlation Matrix", type = "html")

# Figure 8: A scatterplot matrix of variables: ‘government expenditure’, ‘all drugs’, ‘gdp’, and ‘un1’.

# scatterplot matrix
plot(drugsdf, main = "Scatterplot matrix of all variables")

###
# Effect decomposition
###

# A bivariate regression: 'all drugs' and 'government expenditure'

# bivariate regression 
lm.out <- summary(lm(all_drugs ~ exp_ln, data = drugsdf))
lm.out

# multiple regression: 'all drugs', 'government expenditure' and 'GDP'
lm.out2 <- lm(all_drugs ~ exp_ln + gdp_ln, data =drugsdf)
summary(lm.out)

# multiple regression: 'all drugs', 'government expenditure' and 'United Nations Drug Control Treaty'
lm.out3 <- lm(all_drugs ~ exp_ln + un1, data = drugsdf)
summary(lm.out3)

# multiple regression: 'all drugs', 'government expenditure', 'GDP' and 'United Nations Drug Control Treaty'
lm.out4 <- lm(all_drugs ~ exp_ln + gdp_ln + un1, data = drugsdf)
summary(lm.out4)

# regression table 
stargazer(lm.out2, lm.out3, lm.out4,
          title = "Regression Results", 
          dep.var.labels = c("Drug seizures"),
          covariate.labels = c("Government Eexpenditure",
                               "Gross Domestic Product", 
                               "United Nation Drug Control Treaty"), 
          omit.stat = c("LL", "ser", "f"), 
          ci = TRUE, 
          ci.level = 0.90, 
          single.row = TRUE)

# plot regression 
par(mfrow = c(2,2)) # splits window
plot(lm.out4, cex.caption = 0.6, cex.id = 0.6,
     main = "Regression Plot")

# end