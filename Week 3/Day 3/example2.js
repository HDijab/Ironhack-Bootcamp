var numbers = '80:70:90:100';

function averageColon(string) {
  var array = string.split(':');
  var total = array.reduce(function(pre, post){
    return (pre + parseInt(post));
  }, 0);
  return total / array.length;
};

console.log(averageColon(numbers));