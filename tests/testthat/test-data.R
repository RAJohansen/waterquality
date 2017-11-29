context("wq_algortihms")
test_that("wq_algortihms are correct", {
  # data is intact
  expect_equal(dim(wq_algorithms), c(96, 4))
})