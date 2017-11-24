#' Water quality calculation
#'
#' Calculates a set of water quality indices
#'
#' @param raster_stack RasterStack containing a satellite data
#' @param alg Name of the algorithm or "all"
#' @param sat Name of the satellite or instrument ("worldview2", "sentinel2", "landsat8", "modis", or "meris")
#' @param ... Other arguments passed on to [stack()]
#' 
#' @importFrom raster overlay stack nlayers
#' @importFrom methods is
#'
#' @return RasterLayer
#' 
#' @examples 
#' \dontrun{(
#' library(raster)
#' s2 = stack(system.file("raster/S2_Taylorsville.tif", package = "algae"))
#' s2_wq = wq_calc(s2, alg = "all", sat = "sentinel2")
#' s2_Al10SABI = wq_calc(s2, alg = "Al10SABI", sat = "sentinel2")
#' s2_two_alg = wq_calc(s2, alg = c("Al10SABI", "Am092Bsub"), sat = "sentinel2")
#' 
#' l8 = stack(system.file("raster/L8_Taylorsville.tif", package = "algae"))
#' l8_wq = wq_calc(s2, alg = "all", sat = "landsat8")
#' )}
#' @export
wq_calc = function(raster_stack, alg = "all", sat = "sentinel2", ...){
  if (!is(raster_stack, 'RasterStack')) stop ("Input object needs to be of the RasterStack class")
  if ("all" %in% alg){
    algorithms_sel = algae::wq_algorithms
  } else{
    algorithms_sel = algae::wq_algorithms[algae::wq_algorithms$name %in% alg, ]
    if (nrow(algorithms_sel) == 0) stop ("Unknown algorithm name/names: ",
                                         paste(alg, collapse = ", "))
    alg_valid = alg %in% algorithms_sel$name
    if (!all(alg_valid)) warning("Some of the algorithms do not exist: ", 
                                 paste(alg[!alg_valid], collapse = ", "))
  }
  algorithms_sel = algorithms_sel[algorithms_sel$satellite == sat, ]
  if (nrow(algorithms_sel) == 0) stop ("Unknown satellite or instrument.",
                                       "Please provide one of: 'worldview2', ",
                                       "'sentinel2', 'landsat8', 'modis', or 'meris'")
  nr_of_bands = max(unlist(algorithms_sel$bands))
  if (nr_of_bands > nlayers(raster_stack)) stop ("RasterStack for ", sat, " needs to have at least ",
                                                 nr_of_bands, " layers")
  result = list()
  for (i in seq_len(nrow(algorithms_sel))){
    raster_stack_sel = raster_stack[[algorithms_sel$bands[[i]]]]
    result[[i]] = overlay(raster_stack_sel, fun = algorithms_sel$funs[[i]])
    names(result[[i]]) = algorithms_sel$name[[i]]
    cat(algorithms_sel$name[[i]], "calculated!\n")
  }
  stack(result, ...)
}

