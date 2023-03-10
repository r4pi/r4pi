#!/bin/bash

PKG_VERSION="0.2.0"
PKG_ITERATION=1

if [[ ! -d /tmp/output/raspbian-bullseye ]]; then
  mkdir -p /tmp/output/raspbian-bullseye
fi


fpm \
  -s dir \
  -t deb \
  -v ${PKG_VERSION} \
  --iteration ${PKG_ITERATION} \
  -n r4pi \
  --vendor "r4pi.org" \
  --deb-priority "optional" \
  --deb-field 'Bugs: https://github.com/r4pi/r4pi/issues' \
  --url "https://r4pi.org" \
  --description "R4Pi.org meta-package" \
  --maintainer "r4pi.org https://r4pi.org" \
  --license "MIT" \
  -d gdal-bin \
  -d libharfbuzz-dev \
  -d libudunits2-0 \
  -d python3 \
  -d r-release \
  -d pandoc \
  -p /tmp/output/raspbian-bullseye/ \
  ./src/=/
