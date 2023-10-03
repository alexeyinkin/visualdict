#!/bin/bash

for word in "$@"
do

  echo ""
  echo "=== $word ==="
  echo ""

  cd set_image
  dart lib/main.dart $word --public
  cd ..

  #cd set_pronunciation
  #dart lib/main.dart $word
  #cd ..

done
