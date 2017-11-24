#' wq_algorithms database
#'
#' A dataset containing the information about the water quality algorithms
#'
#' @format A tibble with 91 rows and 4 variables:
#' * name: algorithm name
#' * funs: algorithm function
#' * satellite: satellite/instrument name ("worldview2", "sentinel2", "landsat8", "modis", or "meris")
#' * bands: list of the bands used from the given satellite/instrument
"wq_algorithms"