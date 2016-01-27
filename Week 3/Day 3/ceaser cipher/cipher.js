function shifter(letter, shiftValue) {
  var shiftedLetter = letter.charCodeAt(0);
  if (shiftedLetter >= 65 && shiftedLetter <= 90) {
    shiftedLetter = ((shiftedLetter - 65 + shiftValue) % 26) + 65;
  } else if (shiftedLetter >= 97 && shiftedLetter <= 122) {
    shiftedLetter = ((shiftedLetter - 97 + shiftValue) % 26) + 97;
  };
  return shiftedLetter;
};

function caesarCipher(message, shift) {
  var shiftValue = shift || -3
  var encoded = '';
  for (var i = 0; i < message.length; i++) {
    if (/\w/.test(message[i])) {
      var shiftedLetter = shifter(message[i], shiftValue);
      encoded = encoded.concat(String.fromCharCode(shiftedLetter));
    } else {
      encoded = encoded.concat(message[i]);
    }
  };
  return encoded;
};


var encrypted = caesarCipher("Et tu, brute?", 6);

console.log(encrypted);
//=> "_orqrp"

// console.log('A'.charCodeAt(0));
// console.log('Z'.charCodeAt(0));
// console.log('a'.charCodeAt(0));
// console.log('z'.charCodeAt(0));

// var number = 91
// console.log(((number - 65)% 26) + 65);

// var number = 116
// console.log(((number - 97)% 26) + 97);
