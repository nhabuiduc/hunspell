#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$DIR"

cd ..

echo "-------------------- Running autoreconf"

autoreconf -vfi

echo "-------------------- Running emconfigure"

EM_IGNORE_SANITY=1  EMCC_DEBUG=1  emconfigure ./configure -v --disable-shared --enable-static

pushd ./src/hunspell

echo "-------------------- Running Make in src/hunspell"
emmake make

popd

echo "-------------------- Building hunspell js using emcc"

mkdir -p ./js-output
rm -rf ./temp-building
mkdir -p ./temp-building

cp ./src/hunspell/libhunspell-1.7.a ./temp-building/libhunspell-1.7.a

pushd ./temp-building

emcc libhunspell-1.7.a -O2 -s FORCE_FILESYSTEM=1  -o ./hunspell.html \
    -s EXPORTED_FUNCTIONS='["_Hunspell_create","_Hunspell_spell","_Hunspell_suggest"]' \
    -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap","getValue","setValue","Pointer_stringify"]' \

popd 
cp ./temp-building/hunspell.js ./js-output/hunspell.js
cp ./temp-building/hunspell.wasm ./js-output/hunspell.wasm


