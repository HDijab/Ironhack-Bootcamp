var superDecode = require('./super_decode.js');

// Possible decoding types:
// "every-forwards", "even-forwards", "odd-forwards"
// "every-backwards", "even-backwards", "odd-backwards"

var sentence1 = "Attack her nose under here with an itch"
var sentence2 = "Raul Nuñez call never finished"
var sentence3 = "Start rapping this or countless queasy wizards give back jay-z"
var sentence4 = "inner peace is overrated"
var sentence5 = "Fill the proper tank for the cow"

var firstSecretMessage = superDecode(sentence1, 'every-backwards');
var secondSecretMessage = superDecode(sentence2, 'every-forwards');
var thirdSecretMessage = superDecode(sentence3, 'every-backwards');
var fourthSecretMessage = superDecode(sentence4, 'even-forwards');
var fifthSecretMessage = superDecode(sentence5, 'even-backwards');

console.log(firstSecretMessage);
console.log(secondSecretMessage);
console.log(thirdSecretMessage);
console.log(fourthSecretMessage);
console.log(fifthSecretMessage);