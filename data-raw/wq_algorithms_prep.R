library(tidyverse)
library(waterquality)

wq_algorithms = tribble(
  ~name, ~funs,~worldview2, ~sentinel2, ~landsat8, ~modis, ~meris, ~type,
  "Al10SABI", Al10SABI, c(7, 5, 2, 3), c(9, 4, 2, 3), c(5, 4, 2, 3), NA, c(13, 7, 2, 4), "Chlorophyll",
  "Am092Bsub", Am092Bsub, NA, c(5, 4), NA, NA, c(8, 7), "Chlorophyll",
  "Am09KBBI", Am09KBBI, NA, c(9,8), NA, NA, c(8,7), "Phycocyanin",
  "Be16FLHblue", Be16FLHblue, c(3, 5, 2), c(2, 4, 2), c(3, 4, 2), NA, c(4, 7, 2),"Chlorophyll",  
  "Be16FLHviolet", Be16FLHviolet, c(3, 5, 1), c(2, 4, 1), c(3, 4, 1), NA, c(4, 7, 1),"Chlorophyll",
  "Be16NDPhyI", Be16NDPhyI, c(6, 4), NA, NA, NA, c(9, 6), "Phycocyanin",
  "De933BDA", De933BDA, c(4,5,4), NA, NA, NA, c(6,7,6), "Chlorophyll",
  "Gi033BDA", Gi033BDA, NA, c(4, 5, 6), NA, NA, c(8, 9, 10), "Chlorophyll", 
  "Go04MCI", Go04MCI, c(6, 5, 6), c(5, 4, 6), NA, NA, c(9, 8, 10), "Phycocyanin",
  "HU103BDA", HU103BDA, c(4, 4, 6), NA, NA, NA, c(6, 6, 9), "Phycocyanin",
  "Kn07KIVU", Kn07KIVU, c(2, 5, 3), NA, c(1, 4, 3), NA, c(2, 7, 4), "Chlorophyll", 
  "Ku15PhyCI", Ku15PhyCI, c(5, 5, 6), c(4, 4, 5), NA, NA, c(8, 7, 9),  "Phycocyanin", 
  "MI092BDA", MI092BDA, c(6,4), NA, NA, NA, c(9, 6), "Phycocyanin", 
  "MM092BDA", MM092BDA, c(6,4), NA, NA, NA, c(9,6), "Phycocyanin",
  "MM12NDCI", MM12NDCI, c(6, 5), c(5, 4), NA, NA, c(9, 8),"Chlorophyll",
  "MM143BDAopt", MM143BDAopt, c(4,5, 6), NA, NA, NA, c(6, 7, 9), "Phycocyanin",
  "SI052BDA", SI052BDA, c(6, 4), NA, NA, NA, c(9, 6),"Phycocyanin",
  "SM122BDA", SM122BDA, c(6, 4), NA, NA, NA, c(9, 6), "Phycocyanin",
  "SY002BDA", SY002BDA, c(5, 4), NA, NA, NA, c(7, 6), "Phycocyanin",
  "Be16NDTIblue", Be16NDTIblue, c(5, 2), c(4, 2), c(4, 2), NA, c(7, 2), "Chlorophyll",
  "Be16NDTIviolet", Be16NDTIviolet, c(5, 1), c(4, 1), c(4, 1), NA, c(7, 2),"Chlorophyll",  
  "Be16FLHBlueRedNIR", Be16FLHBlueRedNIR, c(5, 7, 2), c(4, 9, 2), c(4, 5, 2), NA, c(7, 13, 2),"Phycocyanin",
  "Be16FLHGreenRedNIR", Be16FLHGreenRedNIR, c(5, 7, 4), c(4, 9, 3), c(4, 5, 3), NA, c(7, 13, 5),"Phycocyanin",
  "Be16FLHVioletRedNIR", Be16FLHVioletRedNIR, c(5, 7, 1), c(4, 9, 1), c(4, 5, 1), NA, c(7, 13, 2),"Phycocyanin",
  "Wy08CI", Wy08CI, c(5, 5, 6), c(4, 4, 5), NA, NA, c(8, 7, 9), "Phycocyanin",
  "Da052BDA", Da052BDA, c(6, 5), c(5, 4), NA, NA, c(9, 7), "Phycocyanin",
  "Zh10FLH", Zh10FLH, c(5, 6, 5), c(4, 5, 4), NA, NA, c(8, 9, 7), "Chlorophyll",
  "Be162B643sub629", Be162B643sub629, c(5, 4), NA, NA, NA, c(7,6), "Phychocyanin",
  "Be162B700sub601", Be162B700sub601, c(6, 4), NA, NA, NA, c(9, 6), "Phycocyanin", 
  "Be162BsubPhy", Be162BsubPhy, c(6, 4), NA, NA, NA, c(9, 6), "Phycocyanin",
  "Be16MPI", Be16MPI, c(4, 4, 5), NA, NA, NA, c(6, 6, 7), "Phycocyanin",
  "Be16NDPhyI644over615", Be16NDPhyI644over615, c(5, 4), NA, NA, NA, c(7, 6), "Phycocyanin",
  "Be16NDPhyI644over629", Be16NDPhyI644over629, c(5, 4), NA, NA, NA, c(7, 6), "Phycocyanin",
  "Be16Phy2BDA644over629", Be16Phy2BDA644over629, c(5, 4), NA, NA, NA, c(7, 6), "Phycocyanin",
  "Ku15SLH", Ku15SLH, c(6, 5), c(5, 4), NA, NA, c(9, 7), "Phycocyanin",
  "MM12NDCIalt", MM12NDCIalt, c(6, 5), c(5, 4), NA, NA, c(9, 7), "Phycocyanin",
  "TurbBe16GreenPlusRedBothOverViolet", TurbBe16GreenPlusRedBothOverViolet, c(3, 5, 1), c(3, 4, 1), c(3, 4, 1), NA, c(5, 7, 2), "Turbidity",
  "TurbBe16RedOverViolet", TurbBe16RedOverViolet, c(5, 1), c(4, 1), c(4, 1), NA, c(7, 2),"Turbidity",
  "TurbBow06RedOverGreen", TurbBow06RedOverGreen, c(5, 3), c(4, 3), c(4, 3), NA, c(7, 5),"Turbidity",
  "TurbChip09NIROverGreen", TurbChip09NIROverGreen, c(7, 3), c(9, 3), c(5, 3), NA, c(13, 5),"Turbidity",
  "TurbDox02NIRoverRed", TurbDox02NIRoverRed, c(7, 5), c(9, 4), c(5, 4), c(2, 1), c(13, 7),"Turbidity",
  "TurbFrohn09GreenPlusRedBothOverBlue", TurbFrohn09GreenPlusRedBothOverBlue, c(3, 5, 1), c(3, 4, 2), c(3, 4, 2), NA, c(5, 7, 2),"Turbidity",
  "TurbHarr92NIR", TurbHarr92NIR, c(7), c(9), c(5), c(2), c(13), "Turbidity",
  "TurbLath91RedOverBlue", TurbLath91RedOverBlue, c(5, 2), c(4, 2), c(4, 2), NA, c(7, 2), "Turbidity",
  "TurbMoore80Red", TurbMoore80Red, c(5), c(4), c(4), c(1), c(7), "Turbidity"
)

wq_algorithms = wq_algorithms %>% 
  gather(satellite, bands, worldview2:meris) %>% 
  filter(!is.na(bands))

# save data
devtools::use_data(wq_algorithms, overwrite = TRUE)
