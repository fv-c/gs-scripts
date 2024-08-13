#!/bin/zsh

# Usage: ./convert_to_gray.sh input_file.pdf output_file.pdf

# Check if two arguments were provided
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 input_file.pdf output_file.pdf"
  exit 1
fi

input_file="$1"
output_file="$2"

gs -sDEVICE=pdfwrite \
   -dCompatibilityLevel=1.7 \
   -dPDFSETTINGS=/printer \
   -dNOPAUSE \
   -dQUIET \
   -dBATCH \
   -sOutputFile="$output_file" \
   -dProcessColorModel=/DeviceGray \
   -dColorConversionStrategy=/Gray \
   -dConvertCMYKImagesToGray=true \
   -dPDFUseOldCMS=false \
   "$input_file"
