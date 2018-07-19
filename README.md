
<!-- README.md is generated from README.Rmd. Please edit that file -->

[![CRAN
status](http://www.r-pkg.org/badges/version/waterquality)](https://cran.r-project.org/package=waterquality)
[![Build
Status](https://travis-ci.org/RAJohansen/waterquality.png?branch=master)](https://travis-ci.org/RAJohansen/waterquality)
[![codecov](https://codecov.io/gh/RAJohansen/waterquality/branch/master/graph/badge.svg)](https://codecov.io/gh/RAJohansen/waterquality)
[![CRAN RStudio mirror
downloads](http://cranlogs.r-pkg.org/badges/waterquality)](https://cran.r-project.org/package=waterquality)

# waterquality

The goal of **waterquality** is to convert satellite-reflectance imagery
to a host of pre-defined water quality algorithms designed for the
detection of cholorophyll-a, blue-green algae (Phycocyanin), and
Turbidity. This package is able to process the following sensor
configurations: WorldView-2, Sentinel-2, Landsat-8, MODIS, and MERIS
sensors.

## Installation

You can install waterquality from github with:

``` r
# install.packages("devtools")
devtools::install_github("RAJohansen/waterquality")
```

## Example

The main function in this package is `wq_calc()`:

``` r
library(waterquality)
library(raster)
#> Loading required package: sp
s2 = stack(system.file("raster/S2_Harsha.tif", package = "waterquality"))
s2_two_alg = wq_calc(s2, alg = c("Be16FLHGreenRedNIR", "Am092Bsub"), sat = "sentinel2")
#> Am092Bsub calculated!
#> Be16FLHGreenRedNIR calculated!
plot(s2_two_alg)
```

![](man/figures/README-example-1.png)<!-- -->

## Contribution

Feel free to submit issues and enhancement requests.
