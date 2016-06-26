FROM ubuntu:latest

MAINTAINER Marco Raveri

# install the initial things:
RUN apt-get update && apt-get install -y \
     make \
     build-essential \
     git \
     valgrind \
     liblapack-dev \
     libopenblas-dev \
     openmpi-bin \
     libopenmpi-dev \
     flex \
     bison \
     numdiff \
 && apt-get clean

​# install gfortran 5
RUN add-apt-repository ppa:ubuntu-toolchain-r/test -y \
     && apt-get update -y \
     && apt-get install -y gcc-5 g++-5 gfortran-5
