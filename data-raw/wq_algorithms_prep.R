library(tidyverse)

wq_algorithms = tribble(
  ~name, ~funs, ~sentinel2,
  "Al10SABI", Al10SABI, c(9, 4, 2, 3),
  "Am092Bsub", Am092Bsub, c(5, 4),
  # "Be162Bdiv", Be162Bdiv, c(6, 5),
  "Be16FLHviolet", Be16FLHviolet, c(3, 4, 2),
  # "Be162Bsub", Be162Bsub, c(6, 4),
  # "Be162Bsubedge", Be162Bsubedge, c(6, 5),
  "Be16NDPhyI", Be16NDPhyI, c(6, 4),
  # "Be16NDPhyIedge", Be16NDPhyIedge, c(6, 5),
  "HU103BDA", HU103BDA, c(5, 4, 6),
  "Kn07KIVU", Kn07KIVU, c(2, 4, 3),
  "MI092BDA", MI092BDA, c(6, 4),
  "MM12NDCI", MM12NDCI, c(5, 4, 4),
  "SI052BDA", SI052BDA, c(5, 4),
  "Be16NDTIblue", Be16NDTIblue, c(4, 2),
  "Be16NDTIviolet", Be16NDTIviolet, c(4, 2), 
  "Be16FLHBlueRedNIR", Be16FLHBlueRedNIR, c(4, 9, 2),
  "Be16FLHGreenRedNIR", Be16FLHGreenRedNIR, c(4, 9, 3),
  "Be16FLHVioletRedNIR", Be16FLHVioletRedNIR, c(4, 9, 2),
  "TurbBe16GreenPlusRedBothOverViolet", TurbBe16GreenPlusRedBothOverViolet, c(3, 4, 2),
  "TurbBe16RedOverViolet", TurbBe16RedOverViolet, c(4, 2),
  "TurbBow06RedOverGreen", TurbBow06RedOverGreen, c(4, 3),
  "TurbChip09NIROverGreen", TurbChip09NIROverGreen, c(9, 3),
  "TurbDox02NIRoverRed", TurbDox02NIRoverRed, c(9, 4),
  "TurbFrohn09GreenPlusRedBothOverBlue", TurbFrohn09GreenPlusRedBothOverBlue, c(3, 4, 2),
  "TurbHarr92NIR", TurbHarr92NIR, c(9),
  "TurbLath91RedOverBlue", TurbLath91RedOverBlue, c(4, 2),
  "TurbMoore80Red", TurbMoore80Red, c(4)#,
  # "Be163BDA", Be163BDA, c(4, 5, 9)
)

# save data
devtools::use_data(wq_algorithms, overwrite = TRUE)
