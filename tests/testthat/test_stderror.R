context("Testing std_error function")

vec1 <- c(5)
vec2 <- c(2, 3)

test_that("throws error when too few observations", {
  expect_error(std_error(vec1),
               "There must be at least three observations to compute a standard error",
               fixed = TRUE)
  expect_error(std_error(vec2),
               "There must be at least three observations to compute a standard error",
               fixed = TRUE)
})

vec3 <- c(5, 10, 9, 7, 15)

test_that("Computes std error correctly", {
  expect_equal(std_error(vec3), 1.6853)
})
