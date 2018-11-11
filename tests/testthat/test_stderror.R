context("Testing std_error function")

vec1 <- c(5)
vec2 <- c(2, 3)

test_that("error is thrown when there are too few observations", {
  expect_error(std_error(vec1),
               "There must be at least three observations to compute a standard error",
               fixed = TRUE)
  expect_error(std_error(vec2),
               "There must be at least three observations to compute a standard error",
               fixed = TRUE)
})


vec_chr <- c("2", "7", "9", "13")
vec_lgl <- c(TRUE, TRUE, TRUE, FALSE, FALSE)
vec_list <- list(3, 4, 6, 7)

test_that("error is thrown when input is not numeric", {
  expect_error(std_error(vec_chr),
               "Input must be numeric",
               fixed = TRUE)
  expect_error(std_error(vec_lgl),
               "Input must be numeric",
               fixed = TRUE)
  expect_error(std_error(vec_list),
               "Input must be numeric",
               fixed = TRUE)
})


vec3 <- c(5, 10, 9, 7, 15)
vec4 <- c(100000, 75000, 230000)

test_that("std_error computes correctly", {
  expect_equal(std_error(vec3), 1.6853,
               tolerance = 0.0001)
  expect_equal(std_error(vec4), 48045.11768,
               tolerance = 0.0001)
})




