#!/bin/bash


cd content/publication/
ls  | grep -v "_index" | awk '{print $NF}' | xargs -I{} rm -rf {}
cd ../..
./bib.py import --overwrite --bibtex pubs.bib
cd pubs
for fname in $(ls *.pdf)
do
   cp $fname ../content/publication/${fname%.pdf}/$fname
done
cd ..
hugo -F --cleanDestinationDir --destination "/var/www/janrueth.com/"
