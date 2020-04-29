#!/bin/bash
function batch_folder() {
    local fileCount=$(find "${1}" -type f -ls | wc -l)
    local sourceFolder=""
    local targetFolder=""
    local i=0

    #create new folder 1 level above and move source dir to it
    mkdir "${PWD}/files-batched" && cp -r "${1}" "${PWD}/files-batched/source"
    sourceFolder="${PWD}/files-batched/source"
    #create target folder
    mkdir "${PWD}/files-batched/batches"
    targetFolder="${PWD}/files-batched/batches"

    cd "${sourceFolder}"

    for file in *; do
        mkdir -p "${targetFolder}/$((($i/$2)+1))"
        echo $file
        cp "${file}" "${targetFolder}/$((($i/$2)+1))"
        i=$(($i+1))
    done
}

FOLDER=$1
BATCH_SIZE=$2
echo "~~~~~~~~~~~~~~~~~~"
echo "Batching files into folders..."
echo "~~~~~~~~~~~~~~~~~~"
batch_folder "${FOLDER}" $BATCH_SIZE
echo "~~~~~~~~~~~~~~~~~~"
echo "Batching done."
echo "~~~~~~~~~~~~~~~~~~"