#!/usr/bin/env bash
set -e

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd "$DIR"
cd ..

INPUT_DICS="./dics-input"
FILE_PACKER_PATH=${1}

rm -rf ./temp-building/dic
mkdir -p ./temp-building/dic


for d in ${INPUT_DICS}/*/; do
    cp "${d}data.dic" ./temp-building/dic/data.dic
    cp "${d}data.aff" ./temp-building/dic/data.aff
    LANGUAGE=$(basename ${d})

    pushd ./temp-building

    python "${FILE_PACKER_PATH}" \
        ../js-output/dic-${LANGUAGE}.data \
        --js-output=../js-output/loader-${LANGUAGE}.js --preload ./dic
    popd

done
