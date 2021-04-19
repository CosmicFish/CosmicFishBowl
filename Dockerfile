FROM ubuntu:latest

MAINTAINER Marco Raveri <mraveri@sissa.it>

ARG DEBIAN_FRONTEND=noninteractive

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
     doxygen \
     wget \
 && apt-get clean

# install latex:
RUN apt-get update \
     && apt-get install -y --no-install-recommends \
     texlive \
     dvipng \
     texlive-latex-extra \
     texlive-fonts-recommended \
&& apt-get clean

# install python:
RUN apt-get update \
     && apt-get install -y \
     python3-pip \
     python3.7 \
     python3-numpy \
     python3-matplotlib \
     python3-scipy \
     python3-pandas \
     cython \
     ipython \
     python3-sphinx \
&& apt-get clean

RUN pip install --upgrade pip \
    && pip uninstall -y IPython \
    && pip install ipython \
    && pip install nose \
    && pip install coverage \
    && pip install jupyter \
    && pip install jsonschema
