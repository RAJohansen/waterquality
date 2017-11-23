#' Water quality calculation
#'
#' Calculates a set of water quality indices
#'
#' @param raster_stack RasterStack containing a satellite data
#' @param alg Name of the algorithm or "all"
#' @param sat Name of the satellite or instrument ("worldview2", "sentinel2", "landsat8", "modis", or "meris")
#' 
#' @importFrom raster overlay stack
#'
#' @return RasterLayer
#' 
#' @examples 
#' \dontrun{(
#' library(raster)
#' s2 = stack(system.file("raster/S2_Taylorsville.tif", package = "algae"))
#' s2_wq = wq_calc(s2, alg = "all", sat = "sentinel2")
#' l8 = stack(system.file("raster/L8_Taylorsville.tif", package = "algae"))
#' l8_wq = wq_calc(s2, alg = "all", sat = "landsat8")
#' 
#' # errors
#' s2_wq1 = wq_calc(s2[[1]], alg = "all", sat = "sentinel2")
#' s2_wq2 = wq_calc(s2, alg = "all", sat = "my_satellite")
#' s2b = s2[[1:4]]
#' s2_wq3 = wq_calc(s2b, alg = "all", sat = "my_satellite")
#' )}
#' @export
wq_calc = function(raster_stack, alg = "all", sat = "sentinel2"){
  if (!is(raster_stack, 'RasterStack')) stop ("Input object needs to be of the RasterStack class")
  algorithms_sel = algae::wq_algorithms[algae::wq_algorithms$satellite == sat, ]
  if (nrow(algorithms_sel) == 0) stop ('Unknown satellite or instrument. Please select one of: "worldview2", "sentinel2", "landsat8", "modis", or "meris"')
  # check bands
  result = list()
  for (i in seq_len(nrow(algorithms_sel))){
    print(algorithms_sel$name[[i]])
    raster_stack_sel = raster_stack[[algorithms_sel$bands[[i]]]]
    result[[i]] = overlay(raster_stack_sel, fun = algorithms_sel$funs[[i]])
    names(result[[i]]) = algorithms_sel$name[[i]]
  }
  stack(result)
}
