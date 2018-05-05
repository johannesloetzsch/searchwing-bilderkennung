#!/bin/bash -x

# Create vec file for opencv
fullpath=`pwd`
cd positivesamples
opencv_createsamples -info anno.dat -vec $fullpath/boats.vec

# Create list of negative sample images
cd ..
rm -rf ./bg.txt
for i in $( ls ./negativesamples/); do echo ./negativesamples/$i >> bg.txt; done

