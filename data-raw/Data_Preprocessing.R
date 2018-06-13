library(rgdal)
library(gdalUtils)
library(raster)
library(magrittr)

#Define path to folder location of jpg2000 imagery
Image_Directory <- "C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA"

### Extacts all files from Image Directory with extention .jp2------------------
Rasters = dir(Image_Directory, pattern = "*.jp2$", full.names = TRUE)

### Create Raster Template------------------------------------------------------
#For Sentinel-2 we want our final output to be in 20m so we can us Band 5
raster_B5 = raster(Rasters[[5]])
raster_template = raster(raster_B5)

### Resample and Stack All Rasters ---------------------------------------------
resampled_stack = Rasters %>% 
  lapply(raster) %>% 
  lapply(resample, raster_template) %>%
  stack()

### Crop Full Scene using Shapefile---------------------------------------------
#Import Shapefile of Area of Interest
AOI <- shapefile("C:/temp/S2/eastfork_lake")

#Reproject shapefile if needed (Harsha Lake uses UTM Zone 16)
Projection <- "+proj=utm +zone=16 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0"
AOI <- spTransform(AOI, CRS(Projection))

#Use AOI to Crop Resampled Raster Stack
Harsha_Lake <- crop(resampled_stack, AOI)

#Write Final Stacked S2 Image
writeRaster(x = Harsha_Lake,
            filename="C:/temp/Harsha_Lake.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file
