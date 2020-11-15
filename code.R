#geoprocessing with R.
#chapter 1. Required libraries and importing shapefiles & plotting shapefiles

# installing rgdal and sp packages.
library(rgdal)
#changing the working directory to be same as our shapefiles.
setwd("D:\\[2]Atölye 7\\STRATEJİK MEKANSAL PLANLAMA\\ilçe çalışmaları\\Türkiye_İl_İlçe_Shape\\Türkiye_İl_İlçe_Shape")

sp_data <- readOGR(dsn = ".",layer = "il_sinir")

#first give your data, then select color with col, backround with bg, linewidth wit lw
plot(sp_data, col="white", bg="red", lwd= 2)

#for better plots, we're going to use ggplot,
#but to use ggplot, we must convert our spatial data to a regular dataframe,
#we do this with fortify.
library(ggplot2)
df <- fortify(sp_data)

ggplot()+
  geom_polygon(data = df, aes(x = long, y=lat, group = group))+
  theme_bw()

#so now, we succesfuly plot our shapefile using ggplot. 