library(raster)
library(tidyverse)

OLCI = tribble(
  ~band_number, ~band_name,                       ~band_center,
  1,            "Aerosol Correction",                0.400,
  2,            "Turbidity",                         0.413,
  3,            "Chlorophyll Absorption Max",        0.443,
  4,            "High-Chlorophyll",                  0.490,
  5,            "Chlorophyll & sediment",            0.510,
  6,            "Chlorophyll Reference",             0.560,
  7,            "Sediment Loading/Phycocyanin",      0.620,
  8,            "Chlorophyll 2nd Absorption Max",    0.665,
  9,            "Improved Fluorescence Retrieval",   0.674,
  10,           "Chlorophyll Fluorescence Peak",     0.681,
  11,           "Chlorophyll Fluorescence Baseline", 0.709,
  12,           "O2 Absorption/Clouds",              0.754,
  13,           "O2 Absorption/Aerosol Correction",  0.761,
  14,           "Atmospheric Correction",            0.764,
  15,           "O2A Cloud Top Pressure",            0.768,
  16,           "Atmospheric/Aerosol Correction",    0.779,
  17,           "Atmosp. Corr. and Co-registration", 0.865,
  18,           "Water Vapor Reference",             0.885,
  19,           "Water Vapor Absorption",            0.900,
  20,           "Water Vapor Absorption-2",          0.940,
  21,           "Atmospheric/Aerosol Correction-2",  1.020
)
