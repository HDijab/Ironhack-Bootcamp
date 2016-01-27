function decode(words) {
  var secretWord = words.reduce(function(acc, currentWord, index) {
    return acc + currentWord[index % 5];
  }, '');
  // var secretWord = '';
  // for (var i = 0; i < words.length; i++) {
  //   secretWord += words[i][i % 5];
  // };
  return secretWord;
}

module.exports = decode;