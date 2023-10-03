#!/bin/bash

for word in "$@"
do

  echo ""
  echo "=== $word ==="
  echo ""

  cd create_word
  dart lib/main.dart $word --force
  exit_code=$?
  cd ..

  if [ $exit_code -ne 0 ]; then
    continue
  fi

  cd fill_definitions
  dart lib/main.dart $word
  cd ..

  cd fill_usage
  dart lib/main.dart $word --force --count=3
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

done
