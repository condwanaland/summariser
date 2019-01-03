[![Build Status](https://travis-ci.org/condwanaland/summariser.svg?branch=master)](https://travis-ci.org/condwanaland/summariser) [![codecov](https://codecov.io/gh/condwanaland/summariser/branch/master/graph/badge.svg)](https://codecov.io/gh/condwanaland/summariser) [![CRAN version](http://www.r-pkg.org/badges/version/summariser)](https://cran.r-project.org/package=summariser)

# summariser

`summariser` provides simple functions for calculating the most common summary statistics, particularly confidence intervals. 

```R
data(iris)
summary_stats(iris, measure = "Sepal.Length")
```

Grouping variables can also be specified after the measure variable to create a row of summary statistics for each level of a factor.

```R
data(iris)
summary_stats(iris, measure = "Sepal.Length", Species)
```

summariser also makes exploratory analysis easier by providing a function to graph the output of `summary_stats` with its confidence intervals

```R
data(iris)
sum1 <- summary_stats(iris, measure = "Sepal.Length", Species)
summary_plot(sum1, x="Species", colour="Species")
```
