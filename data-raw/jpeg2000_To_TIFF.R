library(rgdal)
library(gdalUtils)
library(raster)

# CHAB Algorithms only use Sentinel-2 Bands 2,3,4,5,6,7,8A,11,and 12

#Import jp2 files from Sentinel-2 Download folder
S2B1 <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B01.jp2')
S2B2 <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B02.jp2')
S2B3<- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B03.jp2')
S2B4 <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B04.jp2')
S2B5 <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B05.jp2')
S2B6 <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B06.jp2')
S2B7 <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B07.jp2')
S2B8 <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B08.jp2')
S2B8A <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B8A.jp2')
S2B9 <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B09.jp2')
S2B10 <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B10.jp2')
S2B11 <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B11.jp2')
S2B12 <- readGDAL('C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE/GRANULE/L1C_T16SGJ_A015481_20180609T162519/IMG_DATA/T16SGJ_20180609T161901_B12.jp2')


#Convert jp2 to geoTiff format
writeGDAL(S2B1, "C:/temp/S2/B01.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B2, "C:/temp/S2/B02.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B3, "C:/temp/S2/B03.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B4, "C:/temp/S2/B04.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B5, "C:/temp/S2/B05.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B6, "C:/temp/S2/B06.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B7, "C:/temp/S2/B07.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B8, "C:/temp/S2/B08.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B8A, "C:/temp/S2/B8A.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B9, "C:/temp/S2/B09.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B10, "C:/temp/S2/B10.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B11, "C:/temp/S2/B11.tif", drivername="GTiff", type="Float32") 
writeGDAL(S2B12, "C:/temp/S2/B12.tif", drivername="GTiff", type="Float32") 


#Re-Load Tiff Files
B1 <-  stack("C:/temp/S2/B01.tif")
B2 <-  stack("C:/temp/S2/B02.tif")
B3 <-  stack("C:/temp/S2/B03.tif")
B4 <-  stack("C:/temp/S2/B04.tif")
B5 <-  stack("C:/temp/S2/B05.tif")
B6 <-  stack("C:/temp/S2/B06.tif")
B7 <-  stack("C:/temp/S2/B07.tif")
B8 <-  stack("C:/temp/S2/B08.tif")
B8A <-  stack("C:/temp/S2/B8A.tif")
B9 <-  stack("C:/temp/S2/B09.tif")
B10 <-  stack("C:/temp/S2/B10.tif")
B11 <-  stack("C:/temp/S2/B11.tif")
B12 <-  stack("C:/temp/S2/B12.tif")


#Import Shapefile of Area of Interest
AOI <- shapefile("C:/temp/S2/eastfork_lake")

#Reproject shapefile if needed
Projection <- "+proj=utm +zone=16 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0" #Harsha Lake Projection (UTM)
AOI <- spTransform(AOI, CRS(Projection))

#Crop Raster to AOI Extent
B1_sub <- crop(B1, AOI)
B2_sub <- crop(B2, AOI)
B3_sub <- crop(B3, AOI)
B4_sub <- crop(B4, AOI)
B5_sub <- crop(B5, AOI)
B6_sub <- crop(B6, AOI)
B7_sub <- crop(B7, AOI)
B8_sub <- crop(B8, AOI)
B8A_sub <- crop(B8A, AOI)
B9_sub <- crop(B9, AOI)
B10_sub <- crop(B10, AOI)
B11_sub <- crop(B11, AOI)
B12_sub <- crop(B12, AOI)

align_rasters()

#Set Projection and Cell Size for Stackable Images
Projection <- "+proj=utm +zone=16 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0" #Harsha Lake Projection (UTM)
CellSize = 20

#Resample each band
resampleB1 <- projectRaster(B1_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB2 <- projectRaster(B2_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB3 <- projectRaster(B3_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB4 <- projectRaster(B4_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB5 <- projectRaster(B5_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB6 <- projectRaster(B6_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB7 <- projectRaster(B7_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB8 <- projectRaster(B8_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB8A <- projectRaster(B8A_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB9 <- projectRaster(B9_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB10 <- projectRaster(B10_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB11 <- projectRaster(B11_sub, crs=Projection, res=CellSize, method='bilinear')
resampleB12 <- projectRaster(B12_sub, crs=Projection, res=CellSize, method='bilinear')

#Re-align rasters to first


#Stack resampled Tiff Images
resampledStack <- stack(resampleB1,resampleB2,resampleB3,resampleB4,resampleB5,
                        resampleB6,resampleB7,resampleB8,resampleB8A, resampleB9,
                        resampleB10,resampleB11,resampleB12)

#Write Final Stacked S2 Image
writeRaster(x = resampledStack,
            filename="C:/temp/S2/S2_06092018.tif",
            format = "GTiff", # save as a tif
            datatype='FLT4S', # save as a float
            overwrite = F) #Overwrites same named file
