#!/bin/bash

cd ${SRC_DIR}

# Clone tesseract
git clone https://github.com/tesseract-ocr/tesseract

# Clone leptonica
git clone https://github.com/DanBloomberg/leptonica

# Clone langdata
git clone https://github.com/tesseract-ocr/langdata tesseract/langdata

# Download languages
wget https://github.com/tesseract-ocr/tessdata/raw/master/eng.traineddata -P tesseract/tessdata
wget https://github.com/tesseract-ocr/tessdata/raw/master/sin.traineddata -P tesseract/tessdata

export TESS_SRC_DIR=${PWD}/tesseract
export LEPT_SRC_DIR=${PWD}/leptonica
