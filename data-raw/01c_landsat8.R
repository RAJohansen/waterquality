library(terra)
library(tidyverse)

landsat_8 = tribble(
  ~band_number, ~band_name,                 ~band_center,
  1,            "Coastal",                  0.443,
  2,            "Blue",                     0.482,
  3,            "Green",                    0.562,
  4,            "Red",                      0.655,
  5,            "NIR",                      0.865,
  6,            "SWIR-1",                   1.609,
  7,            "SWIR-2",                   2.201 
)
