#!/bin/bash

# Jupyter
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin":$PATH
conda config --set always_yes yes --set changeps1 no
conda update -q conda
conda install jupyter

# Almond (Scala kernel for Jupyter)
git clone -b v0.1.9 https://github.com/almond-sh/almond.git
cd almond
curl -L -o coursier https://git.io/coursier && chmod +x coursier
./coursier bootstrap \
    -i user -I user:sh.almond:scala-kernel-api_$SCALA_VERSION:$ALMOND_VERSION \
    sh.almond:scala-kernel_$SCALA_VERSION:$ALMOND_VERSION \
    -o almond
./almond --install

# Copy custom css
mkdir -p ~/.jupyter/custom
# cp source/custom.js ~/.jupyter/custom/custom.js

