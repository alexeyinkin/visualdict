#!/bin/bash

word=$1

cd create_word
dart lib/main.dart $word
cd ..

cd fill_definitions
dart lib/main.dart $word
cd ..
