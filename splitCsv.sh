#/bin/bash
HEADER=$(head -1 $1)
extension="${1##*.}"
filename="${1%.*}"

if [ -n "$2" ]; then
    CHUNK=$2
else 
    CHUNK=10000000
fi
tail -n +2 $1 | split -l $CHUNK -d - "$filename"_
for i in "$filename"_[0-9][0-9]; do
    sed -i -e "1i$HEADER" "$i";
    mv $i "$i.csv"; 
done

