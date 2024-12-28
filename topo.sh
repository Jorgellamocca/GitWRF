#!/bin/bash
# Crear directorio de descarga
mkdir -p wps_geog_files
cd wps_geog_files
# Descargar y descomprimir el primer archivo, que creará la carpeta WPS_GEOG
wget https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_high_res_mandatory.tar.gz
tar -xzf geog_high_res_mandatory.tar.gz
rm -f geog_high_res_mandatory.tar.gz
# Cambiar al directorio WPS_GEOG
cd WPS_GEOG
# Descargar y descomprimir los demás archivos en la carpeta WPS_GEOG
# Archivo 2
wget https://www2.mmm.ucar.edu/wrf/src/wps_files/topobath_30s.tar.bz2
tar -xjf topobath_30s.tar.bz2
rm -f topobath_30s.tar.bz2
# Archivo 3
wget https://www2.mmm.ucar.edu/wrf/src/wps_files/orogwd3_10m.tar.bz2
tar -xjf orogwd3_10m.tar.bz2
rm -f orogwd3_10m.tar.bz2
# Archivo 4
wget https://www2.mmm.ucar.edu/wrf/src/wps_files/lake_depth.tar.bz2
tar -xjf lake_depth.tar.bz2
rm -f lake_depth.tar.bz2
# Archivo 5
wget https://www2.mmm.ucar.edu/wrf/src/wps_files/geog_thompson28_chem.tar.gz
tar -xzf geog_thompson28_chem.tar.gz
rm -f geog_thompson28_chem.tar.gz
# Archivo 6
wget https://www2.mmm.ucar.edu/wrf/src/wps_files/irrigation.tar.gz
tar -xzf irrigation.tar.gz
rm -f irrigation.tar.gz
echo "Descarga y descompresión completadas en WPS_GEOG."
