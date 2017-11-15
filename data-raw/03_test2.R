library(raster)
library(tidyverse)

sentinel_2 = tribble(
  ~band_number, ~band_name,                 ~wavelenght,
  1,            "Coastal aerosol",          0.443,
  2,            "Blue",                     0.490,
  3,            "Green",                    0.560,
  4,            "Red",                      0.665,
  5,            "Vegetation Red Edge",      0.705,
  6,            "Vegetation Red Edge",      0.740,
  7,            "Vegetation Red Edge",      0.783,
  8,            "NIR",                      0.842,
  9,            "Narrow NIR",               0.865
)

sentinel_2

Al10SABI <- function(x){
  (x[[1]] - x[[2]]) / (x[[3]] + x[[4]])
}

Am092Bsub <- function(x){
  x[[1]] - x[[2]]
}

wq_algorithms = tribble(
  ~name, ~wavelenghts, ~funs, 
  "Al10SABI", c(0.857, 0.644, 0.458, 0.529), Al10SABI,
  "Am092Bsub", c(0.681, 0.665), Am092Bsub
)

wq_algorithms

find_the_closest_wl = function(x, y){
  find_the_closest = function(x, y){
    lapply(x, function(x, y) which.min(abs(y - x)), y) %>% unlist()
  }
  lapply(x, find_the_closest, y) %>% unlist()
}

water_quality = function(raster_stack, alg = "all", sat = "sentinel2"){
  result = list()
  for (i in seq_len(nrow(wq_algorithms))){
    index = find_the_closest_wl(wq_algorithms$wavelenghts[[i]], sentinel_2$wavelenght)
    result[[i]] = wq_algorithms$funs[[i]](raster_stack[[index]])
    names(result[[i]]) = wq_algorithms$name[[i]]
  }
  stack(result)
}

s2 = stack("inst/data/S2_Taylorsville.tif")
s2
t2 = water_quality(s2)

# a = layerStats(stack(t1[[1]], t2[[1]]), 'pearson', na.rm = TRUE)
# a
