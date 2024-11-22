#!/bin/bash
###################################################################################################
# WRF installation with parallel process.
#
# --------------------------------------------------------------------------
# This program change by yung  ching lin  
#  Tested in Win10 system
#  1.step 1 install WSL2
#  2.step 2 instell Ubuntu 20.04 LTS
# PS: Hard disk capacity must be greater than 50GB
#
#
#  reference:
#  License: LGPL
# Jorge LL <jhllamoccawrf@gmail.com>
# Tested in Ubuntu 18.04 LTS
# https://gist.github.com/jamal919/5498b868d34d5ec3920f306aaae7460a#file-install_wrf41-sh
#https://github.com/Jorgellamocca/WRF.git
########################################################################################################



# basic package managment
#sudo apt update
#sudo apt upgrade
#sudo apt install gcc gfortran g++ libtool automake autoconf make m4 grads default-jre csh unzip

# for JasPer,DomainWizard
#sudo apt install unzip


## Directory Listing
export HOME=`cd;pwd`
mkdir $HOME/WRF
cd $HOME/WRF
mkdir Downloads
mkdir Library

## Downloading Libraries
cd Downloads
#wget -c https://www.zlib.net/zlib-1.2.11.tar.gz
#wget -c https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.5/src/hdf5-1.10.5.tar.gz
#wget -c https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-c-4.7.1.tar.gz
#wget -c https://www.unidata.ucar.edu/downloads/netcdf/ftp/netcdf-fortran-4.5.1.tar.gz
#wget -c http://www.mpich.org/static/downloads/3.3.1/mpich-3.3.1.tar.gz
#wget -c https://download.sourceforge.net/libpng/libpng-1.6.37.tar.gz
#wget -c https://www.ece.uvic.ca/~frodo/jasper/software/jasper-1.900.1.zip

wgwt -c https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/mpich-3.0.4.tar.gz
wget -c https://support.hdfgroup.org/ftp/HDF5/releases/hdf5-1.10/hdf5-1.10.5/src/hdf5-1.10.5.tar.gz
wget -c https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/netcdf-c-4.7.2.tar.gz
wget -c https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/netcdf-fortran-4.5.2.tar.gz
wget -c https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/zlib-1.2.11.tar.gz
wget -c https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/libpng-1.2.50.tar.gz
wget -c https://www2.mmm.ucar.edu/wrf/OnLineTutorial/compile_tutorial/tar_files/jasper-1.900.1.tar.gz

# Compilers
export DIR=$HOME/WRF/Library
export CC=gcc
export CXX=g++
export FC=gfortran
export F77=gfortran

# zlib
cd $HOME/WRF/Downloads
tar -xvzf zlib-1.2.11.tar.gz
cd zlib-1.2.11/
./configure --prefix=$DIR
make
make install

# hdf5 library for netcdf4 functionality
cd $HOME/WRF/Downloads
tar -xvzf hdf5-1.10.5.tar.gz
cd hdf5-1.10.5
./configure --prefix=$DIR --with-zlib=$DIR --enable-hl --enable-fortran
make check
make install

export HDF5=$DIR
export LD_LIBRARY_PATH=$DIR/lib:$LD_LIBRARY_PATH

## Install NETCDF C Library
cd $HOME/WRF/Downloads
tar xzvf netcdf-c-4.7.2.tar.gz
cd netcdf-c-4.7.2/
export CPPFLAGS=-I$DIR/include 
export LDFLAGS=-L$DIR/lib
./configure --prefix=$DIR --disable-dap
make check
make install

export PATH=$DIR/bin:$PATH
export NETCDF=$DIR

## NetCDF fortran library
cd $HOME/WRF/Downloads
tar -xvzf netcdf-fortran-4.5.2.tar.gz
cd netcdf-fortran-4.5.2/
export LD_LIBRARY_PATH=$DIR/lib:$LD_LIBRARY_PATH
export CPPFLAGS=-I$DIR/include 
export LDFLAGS=-L$DIR/lib
export LIBS="-lnetcdf -lhdf5_hl -lhdf5 -lz" 
./configure --prefix=$DIR --disable-shared
make check
make install

## MPICH
cd $HOME/WRF/Downloads
tar -xvzf mpich-3.0.4.tar.gz
cd mpich-3.0.4/
./configure --prefix=$DIR
make
make install

export PATH=$DIR/bin:$PATH

# libpng
cd $HOME/WRF/Downloads
export LDFLAGS=-L$DIR/lib
export CPPFLAGS=-I$DIR/include
tar -xvzf libpng-1.2.50.tar.gz
cd libpng-1.2.50/
./configure --prefix=$DIR
make
make install

# JasPer
cd $HOME/WRF/Downloads
tar -xvzf jasper-1.900.1.tar.gz
cd jasper-1.900.1/
autoreconf -i
./configure --prefix=$DIR 
make
make install
export JASPERLIB=$DIR/lib
export JASPERINC=$DIR/include


## export PATH and LD_LIBRARY_PATH
echo "export PATH=$DIR/bin:$PATH" >> ~/.bashrc
echo "export LD_LIBRARY_PATH=$DIR/lib:$LD_LIBRARY_PATH" >> ~/.bashrc


#####################################BASH Script Finished##############################
echo "Congratulations! "
echo "Thank you for using this script" 




