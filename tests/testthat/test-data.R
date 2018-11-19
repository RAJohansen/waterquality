context("wq_algorithms")
test_that("wq_algortihms are correct", {
  # data is intact
  expect_equal(unique(wq_algorithms$type), c("chlorophyll", "phycocyanin", "turbidity"))
  expect_equal(dim(wq_algorithms), c(132, 5))
})