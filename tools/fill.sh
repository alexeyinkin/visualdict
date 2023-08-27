#!/bin/bash

word=$1

cd fill_usage
dart lib/main.dart $word
cd ..

cd fill_transcription
dart lib/main.dart $word
cd ..

cd translate
dart lib/main.dart $word --lang=ru
cd ..

cd fill_derived
dart lib/main.dart $word
cd ..
