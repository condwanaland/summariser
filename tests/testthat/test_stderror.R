context("Testing std_error function")

vec <- c(2, 3)

test_that("throws error when too few observations", {
  expect_error(std_error(vec),
               "There must be at least three observations to compute a standard error",
               fixed = TRUE)
})
