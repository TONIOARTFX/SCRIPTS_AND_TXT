#!/bin/bash

for file in *.MOV
do
ffmpeg -i "$file" -c:v prores_ks -profile:v 3 -c:a pcm_s16le "${file%.*}_PR422HQ".mov
sleep 3
done