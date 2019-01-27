var Hunspell_create = Module.cwrap('Hunspell_create', 'number', ['string', 'string']);
var Hunspell_spell = Module.cwrap('Hunspell_spell', 'number', ['number', 'string']);
var Hunspell_suggest = Module.cwrap('Hunspell_suggest', 'number', ['number', 'number', "string"]);


var handler = Hunspell_create("./dics/en_US.aff", "./dics/en_US.dic");

var ptr = Module._malloc(4);
var view = Module.HEAPU8.subarray(ptr, ptr + 8);
var nOfItems = Hunspell_suggest(handler, ptr, "thi");
console.log("nOfItems: ", nOfItems);

var arrayPointerAddress = Module.getValue(ptr, "i32")
console.log("arrayPointerAddress: ", arrayPointerAddress);

for (let i = 0; i < nOfItems; i++) {
    var strAddress = Module.getValue(arrayPointerAddress + i * 4, "i32");
    // console.log("strAddress: ", strAddress);

    var str = Module.Pointer_stringify(strAddress);
    console.log("str: ", str);
}

// var spellResult = Hunspell_spell(handler, "word");
// var spellResult = Hunspell_spell(handler, "word1");