#!/bin/bash
ffmpeg -i "public/worshipvideos/$1" -an -ss 00:00:20 -r 1 -vframes 1 -f mjpeg -y "app/assets/images/worship_pics/${1}_1.jpg"
ffmpeg -i "public/worshipvideos/$1" -an -ss 00:00:40 -r 1 -vframes 1 -f mjpeg -y "app/assets/images/worship_pics/${1}_2.jpg"
ffmpeg -i "public/worshipvideos/$1" -an -ss 00:01:00 -r 1 -vframes 1 -f mjpeg -y "app/assets/images/worship_pics/${1}_3.jpg"