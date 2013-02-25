all: project.mml layers/10m_ocean.shp layers/water_polygons.index
mml: project.mml


# Shapefiles

layers/water_polygons.zip:
	mkdir -p layers
	curl -Lo layers/water_polygons.zip http://data.openstreetmapdata.com/water-polygons-split-3857.zip
layers/water_polygons.shp: layers/water_polygons.zip
	unzip -j -d layers layers/water_polygons.zip '*/water_polygons.*'
	touch layers/water_polygons.shp
layers/water_polygons.index: layers/water_polygons.shp
	shapeindex layers/water_polygons.shp

layers/10m-ocean.zip:
	curl -Lo layers/10m-ocean.zip http://mapbox-geodata.s3.amazonaws.com/natural-earth-1.4.0/physical/10m-ocean.zip
layers/10m_ocean.shp: layers/10m-ocean.zip
	unzip -j -d layers layers/10m-ocean.zip '10m_ocean.*'
	touch layers/10m_ocean.shp


# Project file

project.mml: project.yml
	js-yaml --to-json  project.yml > project.mml
