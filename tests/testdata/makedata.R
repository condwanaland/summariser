# Script to make data for tests

library(dplyr)

ungrouped_iris <- dplyr::summarise(iris,
                    mean = mean(Sepal.Length),
                    sd = sd(Sepal.Length),
                    n = length(Sepal.Length),
                    se = std_error(Sepal.Length),
                    ci = std_error(Sepal.Length) * qnorm(0.975))

saveRDS(ungrouped_iris, "tests/testdata/ungrouped_iris.rds")

grouped_iris <- dplyr::group_by(iris, Species) %>%
                  dplyr::summarise(mean = mean(Sepal.Length),
                                   sd = sd(Sepal.Length),
                                   n = length(Sepal.Length),
                                   se = std_error(Sepal.Length),
                                   ci = std_error(Sepal.Length) * qnorm(0.975))

saveRDS(grouped_iris, "tests/testdata/grouped_iris.rds")


grouped_mtcars <- mtcars %>%
  dplyr::group_by(am, gear, carb) %>%
  dplyr::summarise(mean = mean(hp),
                   sd = sd(hp),
                   n = length(hp),
                   se = std_error(hp),
                   ci = std_error(hp) * qnorm(0.975))

saveRDS(grouped_mtcars, "tests/testdata/triple_grouped_mtcars.rds")
