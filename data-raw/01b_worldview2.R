library(raster)
library(tidyverse)

worldview_2 = tribble(
  ~band_number, ~band_name,                 ~band_center,
  1,            "Coastal",                  0.425,
  2,            "Blue",                     0.480,
  3,            "Green",                    0.545,
  4,            "Yellow",                   0.605,
  5,            "Red",                      0.660,
  6,            "Red Edge",                 0.725,
  7,            "NIR-1",                    0.833,
  8,            "NIR-2",                    0.950 
)
