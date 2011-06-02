#!/bin/bash
#set -x
Filename="$1"
echo '$0 - create thumbnails of pdfs, requires ImageMagick'
if [ -n "$Filename" ]
then
    if [ $Filename == '.' ] 
    then
        echo "Now processing all documents in directory"
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
        echo 'Note: enter two words to process all files in the directory e.g. $0 1 2'
        echo 'Now processing the single file ' $Filename
        TMPNAME=${Filename/.pdf/}
        JPGNAME=$TMPNAME.jpg
        convert -thumbnail 200x "$Filename"[0] "$JPGNAME"
        echo 'Creating ' $JPGNAME
        exit 1
    fi
else
    echo 'Nothing entered'
    echo "$0 my_file.pdf to process a single file"
    echo "$0 . to process all files in this directory"
    exit 1
fi
