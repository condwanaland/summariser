context("Default summary stats methods are called with unsupported classes")

# Make some non-df data

vec <- c(2, 3, 4, 5, 6, 7)
mat <- matrix(c(2, 3, 4, 5, 6, 7, 8, 8, 1), nrow = 3)

test_that("Message is thrown on non-df inputs", {
  expect_output(summary_stats(vec, vec),
              regexp = "Sorry, summary_stats only provides methods*")
  expect_output(summary_stats(mat, mat[, 2]),
               regexp = "Sorry, summary_stats only provides methods*")
})

rm(vec)
rm(mat)

