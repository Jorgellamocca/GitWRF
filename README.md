1. Preparar el Entorno
Instalar WSL y Ubuntu:

Habilita WSL desde el terminal de Windows:
bash
Copiar código
wsl --install -d Ubuntu
Reinicia tu sistema si es necesario.
Actualizar el sistema:

Una vez que Ubuntu esté configurado, actualiza los paquetes:
bash
Copiar código
sudo apt update && sudo apt upgrade -y
Instalar dependencias básicas:

Instala herramientas esenciales para compilación y manejo de archivos:
bash
Copiar código
sudo apt install build-essential gcc gfortran libjpeg-dev zlib1g-dev m4 -y
2. Instalar Librerías Requeridas
WRF depende de varias librerías científicas. Instálalas en el siguiente orden:

Instalar NetCDF:

Descarga e instala NetCDF-C y NetCDF-Fortran:
bash
Copiar código
sudo apt install libnetcdf-dev netcdf-bin libnetcdff-dev -y
Instalar MPICH:

Para habilitar la ejecución paralela:
bash
Copiar código
sudo apt install mpich -y
Instalar JasPer (opcional, para soporte en gráficos avanzados):

Descarga e instala:
bash
Copiar código
sudo apt install libjasper-dev -y
Instalar otras dependencias:

Incluyendo bibliotecas de compresión y manipulación de datos:
bash
Copiar código
sudo apt install libhdf5-dev libcurl4-openssl-dev -y
3. Descargar WRF y WPS
Descargar el código fuente:

Ve a la página oficial de WRF y descarga:
WRF
WPS (Weather Preprocessing System)
bash
Copiar código
wget https://github.com/wrf-model/WRF/archive/refs/tags/v4.6.tar.gz
wget https://github.com/wrf-model/WPS/archive/refs/tags/v4.6.tar.gz
Extraer los archivos:

bash
Copiar código
tar -xvf v4.6.tar.gz
tar -xvf WPS-v4.6.tar.gz
4. Configurar y Compilar WRF
Navegar al directorio WRF:

bash
Copiar código
cd WRF-4.6
Configurar WRF:

Ejecuta el script de configuración:
bash
Copiar código
./configure
Selecciona la opción adecuada para tu entorno (normalmente "Linux (gfortran/gcc)") o "Linux (dmpar)" para paralelismo.
Compilar WRF:

Compila los programas de testeo:
bash
Copiar código
./compile em_real &> compile.log
Verifica que la compilación haya sido exitosa con:
bash
Copiar código
tail compile.log
5. Configurar y Compilar WPS
Navegar al directorio WPS:

bash
Copiar código
cd ../WPS-4.6
Configurar WPS:

Ejecuta el script de configuración:
bash
Copiar código
./configure
Selecciona la misma opción de compilación que usaste para WRF.
Compilar WPS:

bash
Copiar código
./compile &> compile.log
6. Descargar Datos Geográficos
Descargar datos necesarios para WPS:

Los datos de geografía están disponibles aquí.
Descárgalos y descomprímelos en el directorio WPS_GEOG dentro de la carpeta de WPS.
bash
Copiar código
mkdir WPS_GEOG
tar -xvf geog_complete.tar.gz -C WPS_GEOG
Configurar el entorno de datos geográficos en WPS:

Edita namelist.wps y ajusta geog_data_path para apuntar a WPS_GEOG.
7. Configuración Adicional
Establecer variables de entorno: Agrega estas líneas a tu archivo ~/.bashrc:

bash
Copiar código
export WRF_DIR=~/WRF-4.6
export WPS_DIR=~/WPS-4.6
export NETCDF=/usr
export PATH=$PATH:$WRF_DIR:$WPS_DIR
Recargar configuración:

bash
Copiar código
source ~/.bashrc
8. Probar la Instalación
Ejecuta los ejemplos de prueba de WRF y WPS para verificar que todo funcione correctamente.
Usa WPS para procesar datos de entrada y WRF para realizar simulaciones.
Si tienes problemas en algún paso, indícalo y te ayudo a solucionarlo. ¡Éxitos!
