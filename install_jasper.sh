#!/bin/bash
###################################################################################################


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

# Compilers
export DIR=$HOME/WRF/Library
export CC=gcc
export CXX=g++
export FC=gfortran
export F77=gfortran





#JasPer Option 2

##### instalar Jasper #####
cd jasper-1.900.1

./configure --prefix=/home/jbruno/WRF/Library --enable-shared
make
make install
make clean

./configure --prefix=/home/jbruno/WRF/Library --enable-shared CFLAGS="-fPIC"
make
make install

## export PATH and LD_LIBRARY_PATH
#echo "export PATH=$DIR/bin:$PATH" >> ~/.bashrc
#echo "export LD_LIBRARY_PATH=$DIR/lib:$LD_LIBRARY_PATH" >> ~/.bashrc


#####################################BASH Script Finished##############################
echo "Thank you for using this script" 




