#!/bin/bash

video=$( echo "$1" | awk -F/ '{print $3}' )

chmod 0777 "public/worshipvideos/$video"
ffmpeg -i "public/worshipvideos/$video" -an -ss 00:00:20 -r 1 -vframes 1 -f mjpeg -y "app/assets/images/worship_pics/${video}_1.jpg"
ffmpeg -i "public/worshipvideos/$video" -an -ss 00:00:40 -r 1 -vframes 1 -f mjpeg -y "app/assets/images/worship_pics/${video}_2.jpg"
ffmpeg -i "public/worshipvideos/$video" -an -ss 00:01:00 -r 1 -vframes 1 -f mjpeg -y "app/assets/images/worship_pics/${video}_3.jpg"
echo "End of making thumbs"
