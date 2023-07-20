#' Water quality calculation
#'
#' Calculates a set of water quality indices
#'
#' @param terraRast Terra SpatRaster containing a satellite data
#' @param alg Name (e.g. [Am09KBBI()]) or type of the algorithm ("chlorophyll", "phycocyanin", "turbidity") or "all"
#' @param sat Name of the satellite or instrument ("worldview2", "sentinel2", "landsat8", "modis", "meris", or "OLCI")
#' @param ... Other arguments passed on to [terra::rast()]
#' 
#' @importFrom methods is
#'
#' @return SpatRaster
#' 
#' @examples 
#' library(terra)
#' 
#' # sentinel2 example
#' s2 = terra::rast(system.file("raster/S2_Harsha.tif", package = "waterquality"))
#' s2_Al10SABI = wq_calc(s2, alg = "Al10SABI", sat = "sentinel2")
#' s2_two_alg = wq_calc(s2, alg = c("TurbChip09NIROverGreen", "Am092Bsub"), sat = "sentinel2")
#' 
#' \dontrun{(
#' s2_wq = wq_calc(s2, alg = "all", sat = "sentinel2")
#' 
#' # landsat8 example
#' l8 = terra::rast(system.file("raster/L8_Taylorsville.tif", package = "waterquality"))
#' l8_wq = wq_calc(s2, alg = "all", sat = "landsat8")
#' )}
#' @export
wq_calc = function(terraRast, alg = "all", sat, ...){
  #if (!is(terraRast, 'rast')) stop ("Input object needs to be of the Terra Raster class")
  sats = c("worldview2", "sentinel2", "landsat8", "modis", "meris", "OLCI")
  if (!sat %in% sats) stop ("Unknown satellite or instrument.",
                            "Please provide one of: 'worldview2', ",
                            "'sentinel2', 'landsat8', 'modis', or 'meris'")
  if ("all" %in% alg){
    algorithms_sel = waterquality::wq_algorithms
  } else if (any(c("chlorophyll", "phycocyanin", "turbidity") %in% alg)){
    algorithms_sel = waterquality::wq_algorithms[waterquality::wq_algorithms$type %in% alg, ]
  } else{
    algorithms_sel = waterquality::wq_algorithms[waterquality::wq_algorithms$name %in% alg, ]
    if (nrow(algorithms_sel) == 0) stop ("Unknown algorithm name/type: ",
                                         paste(alg, collapse = ", "))
    alg_valid = alg %in% algorithms_sel$name
    if (!all(alg_valid)) warning("Some of the algorithms do not exist: ", 
                                 paste(alg[!alg_valid], collapse = ", "))
  }
  algorithms_sel = algorithms_sel[algorithms_sel$satellite == sat, ]
  if (nrow(algorithms_sel) == 0) stop ("Some of the algorithms are not ",
                                       "available for the selected satellite.\n",
                                       "Please provide appropriate algorithms' names")
  nr_of_bands = max(unlist(algorithms_sel$bands))
  if (nr_of_bands > terra::nlyr(terraRast)) stop ("Terra Raster Stack for ", sat,
                                                  " needs to have at least ",
                                                  nr_of_bands, " layers")
  result = list()
  for (i in seq_len(nrow(algorithms_sel))){
    terraRast_sel = terraRast[[algorithms_sel$bands[[i]]]]
    result[[i]] = terra::lapp(terraRast_sel, fun = algorithms_sel$funs[[i]])
    names(result[[i]]) = algorithms_sel$name[[i]]
    cat(algorithms_sel$name[[i]], "calculated!\n")
  }
  terra::rast(result, ...)
}
