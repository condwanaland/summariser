context("Testing that correct numbers are returned")
library(dplyr)

ungrouped_df <- readRDS(system.file("extdata",
                                          "ungrouped_iris.rds",
                                          package = "summariser"))

pkg_ungrouped_df <- summary_stats(iris, Sepal.Length)

test_that("Ungrouped dfs are correctly calculated", {
  expect_equivalent(ungrouped_df, pkg_ungrouped_df)
})

test_that("Ungrouped dfs have the right dims", {
  expect_equal(dim(ungrouped_df), dim(pkg_ungrouped_df))
})


group_df <- readRDS(system.file("extdata",
                                          "grouped_iris.rds",
                                          package = "summariser"))

pkg_group_df <- iris %>%
  group_by(Species) %>%
  summary_stats(Sepal.Length)

test_that("Grouped dfs are correctly calculated", {
  expect_equivalent(group_df[, 1], pkg_group_df[, 1])
  expect_equivalent(group_df[, 2], pkg_group_df[, 2])
  expect_equivalent(group_df[, 4], pkg_group_df[, 4])
  expect_equivalent(group_df[, 5], pkg_group_df[, 5])
})

test_that("Grouped dfs have the right dimensions", {
  expect_equal(dim(group_df), dim(pkg_group_df))
})


triple_grouped_df <- readRDS(system.file("extdata",
                                          "triple_grouped_mtcars.rds",
                                          package = "summariser"))

triple_grouped_df <- ungroup(triple_grouped_df)

pkg_triple_grouped_df <- mtcars %>%
  group_by(am, gear, carb) %>%
  summary_stats(hp) %>%
  ungroup()

test_that("Three levels of grouping calculates correctly", {
  expect_equivalent(triple_grouped_df[, 1], pkg_triple_grouped_df[, 1])
  expect_equivalent(triple_grouped_df[, 2], pkg_triple_grouped_df[, 2])
  expect_equivalent(triple_grouped_df[, 4], pkg_triple_grouped_df[, 4])
  expect_equivalent(na.omit(triple_grouped_df[, 5]),
                    na.omit(pkg_triple_grouped_df[, 5]))

})

test_that("Triple grouping has the right dims", {
  expect_equal(dim(triple_grouped_df), dim(pkg_triple_grouped_df))
})

rm(ungrouped_df)
rm(pkg_ungrouped_df)
rm(group_df)
rm(pkg_group_df)
rm(triple_grouped_df)
rm(pkg_triple_grouped_df)
