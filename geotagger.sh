#!/bin/bash
# extend image exif data with geo coordinates
###########################################
LAT="45.5486996"
LONG="-122.1900352"

for image in $(find $1 -maxdepth 1 -type f -name -prune -o -regex '.*\.\(jpg\|JPG\|jpeg\|JPEG\|png\|PNG\|tiff\|TIFF\)' -print)
  do
    echo Associating LAT: $LAT, LONG: $LONG to $image
    exiftool  -P -c "%.6f degrees"		\
         -GPSLatitude=$LAT		\
         -GPSLongitude=$LONG		\
         -GPSAltitude=1		\
         -GPSLatitudeRef=N		\
         -GPSLongitudeRef=W		\
         $image
done
