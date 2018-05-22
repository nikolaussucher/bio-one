#!/bin/bash

for subdir in *
  do
  echo Converting png to jpg
  mogrify    -format jpg   $subdir/*.png
  echo Removing png
  rm $subdir/*.png
  done
  echo Done!
