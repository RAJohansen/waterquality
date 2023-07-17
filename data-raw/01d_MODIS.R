library(terra)
library(tidyverse)

modis = tribble(
  ~band_number, ~band_name,                 ~band_center,        ~resolution
  1,            "Red",                      0.645,                250,
  2,            "NIR",                      0.859,                250,
  3,            "Blue",                     0.469,                500, 
  4,            "Green",                    0.555,                500,
  5,            "Red",                      0.660,                500,
  6,            "SWIR-1",                   1.240,                500,
  7,            "SWIR-2",                   1.640,                500
)
