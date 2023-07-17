library(terra)
library(tidyverse)

Al10SABI <- function(w857, w644, w458, w529){
  result = (w857 - w644) / (w458 + w529)
  return(result)
}

Am092Bsub <- function(w681, w665){
  result = w681 - w665
  return(result)
}

wq_algorithms = tribble(
  ~name, ~funs, ~sentinel2,
  "Al10SABI", Al10SABI, c(9, 4, 2, 3),
  "Am092Bsub", Am092Bsub, c(5, 4)
)

water_quality = function(TerraRaster, alg = "all", sat = "sentinel2"){
  result = list()
  for (i in seq_len(nrow(wq_algorithms))){
    TerraRaster_sel = TerraRaster[[wq_algorithms$sentinel2[[i]]]]
    result[[i]] = overlay(TerraRaster_sel, fun = wq_algorithms$funs[[i]])
    names(result[[i]]) = wq_algorithms$name[[i]]
  }
  stack(result)
}

s2 = terra::rast("inst/data/S2_Taylorsville.tif")
s2
t1 = water_quality(s2)
t1
