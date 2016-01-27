var decode = require('./decode.js');

function superDecode(sentence, option) {
  var options = option.split('-');
  var words = formatter(options[0], options[1], sentence)
  var secretMessage = decode(words);
  return secretMessage;
}

function formatter(order ,direction, sentence) {
  var array = sentence.split(' ');
  switch(order) {
    case 'every':
      array
      break;
    case 'even':
      array = array.filter(function(word, index){
        return index % 2 == 0;
      });
      break;
    case 'odd':
      array = array.filter(function(word, index){
        return Math.abs(index % 2) == 1;
      });
      break;
  };
  switch(direction) {
    case 'forwards':
      array
      break;
    case 'backwards':
      array = array.reverse();
      break;
  };
  return array;
}

module.exports = superDecode;