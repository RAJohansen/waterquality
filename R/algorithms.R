#' Al10SABI algorithm
#'
#' Applies the Al10SABI algorithm
#'
#' @param w857 numeric. Value at wavelength of 857 nm
#' @param w644 numeric. Value at wavelength of 644 nm
#' @param w458 numeric. Value at wavelength of 458 nm
#' @param w529 numeric. Value at wavelength of 529 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Alawadi, F. Detection of surface algal blooms using the newly developed algorithm surface algal bloom index (SABI). Proc. SPIE 2010, 7825.
#'
#' @family algorithms
#' @export
Al10SABI <- function(w857, w644, w458, w529){
        (w857 - w644) / (w458 + w529)
}

#' Am092Bsub algorithm
#'
#' Applies the Am092Bsub algorithm
#'
#' @param w681 numeric. Value at wavelength of 681 nm
#' @param w665 numeric. Value at wavelength of 665 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Amin, R.; Zhou, J.; Gilerson, A.; Gross, B.; Moshary, F.; Ahmed, S. Novel optical techniques for detecting and classifying toxic dinoflagellate Karenia brevis blooms using satellite imagery. Opt. Express 2009, 17, 9126–9144.
#'
#' @family algorithms
#' @export
Am092Bsub <- function(w681, w665){
        w681 - w665
}

#' Am09KBBI algorithm
#'
#' Applies the Am09KBBI algorithm
#'
#' @param w686 numeric. Value at wavelength of 686 nm
#' @param w658 numeric. Value at wavelength of 658 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Amin, R.; Zhou, J.; Gilerson, A.; Gross, B.; Moshary, F.; Ahmed, S.; Novel optical techniques for detecting and classifying toxic dinoflagellate Karenia brevis blooms using satellite imagery, Optics Express, 2009, 17, 11, 1-13.
#'
#' @family algorithms
#' @export
Am09KBBI <- function(w686, w658){
  (w686 - w658)/(w686 + w658)
}

#' Be16FLHblue algorithm
#'
#' Applies the Be16FLHblue algorithm
#'
#' @param w529 numeric. Value at wavelength of 529 nm
#' @param w644 numeric. Value at wavelength of 644 nm
#' @param w458 numeric. Value at wavelength of 458 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck, R.A. and 22 others; Comparison of satellite reflectance algorithms for estimating chlorophyll-a in a temperate reservoir using coincident hyperspectral aircraft imagery and dense coincident surface observations, Remote Sens. Environ., 2016, 178, 15-30.
#'
#' @family algorithms
#' @export
Be16FLHblue <- function(w529, w644, w458){
  (w529) - (w644 + (w458 - w644))
}

#' Be16FLHviolet algorithm
#'
#' Applies the Be16FLHviolet algorithm
#'
#' @param w529 numeric. Value at wavelength of 529 nm
#' @param w644 numeric. Value at wavelength of 644 nm
#' @param w429 numeric. Value at wavelength of 429 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck, R.A. and 22 others; Comparison of satellite reflectance algorithms for estimating chlorophyll-a in a temperate reservoir using coincident hyperspectral aircraft imagery and dense coincident surface observations, Remote Sens. Environ., 2016, 178, 15-30.
#'
#' @family algorithms
#' @export
Be16FLHviolet <- function(w529, w644, w429){
  (w529) - (w644 + (w429 - w644))
}

#' Be16NDPhyI algorithm
#'
#' Applies the Be16NDPhyI algorithm
#'
#' @param w700 numeric. Value at wavelength of 700 nm
#' @param w622 numeric. Value at wavelength of 622 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017) test
#'
#' @family algorithms
#' @export
Be16NDPhyI <- function(w700, w622){
  (w700 - w622) / (w700 + w622)
}

#' De933BDA algorithm
#'
#' Applies the De933BDA algorithm
#'
#' @param w600 numeric. Value at wavelength of 600 nm
#' @param w648 numeric. Value at wavelength of 648 nm
#' @param w625 numeric. Value at wavelength of 625 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Dekker, A.; Detection of the optical water quality parameters for eutrophic waters by high resolution remote sensing, Ph.D. thesis, 1993, Free University, Amsterdam.
#'
#' @family algorithms
#' @export
De933BDA <- function(w600, w648, w625){
  (w600 - w648 - w625)
}

#' Gi033BDA algorithm
#'
#' Applies the Gi033BDA algorithm
#'
#' @param w672 numeric. Value at wavelength of 672 nm
#' @param w715 numeric. Value at wavelength of 715 nm
#' @param w757 numeric. Value at wavelength of 757 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Gitelson, A.A.; U. Gritz, and M. N. Merzlyak.; Relationships between leaf chlorophyll content and spectral reflectance and algorithms for non-destructive chlorophyll assessment in higher plant leaves. J. Plant Phys. 2003, 160, 271-282.
#'
#' @family algorithms
#' @export
Gi033BDA <- function(w672, w715, w757){
  ((1 / w672) - (1 / w715)) * (w757)
}

#' Go04MCI algorithm
#'
#' Applies the Go04MCI algorithm
#'
#' @param w709 numeric. Value at wavelength of 709 nm
#' @param w681 numeric. Value at wavelength of 681 nm
#' @param w753 numeric. Value at wavelength of 753 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Gower, J.F.R.; Brown,L.; Borstad, G.A.; Observation of chlorophyll fluorescence in west coast waters of Canada using the MODIS satellite sensor. Can. J. Remote Sens., 2004, 30 (1), 17–25.
#'
#' @family algorithms
#' @export
Go04MCI <- function(w709, w681, w753){
  (w709-w681-(w753-w681))
}

#' HU103BDA algorithm
#'
#' Applies the HU103BDA algorithm
#'
#' @param w615 numeric. Value at wavelength of 615 nm
#' @param w600 numeric. Value at wavelength of 600 nm
#' @param w725 numeric. Value at wavelength of 725 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Hunter, P.D.; Tyler, A.N.; Willby, N.J.; Gilvear, D.J.; The spatial dynamics of vertical migration by Microcystis aeruginosa in a eutrophic shallow lake: A case study using high spatial resolution time-series airborne remote sensing.  Limn. Oceanogr. 2008, 53, 2391-2406.
#'
#' @family algorithms
#' @export
HU103BDA <- function(w615, w600, w725){
  (((1/w615)-(1/w600))-w725)
}

#' Kn07KIVU algorithm
#'
#' Applies the Kn07KIVU algorithm
#'
#' @param w458 numeric. Value at wavelength of 458 nm
#' @param w644 numeric. Value at wavelength of 644 nm
#' @param w529 numeric. Value at wavelength of 529 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Kneubuhler, M.; Frank T.; Kellenberger, T.W; Pasche N.; Schmid M.; Mapping chlorophyll-a in Lake Kivu with remote sensing methods. 2007, Proceedings of the Envisat Symposium 2007, Montreux, Switzerland 23–27 April 2007 (ESA SP-636, July 2007).
#'
#' @family algorithms
#' @export
Kn07KIVU <- function(w458, w644, w529){
  (w458-w644)/(w529)
}

#' Ku15PhyCI algorithm
#'
#' Applies the Ku15PhyCI algorithm
#'
#' @param w681 numeric. Value at wavelength of 681 nm
#' @param w665 numeric. Value at wavelength of 665 nm
#' @param w709 numeric. Value at wavelength of 709 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Kudela, R.M., Palacios, S.L., Austerberry, D.C., Accorsi, E.K., Guild, L.S.; Application of hyperspectral remote sensing to cyanobacterial blooms in inland waters, Torres-Perez, J., 2015, Remote Sens. Environ., 2015, 167, 1-10.
#'
#' @family algorithms
#' @export
Ku15PhyCI <- function(w681, w665, w709){
  -1*(w681-w665-(w709-w665))
}

#' MI092BDA algorithm
#'
#' Applies the MI092BDA algorithm
#'
#' @param w700 numeric. Value at wavelength of 700 nm
#' @param w600 numeric. Value at wavelength of 600 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Mishra, S.; Mishra, D.R.; Schluchter, W. M., A novel algorithm for predicting PC concentrations in cyanobacteria: A proximal hyperspectral remote sensing approach. Remote Sens., 2009, 1, 758–775.
#'
#' @family algorithms
#' @export
MI092BDA <- function(w700, w600){
  w700/w600
}

#' MM092BDA algorithm
#'
#' Applies the MM092BDA algorithm
#'
#' @param w724 numeric. Value at wavelength of 724 nm
#' @param w600 numeric. Value at wavelength of 600 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Mishra, S.; Mishra, D.R.; Schluchter, W. M., A novel algorithm for predicting PC concentrations in cyanobacteria: A proximal hyperspectral remote sensing approach. Remote Sens., 2009, 1, 758–775.
#'
#' @family algorithms
#' @export
MM092BDA <- function(w724, w600){
  w724/w600
}

#' MM12NDCI algorithm
#'
#' Applies the MM12NDCI algorithm
#'
#' @param w715 numeric. Value at wavelength of 714 nm
#' @param w686 numeric. Value at wavelength of 686 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Mishra, S.; and Mishra, D.R. Normalized difference chlorophyll index: A novel model for remote estimation of chlorophyll-a concentration in turbid productive waters, Remote Sens. Environ., 2012, 117, 394-406.
#'
#' @family algorithms
#' @export
MM12NDCI <- function(w715, w686){
  (w715 - w686) / (w715 + w686)
}

#' MM143BDAopt algorithm
#'
#' Applies the MM143BDAopt algorithm
#'
#' @param w629 numeric. Value at wavelength of 629 nm
#' @param w659 numeric. Value at wavelength of 659 nm
#' @param w724 numeric. Value at wavelength of 724 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Mishra, S.; Mishra, D.R.; A novel remote sensing algorithm to quantify phycocyanin in cyanobacterial algal blooms, Env. Res. Lett., 2014, 9 (11), DOI:10.1088/1748-9326/9/11/114003
#'
#' @family algorithms
#' @export
MM143BDAopt <- function(w629, w659, w724){
  ((1/w629)-(1/w659))*(w724)
}

#' SI052BDA algorithm
#'
#' Applies the SI052BDA algorithm
#'
#' @param w709 numeric. Value at wavelength of 709 nm
#' @param w620 numeric. Value at wavelength of 620 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Simis, S. G. H.; Peters, S.W. M.; Gons, H. J.; Remote sensing of the cyanobacteria pigment phycocyanin in turbid inland water. Limn. Oceanogr., 2005, 50, 237–245.
#'
#' @family algorithms
#' @export
SI052BDA <- function(w709, w620){
  (w709/w620)
}

#' SM122BDA algorithm
#'
#' Applies the SM122BDA algorithm
#'
#' @param w709 numeric. Value at wavelength of 709 nm
#' @param w600 numeric. Value at wavelength of 600 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Mishra, S. Remote sensing of cyanobacteria in turbid productive waters, PhD Dissertation. Mississippi State University, USA. 2012.
#'
#' @family algorithms
#' @export
SM122BDA <- function(w709, w600){
  (w709/w600)
}

#' SY002BDA algorithm
#'
#' Applies the SY002BDA algorithm
#'
#' @param w650 numeric. Value at wavelength of 650 nm
#' @param w625 numeric. Value at wavelength of 625 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Schalles, J.; Yacobi, Y. Remote detection and seasonal patterns of phycocyanin, carotenoid and chlorophyll-a pigments in eutrophic waters. Archiv fur Hydrobiologie, Special Issues Advances in Limnology, 2000, 55,153–168.
#'
#' @family algorithms
#' @export
SY002BDA <- function(w650, w625){
  (w650/w625)
}

#' Be16NDTIblue algorithm
#'
#' Applies the Be16NDTIblue algorithm
#'
#' @param w658 numeric. Value at wavelength of 658 nm
#' @param w458 numeric. Value at wavelength of 458 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be16NDTIblue <- function(w658, w458){
  (w658-w458)/(w658+w458)
}

#' Be16NDTIviolet algorithm
#'
#' Applies the Be16NDTIviolet algorithm
#'
#' @param w658 numeric. Value at wavelength of 658 nm
#' @param w444 numeric. Value at wavelength of 444 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be16NDTIviolet <- function(w658, w444){
  (w658-w444)/(w658+w444)
}

#' Be16FLHBlueRedNIR algorithm
#'
#' Applies the Be16FLHBlueRedNIR algorithm
#'
#' @param w658 numeric. Value at wavelength of 658 nm
#' @param w857 numeric. Value at wavelength of 857 nm
#' @param w458 numeric. Value at wavelength of 458 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be16FLHBlueRedNIR <- function(w658, w857, w458){
  (w658)-(w857+(w458-w857))
}

#' Be16FLHGreenRedNIR algorithm
#'
#' Applies the Be16FLHGreenRedNIR algorithm
#'
#' @param w658 numeric. Value at wavelength of 658 nm
#' @param w857 numeric. Value at wavelength of 857 nm
#' @param w558 numeric. Value at wavelength of 558 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be16FLHGreenRedNIR <- function(w658, w857, w558){
  (w658)-(w857+(w558-w857))
}

#' Be16FLHVioletRedNIR algorithm
#'
#' Applies the Be16FLHVioletRedNIR algorithm
#'
#' @param w658 numeric. Value at wavelength of 658 nm
#' @param w857 numeric. Value at wavelength of 857 nm
#' @param w444 numeric. Value at wavelength of 444 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be16FLHVioletRedNIR <- function(w658, w857, w444){
  (w658)-(w857+(w444-w857))
}

#' Wy08CI  algorithm
#'
#' Applies the Wy08CI  algorithm
#'
#' @param w686 numeric. Value at wavelength of 686 nm
#' @param w672 numeric. Value at wavelength of 672 nm
#' @param w715 numeric. Value at wavelength of 715 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Wynne, T. T., Stumpf, R. P., Tomlinson, M. C., Warner, R. A., Tester, P. A., Dyble, J.; Relating spectral shape to cyanobacterial blooms in the Laurentian Great Lakes. Int. J. Remote Sens., 2008, 29, 3665–3672. 
#'
#' @family algorithms
#' @export
Wy08CI  <- function(w686, w672, w715){
  -1 * ((w686)-(w672)-(w715-w672))
}

#' Da052BDA   algorithm
#'
#' Applies the Da052BDA   algorithm
#'
#' @param w714 numeric. Value at wavelength of 714 nm
#' @param w672 numeric. Value at wavelength of 672 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Wynne, T. T., Stumpf, R. P., Tomlinson, M. C., Warner, R. A., Tester, P. A., Dyble, J.; Relating spectral shape to cyanobacterial blooms in the Laurentian Great Lakes. Int. J. Remote Sens., 2008, 29, 3665–3672. 
#'
#' @family algorithms
#' @export
Da052BDA   <- function(w714, w672){
  (w714/w672)
}

#' Zh10FLH   algorithm
#'
#' Applies the Zh10FLH   algorithm
#'
#' @param w686 numeric. Value at wavelength of 686 nm
#' @param w715 numeric. Value at wavelength of 715 nm
#' @param w672 numeric. Value at wavelength of 672 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Zhao, D.Z.; Xing, X.G.; Liu, Y.G.; Yang, J.H.; Wang, L. The relation of chlorophyll-a concentration with the reflectance peak near 700 nm in algae-dominated waters and sensitivity of fluorescence algorithms for detecting algal bloom. Int. J. Remote Sens. 2010, 31, 39-48.
#'
#' @family algorithms
#' @export
Zh10FLH   <- function(w686, w715, w672){
  (w686)-(w715 + (w672-w715))
}

#' Be162B643sub629    algorithm
#'
#' Applies the Be162B643sub629    algorithm
#'
#' @param w644 numeric. Value at wavelength of 644 nm
#' @param w629 numeric. Value at wavelength of 729 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be162B643sub629    <- function(w644, w629){
  (w644-w629)
}

#' Be162B700sub601     algorithm
#'
#' Applies the Be162B700sub601     algorithm
#'
#' @param w700 numeric. Value at wavelength of 700 nm
#' @param w601 numeric. Value at wavelength of 601 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be162B700sub601     <- function(w700, w601){
  (w700-w601)
}

#' Be162BsubPhy     algorithm
#'
#' Applies the Be162BsubPhy     algorithm
#'
#' @param w715 numeric. Value at wavelength of 715 nm
#' @param w615 numeric. Value at wavelength of 615 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be162BsubPhy   <- function(w715, w615){
  (w715-w615)
}

#' Be16MPI     algorithm
#'
#' Applies the Be16MPI     algorithm
#'
#' @param w615 numeric. Value at wavelength of 615 nm
#' @param w601 numeric. Value at wavelength of 601 nm
#' @param w644 numeric. Value at wavelength of 644 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be16MPI   <- function(w615, w601, w644){
  ((w615)-(w601)-(w644-w601))
}

#' Be16NDPhyI644over615     algorithm
#'
#' Applies the Be16NDPhyI644over615     algorithm
#'
#' @param w644 numeric. Value at wavelength of 644 nm
#' @param w615 numeric. Value at wavelength of 615 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be16NDPhyI644over615   <- function(w644, w615){
  (w644-w615)/(w644+w615)
}

#' Be16NDPhyI644over629     algorithm
#'
#' Applies the Be16NDPhyI644over629     algorithm
#'
#' @param w644 numeric. Value at wavelength of 644 nm
#' @param w629 numeric. Value at wavelength of 629 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be16NDPhyI644over629   <- function(w644, w629){
  (w644-w629)/(w644+w629)
}

#' Be16Phy2BDA644over629     algorithm
#'
#' Applies the Be16Phy2BDA644over629     algorithm
#'
#' @param w644 numeric. Value at wavelength of 644 nm
#' @param w629 numeric. Value at wavelength of 629 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
Be16Phy2BDA644over629   <- function(w644, w629){
  (w644/w629)
}

#' Ku15SLH     algorithm
#'
#' Applies the Ku15SLH     algorithm
#'
#' @param w715 numeric. Value at wavelength of 715 nm
#' @param w658 numeric. Value at wavelength of 658 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Kudela, R.M., Palacios, S.L., Austerberry, D.C., Accorsi, E.K., Guild, L.S.; Application of hyperspectral remote sensing to cyanobacterial blooms in inland waters, Torres-Perez, J., 2015, Remote Sens. Environ., 2015, 167, 1-10.
#'
#' @family algorithms
#' @export
Ku15SLH   <- function(w715, w658){
  ((w715)-(w658)+(w715-w658))
}

#' MM12NDCIalt     algorithm
#'
#' Applies the MM12NDCIalt     algorithm
#'
#' @param w700 numeric. Value at wavelength of 700 nm
#' @param w658 numeric. Value at wavelength of 658 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Mishra, S.; Mishra, D.R.; A novel remote sensing algorithm to quantify phycocyanin in cyanobacterial algal blooms, Env. Res. Lett., 2014, 9 (11), DOI:10.1088/1748-9326/9/11/114003
#'
#' @family algorithms
#' @export
MM12NDCIalt   <- function(w700, w658){
  ((w700-w658)/(w700+w658))
}

#' TurbBe16GreenPlusRedBothOverViolet     algorithm
#'
#' Applies the TurbBe16GreenPlusRedBothOverViolet     algorithm
#'
#' @param w558 numeric. Value at wavelength of 558 nm
#' @param w658 numeric. Value at wavelength of 658 nm
#' @param w444 numeric. Value at wavelength of 444 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
TurbBe16GreenPlusRedBothOverViolet   <- function(w558, w658, w444){
  ((w558+w658)/w444)
}

#' TurbBe16RedOverViolet     algorithm
#'
#' Applies the TurbBe16RedOverViolet     algorithm
#'
#' @param w658 numeric. Value at wavelength of 658 nm
#' @param w444 numeric. Value at wavelength of 444 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Beck et al. (2017)
#'
#' @family algorithms
#' @export
TurbBe16RedOverViolet   <- function(w658, w444){
  (w658/w444)
}

#' TurbBow06RedOverGreen     algorithm
#'
#' Applies the TurbBow06RedOverGreen     algorithm
#'
#' @param w658 numeric. Value at wavelength of 658 nm
#' @param w558 numeric. Value at wavelength of 558 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Bowers, D. G., and C. E. Binding. 2006. “The Optical Properties of Mineral Suspended Particles: A Review and Synthesis.” Estuarine Coastal and Shelf Science 67 (1–2): 219–230. doi:10.1016/j.ecss.2005.11.010.
#'
#' @family algorithms
#' @export
TurbBow06RedOverGreen   <- function(w658, w558){
  (w658/w558)
}

#' TurbChip09NIROverGreen     algorithm
#'
#' Applies the TurbChip09NIROverGreen     algorithm
#'
#' @param w857 numeric. Value at wavelength of 857 nm
#' @param w558 numeric. Value at wavelength of 558 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Chipman, J. W.; Olmanson, L.G.; Gitelson, A.A.; Remote sensing methods for lake management: A guide for resource managers and decision-makers. 2009, Developed by the North American Lake Management Society in collaboration with Dartmouth College, University of Minnesota, and University of Nebraska for the United States Environmental Protection Agency.
#'
#' @family algorithms
#' @export
TurbChip09NIROverGreen   <- function(w857, w558){
  (w857/w558)
}

#' TurbDox02NIRoverRed     algorithm
#'
#' Applies the TurbDox02NIRoverRed     algorithm
#'
#' @param w857 numeric. Value at wavelength of 857 nm
#' @param w658 numeric. Value at wavelength of 658 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Doxaran, D., Froidefond, J.-M.; Castaing, P. ; A reflectance band ratio used to estimate suspended matter concentrations in sediment-dominated coastal waters, Remote Sens., 2002, 23, 5079-5085.
#'
#' @family algorithms
#' @export
TurbDox02NIRoverRed   <- function(w857, w658){
  (w857/w658)
}

#' TurbFrohn09GreenPlusRedBothOverBlue     algorithm
#'
#' Applies the TurbFrohn09GreenPlusRedBothOverBlue     algorithm
#'
#' @param w558 numeric. Value at wavelength of 558 nm
#' @param w658 numeric. Value at wavelength of 658 nm
#' @param w458 numeric. Value at wavelength of 458 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Frohn, R. C., & Autrey, B. C. (2009). Water quality assessment in the Ohio River using new indices for turbidity and chlorophyll-a with Landsat-7 Imagery. Draft Internal Report, U.S. Environmental Protection Agency.
#'
#' @family algorithms
#' @export
TurbFrohn09GreenPlusRedBothOverBlue   <- function(w558, w658, w458){
  ((w558+w658)/w458)
}

#' TurbHarr92NIR     algorithm
#'
#' Applies the TurbHarr92NIR     algorithm
#'
#' @param w857 numeric. Value at wavelength of 857 nm
#' 
#' @return RasterLayer or numeric
#'
#' @references Schiebe F.R., Harrington J.A., Ritchie J.C. Remote-Sensing of Suspended Sediments—the Lake Chicot, Arkansas Project. Int. J. Remote Sens. 1992;13:1487–1509.
#'
#' @family algorithms
#' @export
TurbHarr92NIR   <- function(w857){
  (w857)
}

#' TurbLath91RedOverBlue     algorithm
#'
#' Applies the TurbLath91RedOverBlue     algorithm
#'
#' @param w658 numeric. Value at wavelength of 658 nm
#' @param w458 numeric. Value at wavelength of 458 nm
#' 
#' @return RasterLayer or numeric
#'
#' @references Lathrop, R. G., Jr., T. M. Lillesand, and B. S. Yandell, 1991. Testing the utility of simple multi-date Thematic Mapper calibration algorithms for monitoring turbid inland waters. International Journal of Remote Sensing
#'
#' @family algorithms
#' @export
TurbLath91RedOverBlue   <- function(w658, w458){
  (w658/w458)
}

#' TurbMoore80Red     algorithm
#'
#' Applies the TurbMoore80Red     algorithm
#'
#' @param w658 numeric. Value at wavelength of 658 nm
#' 
#' @return RasterLayer or numeric
#'
#' @references Moore, G.K., Satellite remote sensing of water turbidity, Hydrological Sciences, 1980, 25, 4, 407-422.
#'
#' @family algorithms
#' @export
TurbMoore80Red   <- function(w658){
  (w658)
}