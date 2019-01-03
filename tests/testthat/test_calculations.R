context("Testing that correct numbers are returned")

ungrouped_df <- readRDS(base::system.file("tests", "testdata",
                                          "ungrouped_iris.rds",
                                          package = "summariser"))

pkg_ungrouped_df <- summary_stats(iris, Sepal.Length)

test_that("Ungrouped dfs are correctly calculated", {
  expect_equivalent(ungrouped_df, pkg_ungrouped_df)
})


grouped_df <- readRDS(base::system.file("tests", "testdata",
                                          "grouped_iris.rds",
                                          package = "summariser"))

pkg_grouped_df <- summary_stats(iris, Sepal.Length, Species)

test_that("Grouped dfs are correctly calculated", {
  expect_equivalent(grouped_df, pkg_grouped_df)
})


triple_grouped_df <- readRDS(base::system.file("tests", "testdata",
                                          "triple_grouped_mtcars.rds",
                                          package = "summariser"))

pkg_triple_grouped_df <- summary_stats(mtcars, hp, am, gear, carb)

test_that("Three levels of grouping calculates correctly", {
  expect_equivalent(triple_grouped_df, pkg_triple_grouped_df)
})

rm(ungrouped_df)
rm(pkg_ungrouped_df)
rm(grouped_df)
rm(pkg_grouped_df)
rm(triple_grouped_df)
rm(pkg_triple_grouped_df)
