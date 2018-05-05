#!/bin/bash -x

# Train
rm -rf classifier
mkdir classifier
opencv_traincascade -vec ./boats.vec -bg ./bg.txt -data ./classifier -numPos 100
