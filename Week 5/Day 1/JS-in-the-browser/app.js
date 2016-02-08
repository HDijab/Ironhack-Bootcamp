$(function() {
  for (var i = 0; i < 100; i++) {
    $('#root').append($('<div class="cell"></div>'));
  }
  var odd = [];
  var even = [];

  var cells = $('.cell');

  for (var j = 0; j < 100; j++) {
    if (j % 20 === 0) {
      var length = j + 10;
      for (var k = j; k < length; k++) {
        if (k % 2 === 0) {
          odd.push(cells[k]);
        } else {
          even.push(cells[k]);
        }
      }
    } else if (j % 20 === 10) {
      var length2 = j + 10;
      for (var v = j; v < length2; v++) {
        if (v % 2 === 1) {
          odd.push(cells[v]);
        } else {
          even.push(cells[v]);
        }
      }
    }
  }

  setTimeout(function(){setInterval(function(){odd.forEach(function (element, index, array) {
    var ele = $(element);
    ele.toggleClass('active');
  });}, 1000)}, 999);

  setInterval(function(){even.forEach(function (element, index, array) {
    var ele = $(element);
    ele.toggleClass('active');
  });}, 1000);
});