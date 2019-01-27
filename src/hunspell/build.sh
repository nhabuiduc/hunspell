# EM_IGNORE_SANITY=1  EMCC_DEBUG=1  emconfigure ./configure -v --disable-shared --enable-static
# emmake make
# cp .libs/libhunspell-1.7.a libhunspell-1.7.a
# emcc libhunspell-1.7.a -o hunspell.js

emcc libhunspell-1.7.a -o hunspell.html \
    -s EXPORTED_FUNCTIONS='["_Hunspell_create","_Hunspell_spell","_Hunspell_suggest"]' \
    -s EXTRA_EXPORTED_RUNTIME_METHODS='["ccall", "cwrap","getValue","setValue","Pointer_stringify"]' \
    --preload-file ./dics \
    --preload-file ./inputs 