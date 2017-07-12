#!/bin/bash

input=$1
output=$2

if [[ -z $output ]]; then
  echo Needs an output file
  exit 1
fi

echo "<html><head><link rel='stylesheet' type='text/css' href='styles.css'/><title>$(basename $output)</title></head><body>" > $output

echo -e "<h1>$input</h1><pre>$(cat $input)</pre>" >> $output

for file in `ls *-$output`; do
  title=$(xmlstarlet sel -t -v '/_:html/_:head/_:title/text()' "$file" )
  content=$(xmlstarlet sel -t -c '/_:html/_:body/_:pre/node()' "$file" )
  echo -e "<h1>$title</h1><pre>$title\n$content</pre>" >> $output
  rm $file
done

echo "</body></html>" >> $output
