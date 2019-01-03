context("Test CIs are correct")

# Use some hand calcs to make sure CIs are ok. Create vectors where the ci is known in advance
# (hard coded), and ensure it matches

mydat <- data.frame(a = c(3, 7, 9, 2, 1, 6, 4, 9, 8))
my_data <- summary_stats(mydat, a)
calc_ci <- round(my_data$ci, 2)
known_ci <- 1.99


mydat2 <- data.frame(a = c(23.7834, 674.23, 92.56, 129.983, 393.8, 238.29, 94.863))
my_data2 <- summary_stats(mydat2, a)
calc_ci2 <- round(my_data2$ci)
known_ci2 <- 169.39

test_that("Known ci equals expected ci", {
  expect_equal(calc_ci, known_ci, tolerance = 0.01)
  expect_equal(calc_ci2, known_ci2, tolerance = 0.01)
})
