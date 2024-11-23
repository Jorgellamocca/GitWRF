#!/bin/bash

# Definir la fecha de descarga
fecha_sst=20241023

# Crear la carpeta con la fecha si no existe
mkdir -p "$fecha_sst"

# Descargar el archivo y guardarlo en la carpeta correspondiente
wget --no-check-certificate -P "$fecha_sst" "https://nomads.ncep.noaa.gov/pub/data/nccf/com/nsst/prod/nsst.${fecha_sst}/rtgssthr_grb_0.083.grib2"

echo "Descarga completada en la carpeta $fecha_sst."
