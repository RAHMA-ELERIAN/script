#!/bin/bash

#analyze filesanalyz
# user enter the file
if [ -z "$1" ]; then
  echo "Please specify a directory to analyze."
  exit 1
fi

# to reach the file 
for file in "$1"/*;
 do
  if [ ! -f "$file" ]; then
    continue
  fi

  filename=$(basename "$file")
  filesize=$(stat -c%s "$file")
  file_type=$(file -b "$file")

  # metadata based on file type
  case "$file_type" in

    "JPEG image" | "PNG image" | "GIF image")
      #  exiftool for image 
      exiftool "$file"
      ;;
    "PDF document")
      #  pdfinfo for PDF 
      pdfinfo "$file"
      ;;
    "MP3 audio")
      #  exiftool for MP3 
      exiftool "$file"
      ;;
    *)
      echo "File: $filename ($filesize bytes)"
      echo "Type: $file_type"
      ;;
  esac

done

echo "Analysis of files in '$1' complete."
