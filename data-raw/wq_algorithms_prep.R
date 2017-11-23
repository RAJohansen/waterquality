library(tidyverse)

wq_algorithms = tribble(
  ~name, ~funs,~worldview2, ~sentinel2, ~landsat8, ~modis, ~meris,
  "Al10SABI", Al10SABI, c(7,5,1,3), c(9, 4, 2, 3), c(5,4,2,3), NA, c(13,7,2,4),
  "Am092Bsub", Am092Bsub, c(6,5), c(5, 4), NA, c(2,1), c(8,6), 
  "Be16FLHviolet", Be16FLHviolet, c(3,5,1), c(3, 4, 2), c(3,4,1), NA, c(5,7,2),
  "Be162BsubPhy", Be162BsubPhy, c(6, 4), c(6,4), c(5,4), NA, c(9,6),
  "Be16NDPhyI", Be16NDPhyI, c(6,4), c(6, 4), NA, NA, c(9,6),
  "HU103BDA", HU103BDA, c(4,3,6), c(5, 4, 6), NA, NA, c(6,5,9),
  "Kn07KIVU", Kn07KIVU, c(1,5,3), c(2, 4, 3), c(2,4,3), NA, c(2,7,4),
  "MI092BDA", MI092BDA, c(6,5), c(6, 4), NA, NA, c(9,8),
  "MM12NDCI", MM12NDCI, c(6,5), c(5, 4), c(5,4), c(2,1), c(9,7),
  "SI052BDA", SI052BDA, c(6,4), c(5, 4), NA, NA, c(9,6),
  "Be16NDTIblue", Be16NDTIblue, c(4,2), c(4, 2), c(4,2), NA, c(7,2),
  "Be16NDTIviolet", Be16NDTIviolet, c(4,1), c(4, 1), c(4,1), NA, c(7,1),  
  "Be16FLHBlueRedNIR", Be16FLHBlueRedNIR, c(4,7,2), c(4, 9, 2), c(4,5,2), NA, c(7,13,2),
  "Be16FLHGreenRedNIR", Be16FLHGreenRedNIR, c(4,7,3), c(4, 9, 3), c(4,5,3), NA, c(7,13,5),
  "Be16FLHVioletRedNIR", Be16FLHVioletRedNIR, c(4,7,1), c(4, 9, 1), c(4,5,1), NA, c(7,13,1),
  "TurbBe16GreenPlusRedBothOverViolet", TurbBe16GreenPlusRedBothOverViolet, c(3,4,1), c(3, 4, 1), c(3,4,1), NA, c(5,7,2),
  "TurbBe16RedOverViolet", TurbBe16RedOverViolet, c(4,1), c(4, 1), c(4,1), NA, c(7,1),
  "TurbBow06RedOverGreen", TurbBow06RedOverGreen, c(4,3), c(4, 3), c(4,3), NA, c(7,5),
  "TurbChip09NIROverGreen", TurbChip09NIROverGreen, c(7,3), c(9, 3), c(5,3), NA, c(13, 5),
  "TurbDox02NIRoverRed", TurbDox02NIRoverRed, c(7,5), c(9, 4), c(5,4), c(2,1), c(13,7),
  "TurbFrohn09GreenPlusRedBothOverBlue", TurbFrohn09GreenPlusRedBothOverBlue, c(3,4,2), c(3, 4, 2), c(3,4,2), NA, c(5,7,2),
  "TurbHarr92NIR", TurbHarr92NIR, c(7), c(9), c(5), c(2), c(13),  
  "TurbLath91RedOverBlue", TurbLath91RedOverBlue, c(4,2), c(4, 2), c(4,2), NA, c(7,2),
  "TurbMoore80Red", TurbMoore80Red, c(4), c(4), c(4), c(1), c(7)
  #MM143BDAopt
  #MM143BDAver3merisver
  #SY002BDA
  #Be16NDPhyIedge
  #Be163BD
  #SM122BDA
  #Da032BDA
  #Stu16Phy
  #Stu16PhyFLH
  #Zh10FLH
  #Go04MCIalt
)

# save data
devtools::use_data(wq_algorithms, overwrite = TRUE)
