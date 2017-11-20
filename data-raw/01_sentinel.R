library(raster)
library(tidyverse)

sentinel_2 = tribble(
  ~band_number, ~band_name,                 ~band_center,
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
  ~name, ~band_center, ~funs, ~sentinel2,
  "Al10SABI", c(0.857, 0.644, 0.458, 0.529), Al10SABI, c(9, 4, 2, 3),
  "Am092Bsub", c(0.681, 0.665), Am092Bsub, c(5, 4)
)

wq_algorithms

s2 = stack("inst/data/S2_Taylorsville.tif")
s2
raster_stack = s2


wq_action = function(f, i, s){
  (f)
}

water_quality = function(raster_stack, alg = "all", sat = "sentinel2"){
  result = list()
  for (i in seq_len(nrow(wq_algorithms))){
    result[[i]] = wq_algorithms$funs[[i]](raster_stack[[wq_algorithms$sentinel2[[i]]]])
    names(result[[i]]) = wq_algorithms$name[[i]]
  }
  stack(result)
}

water_quality(s2)


wq_algorithms %>% View



Am092Bsub <- function(w681, w655){
  w681 - w665
}

wq_algorithms

which.min(abs(sentinel_2$band_center - wq_algorithms$band_center[[1]][1]))


find_the_closest_wl = function(satelite){
  find_the_closest = function(x, y){
    lapply(x, function(x, y) which.min(abs(y - x)), y) %>% unlist()
  }
  # zz = wq_algorithms$band_center
  # zz
  lapply(wq_algorithms$band_center, find_the_closest, sentinel_2$band_center)
  # al10sabi_sel = wq_algorithms$band_center[[1]] %>% map_int(~find_the_closest(., sentinel_2$band_center))
  
}
wq_algorithms

al10sabi_sel = wq_algorithms$band_center[[1]] %>% map_int(~find_the_closest(., sentinel_2$band_center))


Al10SABI <- function(w857, w644, w458, w529){
  (w857 - w644) / (w458 + w529)
}


x = s2[[al10sabi_sel]]

Al10SABI <- function(x){
  (x[[1]] - x[[2]]) / (x[[3]] + x[[4]])
}

Al10SABI_result = Al10SABI(x)
plot(Al10SABI_result)
hist(Al10SABI_result)


wq_algorithms$funs[[1]](s2[[wq_algorithms$band_center[[1]] %>% map_int(~find_the_closest(., sentinel_2$band_center))]])

water_quality = function(raster_stack, alg = "all", sat = "sentinel-2"){
  
  
}