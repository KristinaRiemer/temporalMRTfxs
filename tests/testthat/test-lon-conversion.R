context("longitudinal coordinates conversion")

test_that("grid coordinates return correctly", {
  expect_equal(lon_conversion(-180), 360)
  expect_equal(lon_conversion(0), 0)
  expect_equal(lon_conversion(-90), 540)
  expect_equal(lon_conversion(90), 180)
})
