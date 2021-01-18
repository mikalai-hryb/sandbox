#! /bin/bash

echo "Curl"

url="http://ovh.net/files/1Mio.dat"
#curl ${url} -O # download with the original name
#curl ${url} -o NewFileD.dat # give the new name
#curl ${url} > outputFile.dat # give the new name
curl -I ${url} # download only header
