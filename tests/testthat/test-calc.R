context("wq_calc")
test_that("wq_calc works correctly", {
  s2 = stack(system.file("raster/S2_Taylorsville.tif", package = "waterquality"))
  
  # test number of output layers
  expect_equal(nlayers(wq_calc(s2, alg = c("Am092Bsub"), sat = "sentinel2")), 1)
  expect_equal(nlayers(wq_calc(s2, alg = c("TurbChip09NIROverGreen", "Am092Bsub"), sat = "sentinel2")), 2)

  # warnings
  expect_warning(wq_calc(s2, alg = c("Al10SABI", "Am092Bsub", "my_alg"), sat = "sentinel2"))
  expect_warning(wq_calc(s2, alg = c("my_alg1", "Al10SABI", "Am092Bsub", "my_alg"), sat = "sentinel2"))

  # errors
  expect_error(wq_calc(s2[[1]], alg = "all", sat = "sentinel2"))
  expect_error(wq_calc(s2, alg = "all", sat = "my_satellite"))
  expect_error(wq_calc(s2[[1:4]], alg = "all", sat = "sentinel2"))
  expect_error(wq_calc(s2, alg = "many", sat = "sentinel2"))
})

