#geoprocessing with R.
#chapter 1. Required libraries and importing shapefiles & plotting shapefiles

# installing rgdal and sp packages.
library(rgdal)
#changing the working directory to be same as our shapefiles.
setwd("D:\kaggle_books\turkey-latest-free.shp")

data <- readOGR(dsn = ".",layer = "gis_osm_buildings_a_free_1")