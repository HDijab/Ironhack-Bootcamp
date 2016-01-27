var exampleArray = [2, -5, 10, 5, 4, -10, 0];

function calcSumZero (numbers) {
  var result = [];
  for(var i = 0; i < numbers.length - 1; i++) {
    for (var j = i + 1; j < numbers.length; j++) {
      if (numbers[i] + numbers[j] === 0) {
        result.push([numbers[i], numbers[j]]);
      }
    }
  }
  return result;
}

var pairs = calcSumZero(exampleArray);
console.log(pairs);