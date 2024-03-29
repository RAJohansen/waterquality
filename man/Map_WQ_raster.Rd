% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/map_wq.R
\name{Map_WQ_raster}
\alias{Map_WQ_raster}
\title{Create waterquality Map with sampling points and optional histogram}
\usage{
Map_WQ_raster(
  WQ_raster,
  sample_points,
  map_title,
  raster_style = "quantile",
  histogram = TRUE
)
}
\arguments{
\item{WQ_raster}{Raster file generated from \code{wq_calc} or other GeoTiff file}

\item{sample_points}{geospatial file (.shp or .gpkg) containing sampling locations}

\item{map_title}{text used to generate title of map}

\item{raster_style}{method to process the color scale when col is a numeric variable. Please refer to the style argument in the ?tmap::tm_raster() function for more details (Default is "quantile").}

\item{histogram}{Option to add or remove a histogram of the data values. (Default is TRUE)}
}
\value{
A data visualization of the results
}
\description{
This function wraps the tmap package to help users generate fast and simple
data visualization of their WQ_calc raster output along with optional
geospatial objects and histogram
}
\concept{Map_WQ models}
