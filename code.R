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

#SECTİON 2 -- Raster Data using R
setwd("D:\\[4] OKUL GENEL\\ASTGTMV003_N40E027")

library(raster)
raster <- raster("ASTGTMV003_N40E027_dem.tif") #read our raster with raster function
raster <- aggregate(raster, fact = 2) #to resample raster because ı want it to work faster

plot(raster)
#again we're going to create more customised plot with ggplot2 library
library(ggplot2)
#firstly and again, we need to convert our spatial variable to dataframe

dataFrame <- as.data.frame(raster, xy=T)
ggplot()+
  geom_tile(data = dataFrame, aes(x = x, y=y, fill=ASTGTMV003_N40E027_dem ))+
  theme_bw()

#now lets do some geoprocessing.
#to calculate slope with our DEM values, we use terrain function  

slopez <- terrain(data=raster, opt="slope", units="degrees")
slope_df <- as.data.frame(slopez, xy = T)
ggplot()+
  geom_tile(data = slope_df, aes(x = x, y=y, fill=slope ))+
  theme_bw()
