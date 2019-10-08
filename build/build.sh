#!/bin/bash
cd ..
mkdir src
mv * src/
mv src/build build
docker build . -f build/Dockerfile -t x86-jpg
cd build
CID=$(docker run --name x86-jpg -itd x86-jpg)
docker cp "x86-jpg":/buildme/libjpeg.so bins
docker cp x86-jpg:/buildme/libjpeg.so.62 bins
docker cp x86-jpg:/buildme/libjpeg.so.62.3.0 bins
docker cp x86-jpg:/buildme/libturbojpeg.so bins
docker cp x86-jpg:/buildme/libturbojpeg.so.0 bins
docker cp x86-jpg:/buildme/libturbojpeg.so.0.2.0 bins
echo Removing..
docker kill $CID
docker rm $CID
cd ..
mv src/* .
