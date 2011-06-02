#!/bin/bash
#set -x
Filename="$1"
echo '$0 - create thumbnails of pdfs, requires ImageMagick'
if [ -n "$Filename" ]
then
    if [ $Filename == '.' ] 
    then
        echo "Processing all documents in directory"
        # -------------------- All Files -----------------------------------

        find . -name "*.pdf" -print0 | while read -d $'\0' file 
        do
            #echo "$file"
            TMPNAME=${file/.pdf/}
            JPGNAME=$TMPNAME.jpg
            echo 'creating ' $JPGNAME
            /usr/bin/convert -thumbnail 200x "$file[0]" "$JPGNAME"
        done
    else
        # -------------------- One File -----------------------------------
        echo 'Processing ' $Filename
        TMPNAME=${Filename/.pdf/}
        JPGNAME=$TMPNAME.jpg
        convert -thumbnail 200x "$Filename"[0] "$JPGNAME"
        echo 'Creating ' $JPGNAME
        exit 1
    fi
else
    echo "Usage: '$0 my_file.pdf' to generate a .jpg for a single file, '$0 .' to process all .pdf files in this directory"
    exit 1
fi
