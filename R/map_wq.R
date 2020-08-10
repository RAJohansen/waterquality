#' Create waterquality Map with sampling points and optional histogram
#'
#'The function runs a linear model on a single independent and dependent variable
#' and returns a data frame containing the following:
#' r^2, p-value, slope, and intercept of the model
#'
#' @param WQ_raster raster tiff of waterquality output
#' @param sample_points geospatial points object
#' @param map_title text for the title of the map
#' @param raster_style data visualization style (default is quantile)
#' @param histogram boolean toggle to add or remove histogram (default is TRUE)
#' @return A data visualization of the results
#'
#' @family Map_WQ models
#' @export
Map_WQ_raster <- function(WQ_raster,sample_points,map_title, raster_style = "quantile", histogram = TRUE) {
  tm_shape(WQ_raster) +
    tm_raster(title = map_title,
              style = raster_style, n = 8, midpoint = NA,
              palette = viridisLite::viridis(20),
              legend.reverse = TRUE,
              legend.hist = histogram) +
    tm_legend(outside = TRUE, hist.width = 2) +
    tm_shape(sample_points) + tm_dots(size = 0.1, alpha = 0.75) +
    tm_scale_bar(text.size = 0.75) + 
    tm_grid(labels.inside.frame = FALSE,
            labels.size = 1,
            n.x = 5,
            n.y = 5,
            projection = "+proj=longlat",
            alpha = 0.35)
  
}

#' Create waterquality Map with Bing basemap
#'
#'The function runs a linear model on a single independent and dependent variable
#' and returns a data frame containing the following:
#' r^2, p-value, slope, and intercept of the model
#'
#' @param WQ_extent geospatial polygon to use as extent for Bing basemap 
#' @param sample_points geospatial points object
#' @param map_title text for the title of the map
#' @param points_style data visualization style (default is quantile)
#' @param histogram boolean toggle to add or remove histogram (default is TRUE)
#' @return A data visualization of the results
#'
#' @family Map_WQ models
#' @export
Map_WQ_basemap <- function(WQ_extent,sample_points,map_title, points_style = "quantile", histogram = TRUE) {
  Basemap <- tmaptools::read_osm(WQ_extent, type="bing", ext=1.1)
  tm_shape(Basemap) +
    tm_rgb() +
    tm_shape(WQ_extent) + tm_borders(col = "lightgrey", lwd = 3) +
    tm_shape(sample_points) +
    tm_dots(alpha = 0.85,
            size = 0.65,
            col = "BGA_PC_RFU",
            palette = viridisLite::viridis(20),
            style = points_style, n = 10,
            legend.hist = histogram) +
    tm_scale_bar(text.size = 0.75, position = c("right", "bottom"),  text.color = "white") +
    tm_grid(labels.inside.frame = FALSE,
            labels.size = 1,
            labels.cardinal = TRUE,
            n.x = 5,
            n.y = 5,
            projection = "+proj=longlat",
            alpha = 0.35)+
    tm_legend(legend.outside = TRUE,
              hist.width = 2,
              legend.title.size = 1.1,
              legend.text.size = 0.85)
  
}

test