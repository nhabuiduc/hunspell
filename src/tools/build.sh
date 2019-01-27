# EM_IGNORE_SANITY=1  EMCC_DEBUG=1  emconfigure ./configure -v --disable-shared --enable-static
emmake make
cp hunspell hunspell.o
emcc hunspell.o -o hunspell.js