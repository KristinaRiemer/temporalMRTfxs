context("latitudinal coordinates conversion")

test_that("grid coordinates return correctly", {
  expect_equal(lat_conversion(0), 180)
  expect_equal(lat_conversion(-90), 360)
  expect_equal(lat_conversion(45), 90)
  expect_equal(lat_conversion(-45), 270)
})