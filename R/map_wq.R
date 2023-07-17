#' Create waterquality Map with sampling points and optional histogram
#'
#'This function wraps the tmap package to help users generate fast and simple 
#'data visualization of their WQ_calc raster output along with optional 
#'geospatial objects and histogram
#'
#' @param WQ_raster Raster file generated from `wq_calc` or other GeoTiff file
#' @param sample_points geospatial file (.shp or .gpkg) containing sampling locations 
#' @param map_title text used to generate title of map
#' @param raster_style method to process the color scale when col is a numeric variable. Please refer to the style argument in the ?tmap::tm_raster() function for more details (Default is "quantile").
#' @param histogram Option to add or remove a histogram of the data values. (Default is TRUE)
#' @return A data visualization of the results
#'
#' @family Map_WQ models
#' @export
Map_WQ_raster <- function(WQ_raster, sample_points, map_title, raster_style = "quantile", histogram = TRUE) {
  if (!requireNamespace("tmap", quietly = TRUE))
    stop("package tmap required, please install it first") 
  tmap::tm_shape(WQ_raster) +
    tmap::tm_raster(title = map_title,
                    style = raster_style, n = 8, midpoint = NA,
                    palette = "viridis",
                    legend.reverse = TRUE,
                    legend.hist = histogram) +
    tmap::tm_legend(outside = TRUE, hist.width = 2) +
    if(missing(sample_points)){
      tmap::tm_scale_bar(text.size = 0.75) + 
        tmap::tm_grid(labels.inside.frame = FALSE,
                      labels.size = 1,
                      n.x = 5,
                      n.y = 5,
                      projection = "+proj=longlat",
                      alpha = 0.35)
    }else{
      tmap::tm_shape(sample_points) +
        tmap::tm_dots(size = 0.1, alpha = 0.75)
      tmap::tm_scale_bar(text.size = 0.75) + 
        tmap::tm_grid(labels.inside.frame = FALSE,
                      labels.size = 1,
                      n.x = 5,
                      n.y = 5,
                      projection = "+proj=longlat",
                      alpha = 0.35)
    }
  
}