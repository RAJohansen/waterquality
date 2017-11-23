#' wq_algorithms database
#'
#' A dataset containing the information about the water quality algorithms
#'
#' @format A tibble with 24 rows and 7 variables:
#' * name: algorithm name
#' * funs: algorithm function
#' * worldview2: list of the bands used from the WorldView-2 satellite
#' * sentinel2: list of the bands used from the Sentinel 2 satellite
#' * landsat8: list of the bands used from the Landsat 8 satellite
#' * modis: list of the bands used from the MODIS instrument
#' * meris: list of the bands used from the Sentinel 2 instruments
"wq_algorithms"