#!/bin/bash

# in Processing IDE do file > export application
# run this script inside the created application.*/lib/
# folder to create a standalone .jar

mkdir build
mkdir tmp
# move stuff unnecessary stuff to tmp
mv *natives* tmp/
# say y to all replaced? questions
yes y | unzip -d build "*.jar"
# unzip audioscreensaver again to overwrite meta-inf
yes y | unzip -d build audioScreensaver.jar
cd build
zip -r audioScreensaver_standalone.jar .
cd ..
mv build/audioScreensaver_standalone.jar .
mv tmp/* .
rm -r tmp
rm -r build
