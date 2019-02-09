# Hunspell js
This is js library ported from Hunspell (c++)[https://github.com/hunspell/hunspell] using emscripten 

## Running Example
- Goto `js-output` folder, and run a http server (for example using python: ``` python -m SimpleHTTPServer 8080 ```)
- Open `http://localhost:8080/` in browser
- Current dictionary using is en-us, you can change to use another dictionary by modifing index.html:
    - change `<script type="text/javascript" src="loader-en-us.js"></script>` to `<script type="text/javascript" src="loader-vi.js"></script>`
    - it will change from `en-us` to `vi`
    - Example script now only preload with 2 dictionaries, if you want to add your own, please refer below section

## How to build hunspell js from hunspell C++ manually, instruction based on MACOS only
- Install prerequisite for hunspell on MacOS [https://github.com/hunspell/hunspell#compiling-on-osx-and-macos]
- Setup emscripten as in [https://emscripten.org/docs/getting_started/index.html], make sure emcc, emmake, emconfigure... command in your $PATH
- Run `./scripts/hunspell.sh`
- Run `./scripts/dic-package.sh [path-of-file_packager.py]`, you can find `path-of-file_packager.py` in folder tools of installed emscripten directory. For example: `./scripts/dic-package.sh /Users/myuser/emsdk/emscripten/1.38.25/tools/file_packager.py`
- You will find output in `js-output` folder

## How to build your own dictionaries
This repo only have to dictionaries (en-us and vi), to build your own dictionaries to use, following steps: 
- Download your dictionaries and put into `dics-input` folder in format:
    - [language-code]/data.aff
    - [language-code]/data.dic
- Run `./scripts/dic-package.sh [path-of-file_packager.py]`

## Dictionaries

Hunspell (MySpell) dictionaries:

  - https://wiki.documentfoundation.org/Language_support_of_LibreOffice
  - http://cgit.freedesktop.org/libreoffice/dictionaries
  - http://extensions.libreoffice.org
  - http://extensions.openoffice.org
  - http://wiki.services.openoffice.org/wiki/Dictionaries

Aspell dictionaries (conversion: man 5 hunspell):

  - ftp://ftp.gnu.org/gnu/aspell/dict


