#!/bin/bash

word=$1

cd set_image
dart lib/main.dart $word --public
cd ..

#cd set_pronunciation
#dart lib/main.dart $word
#cd ..
