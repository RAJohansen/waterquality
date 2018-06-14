library(rgdal)
library(gdalUtils)
library(raster)
library(magrittr)

###Define Inputs----------------------------------------------------------------
#Image Directory Folder
Image_Directory <- "C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA"

#Import Shapefile of Area of Interest 
AOI <- shapefile("C:/temp/S2/eastfork_lake")

#Reproject AOI if needed (Example - UTM Zone 16)
Projection <- "+proj=utm +zone=16 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0"
AOI <- spTransform(AOI, CRS(Projection))

### Extacts all raster files from Image Directory with extention .jp2-----------
Rasters = dir(Image_Directory, pattern = "*.jp2$", full.names = TRUE)

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

#Save Final Stacked Image as Tiff
writeRaster(x = raster_stack,
            filename="C:/temp/Harsha_Lake.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file