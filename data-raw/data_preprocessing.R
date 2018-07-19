library(sf)
library(gdalUtils)
library(raster)
library(magrittr)

###Define Inputs----------------------------------------------------------------
#Image Directory Folder
Image_Directory = "C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA"

### Extacts all raster files from Image Directory with extention .jp2
Rasters = dir(Image_Directory, pattern = "*.jp2$", full.names = TRUE)
#Import Shapefile of Area of Interest 
AOI = st_read("C:/temp/S2/eastfork_lake.shp")

#Reproject AOI if needed (Example - UTM Zone 16)
Projection = "+proj=utm +zone=16 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0"
AOI = st_transform(AOI, Projection)
AOI = as(AOI, "Spatial")

### Create Template for Final Raster Stack--------------------------------------
#For Sentinel-2 we want our final output to be in 20m so use Band 5
raster_B5 = raster(Rasters[[5]])
raster_template = raster(raster_B5)

### Resample, Crop, & Stack All Images -----------------------------------------
raster_stack = Rasters %>% 
  lapply(raster) %>% 
  lapply(resample, raster_template) %>%
  lapply(crop, AOI) %>%
  stack()

### Mask cropped image---------------------------------------------------------- 
#Further reducing size of stacked image
raster_mask <- mask(raster_stack,AOI)

### Band Subset-----------------------------------------------------------------
S2_Harsha <- raster_mask[1:9] #Sentinel-2 Algorithms Only Use Bands 1-8A

### Save Final Stacked Image as Tiff -------------------------------------------
writeRaster(x = S2_Harsha,
            filename= "C:/temp/S2_Harsha.tif", # save as a tif
            datatype ="FLT4S", # save as a float 4 significant digits
            overwrite = FALSE) #Overwrites same named file
