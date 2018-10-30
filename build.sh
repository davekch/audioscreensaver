#!/bin/bash

# in Processing IDE do file > export application
# run this script inside the created application.*/lib/
# folder to create a standalone .jar

mkdir build
unzip -d build "*.jar"
# unzip audioscreensaver again to overwrite meta-inf
# unzip -d build audioScreensaver.jar
# cd build/
# zip -d ../audioScreensaver_standalone.jar "*"
# cd ..
