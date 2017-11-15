library(raster)
library(tidyverse)

Al10SABI <- function(x){
  (x[[1]] - x[[2]]) / (x[[3]] + x[[4]])
}

Am092Bsub <- function(x){
  x[[1]] - x[[2]]
}

wq_algorithms = tribble(
  ~name, ~funs, ~sentinel2,
  "Al10SABI", Al10SABI, c(9, 4, 2, 3),
  "Am092Bsub", Am092Bsub, c(5, 4)
)

wq_algorithms %>% View

water_quality = function(raster_stack, alg = "all", sat = "sentinel2"){
  result = list()
  for (i in seq_len(nrow(wq_algorithms))){
    result[[i]] = wq_algorithms$funs[[i]](raster_stack[[wq_algorithms$sentinel2[[i]]]])
    names(result[[i]]) = wq_algorithms$name[[i]]
  }
  stack(result)
}

s2 = stack("inst/data/S2_Taylorsville.tif")
s2
t1 = water_quality(s2)
t1

