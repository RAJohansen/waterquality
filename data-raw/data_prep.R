library(terra)
library(sf)

modis = terra::rast("inst/raster/MODIS_Taylorsville.tif")
l8 = terra::rast("inst/raster/L8_Taylorsville.tif")
s2 = terra::rast("inst/raster/S2_Taylorsville.tif")

crs(l8) = crs(modis)
crs(s2) = crs(modis)

tv = terra::vect("inst/raster/Taylorsville_Lake.shp") %>% 
  terra::project(projection(modis))

writeVector(tv, "inst/raster/Taylorsville.gpkg")
file.remove(dir(path = "inst/raster/", pattern = "Taylorsville_Lake*", full.names = TRUE))

modis %>%
  crop(tv) %>% 
  mask(tv, filename = "inst/raster/MODIS_Taylorsville.tif", 
       datatype = "INT2U", overwrite = TRUE, NAflag = 256)

l8 %>%
  crop(tv) %>% 
  mask(tv, filename = "inst/raster/L8_Taylorsville.tif", 
       datatype = "INT2S", overwrite = TRUE, NAflag = -32,767)

s2 %>%
  crop(tv) %>% 
  mask(tv, filename = "inst/raster/S2_Taylorsville.tif", 
       datatype = "FLT4S", overwrite = TRUE, NAflag = 0)
