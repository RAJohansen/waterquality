library(raster)
library(sf)

modis = brick("inst/raster/MODIS_Taylorsville.tif")
l8 = brick("inst/raster/L8_Taylorsville.tif")
s2 = brick("inst/raster/S2_Taylorsville.tif")

crs(l8) = crs(modis)
crs(s2) = crs(modis)

tv = st_read("inst/raster/Taylorsville_Lake.shp") %>% 
  st_transform(projection(modis)) %>% 
  as("Spatial")
plot(tv)

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
