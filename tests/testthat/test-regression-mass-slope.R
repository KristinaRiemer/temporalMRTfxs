context("yearly mass slope calculations")

mass_df_ex = data.frame(species = c("A", "A", "A"), yr = c(1990, 1991, 1992), mass_mean = c(21, 23, 25))
regression_df_ex = data.frame(species = "A", slope = 2)

test_that("returns correct slope dataframe", {
  expect_equal(nrow(regression_mass_slope(mass_df_ex)), 1)
  expect_equal(dim(regression_mass_slope(mass_df_ex)), c(1, 2))
  expect_equal(sapply(regression_mass_slope(mass_df_ex), class)[[1]], "factor")
  expect_equal(sapply(regression_mass_slope(mass_df_ex), class)[[2]], "numeric")
  expect_equal(regression_mass_slope(mass_df_ex), regression_df_ex)
})
