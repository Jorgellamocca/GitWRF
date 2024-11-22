#!/bin/bash

# Define la URL base
BASE_URL="https://nomads.ncep.noaa.gov/pub/data/nccf/com/gfs/prod/gfs.20241121/00/atmos/"

# Obtén el directorio de trabajo actual
CURRENT_DIR=$(pwd)

# Nombre de la carpeta de descarga
DIR="${CURRENT_DIR}/20241121"

# Crea la carpeta si no existe
mkdir -p $DIR

# Cambia al directorio de descarga
cd $DIR

# Itera sobre el rango de horas
for i in {000..048..3}; do 
	    FILE="gfs.t00z.pgrb2.0p25.f$i"
	        URL="${BASE_URL}${FILE}"

		    echo "Descargando ${FILE} en $DIR..."
		        wget -N $URL
		done

		echo "Descarga completa en la carpeta $DIR."

