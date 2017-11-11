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
#' @param w678 numeric. Value at wavelength of 678 nm
#' @param w667 numeric. Value at wavelength of 667 nm
#'
#' @return RasterLayer or numeric
#'
#' @references Amin, R.; Zhou, J.; Gilerson, A.; Gross, B.; Moshary, F.; Ahmed, S. Novel optical techniques for detecting and classifying toxic dinoflagellate Karenia brevis blooms using satellite imagery. Opt. Express 2009, 17, 9126–9144.
#'
#' @rdname algorithms
#' @export
Am092Bsub <- function(w678, w667){
        w678 - w667
}
