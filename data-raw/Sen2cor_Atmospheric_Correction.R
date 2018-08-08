library(devtools)
#install_github("ranghetti/sen2r")

library(sen2r)
check_sen2r_deps()
sen2r()

#Define Level 1C Product Location
#File location: Full folder name with .SAFE extension
#This folder should contain "AUX_DATA", "DATASTRIP", "GRANULE", "HTML", etc. as subfolders
Level_1C_Products <- "C:/temp/S2A_MSIL1C_20180609T161901_N0206_R040_T16SGJ_20180609T194342.SAFE"

#Define Level 2A Output Location
Level_2A_Output <- "C:/temp/s2a"

#Run Sen2cor
#Process takes ~45 minutes
sen2cor(Level_1C_Products, outdir = Level_2A_Output)
