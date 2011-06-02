                                                                     
                                                                     
                                                                     
                                             
#!/bin/bash
#set -x

Filename="$1"
allfiles="$2"
if [ -n "$Filename" ]
then

echo 'This file creates thumbnails of pdfs'




if [ -n "$allfiles" ]
then
echo "Now processing all documents in directory"
sleep 1
# -------------------- All Files -----------------------------------


find . -name "*.pdf" -print0 | while read -d $'\0' file
do
#echo "$file"
TMPNAME=${file/.pdf/}
JPGNAME=$TMPNAME.jpg
echo 'creating ' $JPGNAME
/usr/bin/convert -thumbnail 200x "$file[0]" "$JPGNAME"
done





# -------------------- One File -----------------------------------
else


sleep 2
echo 'Note: enter two words to process all files in the directory e.g. MakeThumbs 1 2'
sleep 2
echo 'Now processing the single file ' $Filename
TMPNAME=${Filename/.pdf/}
JPGNAME=$TMPNAME.jpg
convert -thumbnail 200x "$Filename"[0] "$JPGNAME"
echo 'Creating ' $JPGNAME
exit 1
fi

else
echo 'Program to get thumbnails'
echo 'Nothing entered'
echo 'Enter a single filename, or any two words to process all files e.g. MakeThumbs 1 2'
sleep 2
exit 1



fi
