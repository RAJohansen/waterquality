context("wq_algortihms")
test_that("wq_algortihms are correct", {
  # data is intact
  expect_equal(dim(wq_algorithms), c(136, 5))
  expect_equal(unique(wq_algorithms$type), c("chlorophyll", "phycocyanin", "turbidity"))
})