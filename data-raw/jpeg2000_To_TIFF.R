library(rgdal)
library(gdalUtils)
library(raster)
library(magrittr)

Image_Dir <- "C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA"

### Extacts all files from Image Directry with extention .jp2-------------------
all_rasters_names = dir(Image_Dir, pattern = "*.jp2$", full.names = TRUE)

### Create Raster Output Template-----------------------------------------------

#Import Shapefile of Area of Interest to crop images (Shapefile)
AOI <- shapefile("C:/temp/S2/eastfork_lake")
#Reproject shapefile if needed Harsha Lake Projection (UTM)
Projection <- "+proj=utm +zone=16 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0"
AOI <- spTransform(AOI, CRS(Projection))

#Use Raster with appropiate resolution for template 
#For Sentinel-2 we want our final output to be in 20m so we can us Band 5
raster5 = raster(all_rasters_names[[5]])
raster_template = raster(raster5)
#template = raster(all_rasters_names[[5]])
#template_crop <- crop(template, AOI)
#raster_template = raster(template_crop)

### Resample and Stack All Rasters ---------------------------------------------
output_stack = all_rasters_names %>% 
  lapply(raster) %>% 
  lapply(resample, raster_template) %>%
  stack()

Harsha <- crop(output_stack, AOI)

#Write Final Stacked S2 Image
writeRaster(x = Harsha,
            filename="C:/temp/S2/S2_06092018_Harsha.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file
