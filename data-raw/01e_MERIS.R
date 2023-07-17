library(terra)
library(tidyverse)

meris = tribble(
  ~band_number, ~band_name,                 ~band_center,
  1,            "Coastal",                  0.413,
  2,            "Blue",                     0.443,
  3,            "Blue-2",                   0.490,
  4,            "Yellow",                   0.510,
  5,            "Green",                    0.560,
  6,            "Red",                      0.620,
  7,            "Red-2",                    0.665,
  8,            "Chlorophyll_Fl",           0.681,
  9,            "Red-Edge",                 0.709,
  10,           "Red-Edge-2",               0.754,
  11,           "Red-Edge-3",               0.761,
  12,           "Red-Edge-4",               0.779,
  13,           "NIR-1",                    0.865,
  14,           "NIR-2",                    0.885,
  15,           "NIR-3",                    0.900
  )
