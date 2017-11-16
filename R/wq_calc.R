#' Water quality calculation
#'
#' Calculates a set of water quality indices
#'
#' @param raster_stack RasterStack containing a satellite data
#' @param alg Name of the algorithm or "all"
#' @param sat Name of the satellite
#' 
#' @importFrom raster overlay stack
#'
#' @return RasterLayer
#' 
#' @examples 
#' \dontrun{(
#' library(raster)
#' s2 = stack(system.file("raster/S2_Taylorsville.tif", package = "algae"))
#' s2_wq = wq_calc(s2)
#' )}
#' @export
wq_calc = function(raster_stack, alg = "all", sat = "sentinel2"){
  result = list()
  for (i in seq_len(nrow(algae::wq_algorithms))){
    raster_stack_sel = raster_stack[[algae::wq_algorithms$sentinel2[[i]]]]
    result[[i]] = overlay(raster_stack_sel, fun = algae::wq_algorithms$funs[[i]])
    names(result[[i]]) = algae::wq_algorithms$name[[i]]
  }
  stack(result)
}
