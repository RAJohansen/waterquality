#' Al10SABI algorithm
#'
#' Applies the Al10SABI algorithm
#'
#' @param w857 numeric. Value at wavelength of 678 nm
#' @param w644 numeric. Value at wavelength of 667 nm
#' @param w458 numeric. Value at wavelength of 678 nm
#' @param w529 numeric. Value at wavelength of 667 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Alawadi, F. Detection of surface algal blooms using the newly developed algorithm surface algal bloom index (SABI). Proc. SPIE 2010, 7825.
#'
#' @rdname algorithms
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
#' @rdname algorithms
#' @export
Am092Bsub <- function(w681, w655){
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
#' @references Amin et al. (2009)
#'
#' @rdname algorithms
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
#' @references Beck et al. (2016)
#'
#' @rdname algorithms
#' @export
Be16FLHblue <- function(w529, w644, w458){
  (w529)-(w644+(w458-w644))
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
#' @references Beck et al. (2016)
#'
#' @rdname algorithms
#' @export
Be16FLHviolet <- function(w529, w644, w429){
  (w529)-(w644+(w429-w644))
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
#' @references Beck et al. (2017)
#'
#' @rdname algorithms
#' @export
Be16NDPhyI <- function(w700, w622){
  (w700-w622)/(w700+w622)
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
#' @references Dekker (1993)
#'
#' @rdname algorithms
#' @export
De933BDA <- function(w600, w648, w625){
  (w600-w648-w625)
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
#' @references Gitelson et al. (2003)
#'
#' @rdname algorithms
#' @export
Gi033BDA <- function(w672, w715, w757){
  ((1/w672)-(1/w715))*(w757)
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
#' @references Gower et al. (2004)
#'
#' @rdname algorithms
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
#' @references Hunter et al. (2008)
#'
#' @rdname algorithms
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
#' @references Kneubuhler et al. (2007)
#'
#' @rdname algorithms
#' @export
Kn07KIVU <- function(w458, w644, w529){
  (w458-w644)/(w529)
}

#' Ku15PhyCI algorithm
#'
#' Applies the Ku15PhyCI algorithm
#'
#' @param w681 numeric. Value at wavelength of 458 nm
#' @param w665 numeric. Value at wavelength of 644 nm
#' @param w709 numeric. Value at wavelength of 529 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Kudela et al. (2015)
#'
#' @rdname algorithms
#' @export
Ku15PhyCI <- function(w458, w644, w529){
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
#' @references Mishra et al. (2009)
#'
#' @rdname algorithms
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
#' @references Mishra et al. (2009)	
#'
#' @rdname algorithms
#' @export
MM092BDA <- function(w724, w600){
  w724/w600
}

#' MM12NDCI algorithm
#'
#' Applies the MM12NDCI algorithm
#'
#' @param w714 numeric. Value at wavelength of 714 nm
#' @param w686 numeric. Value at wavelength of 686 nm
#' @param w683 numeric. Value at wavelength of 683 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Mishra and Mishra (2012)
#'
#' @rdname algorithms
#' @export
MM12NDCI <- function(w714, w686, w683){
  (w714-w686)/(w714+w683)
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
#' @references Mishra and Mishra (2014)
#'
#' @rdname algorithms
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
#' @references Simis et al. (2005)
#'
#' @rdname algorithms
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
#' @references S. Mishra (2012)
#'
#' @rdname algorithms
#' @export
SM122BDA <- function(w709, w600){
  (w709/w600)
}

#' SM122BDA algorithm
#'
#' Applies the SM122BDA algorithm
#'
#' @param w650 numeric. Value at wavelength of 650 nm
#' @param w625 numeric. Value at wavelength of 625 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Schalles and Yacobi (2000)
#'
#' @rdname algorithms
#' @export
SM122BDA <- function(w650, w625){
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
#' @rdname algorithms
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
#' @rdname algorithms
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
#' @rdname algorithms
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
#' @rdname algorithms
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
#' @rdname algorithms
#' @export
Be16FLHVioletRedNIR <- function(w658, w857, w444){
  (w658)-(w857+(w444-w857))
}
