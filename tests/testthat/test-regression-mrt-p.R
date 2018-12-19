context("temperature-mass relationship p-value and slope calculations")

mrt_df_ex = data.frame(species = c("A", "A", "A"), yr = c(1990, 1991, 1992), avg_temp = c(10.00000000001, 12, 14), mass_mean = c(21, 23, 25))
regression_df_ex = data.frame(species = "A", slope = 1, p.value = 9.995519e-17)

test_that("returns correct slope and p-value dataframe", {
  expect_equal(nrow(regression_mrt_p(mrt_df_ex)), 1)
  expect_equal(dim(regression_mrt_p(mrt_df_ex)), c(1, 3))
  expect_equal(sapply(regression_mrt_p(mrt_df_ex), class)[[1]], "factor")
  expect_equal(sapply(regression_mrt_p(mrt_df_ex), class)[[2]], "numeric")
  expect_equal(sapply(regression_mrt_p(mrt_df_ex), class)[[3]], "numeric")
  expect_equal(regression_mrt_p(mrt_df_ex), regression_df_ex)
})
