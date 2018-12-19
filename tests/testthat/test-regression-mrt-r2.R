context("temperature-mass relationship r^2 calculations")

mrt_df_ex = data.frame(species = c("A", "A", "A"), yr = c(1990, 1991, 1992), avg_temp = c(14, 12, 10.00000000001), mass_mean = c(21, 23, 25))
regression_df_ex = data.frame(species = "A", r.squared = 1)

test_that("returns correct slope and p-value dataframe", {
  expect_equal(nrow(regression_mrt_r2(mrt_df_ex)), 1)
  expect_equal(dim(regression_mrt_r2(mrt_df_ex)), c(1, 2))
  expect_equal(sapply(regression_mrt_r2(mrt_df_ex), class)[[1]], "factor")
  expect_equal(sapply(regression_mrt_r2(mrt_df_ex), class)[[2]], "numeric")
  expect_equal(regression_mrt_r2(mrt_df_ex), regression_df_ex)
})
