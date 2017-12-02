
<!-- README.md is generated from README.Rmd. Please edit that file -->
waterquality
============

The goal of **waterquality** is to convert satellite-reflectance imagery to a host of pre-defined water quality algorithms designed for the detection of cholorophyll-a, blue-green algae (Phycocyanin), and Turbidity. This package is able to process the following sensor configurations: WorldView-2, Sentinel-2, Landsat-8, MODIS, and MERIS sensors.

Installation
------------

You can install waterquality from github with:

``` r
# install.packages("devtools")
devtools::install_github("RAJohansen/waterquality")
```

Example
-------

This is a basic example which shows you how to solve a common problem:

``` r
library(waterquality)
library(raster)
#> Loading required package: sp
s2 = stack(system.file("raster/S2_Taylorsville.tif", package = "waterquality"))
s2_two_alg = wq_calc(s2, alg = c("TurbChip09NIROverGreen", "Am092Bsub"), sat = "sentinel2")
#> Am092Bsub calculated!
#> TurbChip09NIROverGreen calculated!
plot(s2_two_alg)
```

![](man/figures/README-example-1.png)

Contribution
------------

Feel free to submit issues and enhancement requests.
