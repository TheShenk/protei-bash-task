#!/bin/bash

src_dir=$1
dst_dir=$2

if ! [ $# -eq 2 ]
then
    echo "Usage: $0 SOURCE_DIR DESTINATION_DIR"
    exit 1
fi

if ! [ -d $src_dir ]
then
    echo "Directory $src_dir don't exist"
    exit 2
fi

if ! [ -d $dst_dir ]
then
    echo "Directory $dst_dir don't exist"
    exit 2
fi

if [ $dst_dir = $src_dir ]
then
    echo "Directroes are same"
    exit 3
fi

copied_count=0
skiped_count=0

files=`ls ${src_dir}`
for entry in $files
do
    src_file="$src_dir/$entry"
    dst_file="$dst_dir/$entry"
    if [ -f $dst_file ]
    then
        read -p "File $dst_file exist. Rewrite? [y|N] " need_copy
        if [ "$need_copy" = "y" ]
        then
            cp $src_file $dst_file
            ((copied_count++))
        else
            ((skiped_count++))
        fi
    else
        cp $src_file $dst_file
        ((copied_count++))
    fi
done 

echo "Copied: $copied_count Skiped: $skiped_count"
