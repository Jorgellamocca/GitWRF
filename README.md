
##"Guía de Instalación de WRF/WPS en Ubuntu con WSL"##


# **1. Preparar el Entorno**

## Instalar WSL y Ubuntu

wsl --install -d Ubuntu
Reinicia el sistema si es necesario.

## Actualizar el sistema
bash
Copiar código
sudo apt update && sudo apt upgrade -y
Instalar dependencias básicas
bash
Copiar código
sudo apt install build-essential gcc gfortran libjpeg-dev zlib1g-dev m4 -y

## 2. Instalar Librerías Requeridas
Instalar NetCDF
bash
Copiar código
sudo apt install libnetcdf-dev netcdf-bin libnetcdff-dev -y
Instalar MPICH
bash
Copiar código
sudo apt install mpich -y
Instalar JasPer (opcional)
bash
Copiar código
sudo apt install libjasper-dev -y
Instalar otras dependencias
bash
Copiar código
sudo apt install libhdf5-dev libcurl4-openssl-dev -y

## 3. Descargar WRF y WPS
Descargar código fuente
bash
Copiar código
wget https://github.com/wrf-model/WRF/archive/refs/tags/v4.6.tar.gz
wget https://github.com/wrf-model/WPS/archive/refs/tags/v4.6.tar.gz
Extraer archivos
bash
Copiar código
tar -xvf v4.6.tar.gz
tar -xvf WPS-v4.6.tar.gz

## 4. Configurar y Compilar WRF
Navegar al directorio WRF
bash
Copiar código
cd WRF-4.6
Configurar WRF
bash
Copiar código
./configure
Selecciona la opción adecuada ("Linux (gfortran/gcc)" o "Linux (dmpar)").

Compilar WRF
bash
Copiar código
./compile em_real &> compile.log
tail compile.log

## 5. Configurar y Compilar WPS
Navegar al directorio WPS
bash
Copiar código
cd ../WPS-4.6
Configurar WPS
bash
Copiar código
./configure
Selecciona la misma opción de compilación que en WRF.

Compilar WPS
bash
Copiar código
./compile &> compile.log

## 6. Descargar Datos Geográficos
Descargar y descomprimir datos
bash
Copiar código
mkdir WPS_GEOG
tar -xvf geog_complete.tar.gz -C WPS_GEOG
Configurar entorno de datos en WPS
Edita namelist.wps y ajusta geog_data_path para apuntar a WPS_GEOG.

## 7. Configuración Adicional
Establecer variables de entorno
Edita ~/.bashrc y agrega:

bash
Copiar código
export WRF_DIR=~/WRF-4.6
export WPS_DIR=~/WPS-4.6
export NETCDF=/usr
export PATH=$PATH:$WRF_DIR:$WPS_DIR
Recargar configuración
bash
Copiar código
source ~/.bashrc

## 8. Probar la Instalación
Usa WPS para procesar datos de entrada.
Ejecuta simulaciones con WRF.
Soluciona problemas en caso de errores.
Copiar código





