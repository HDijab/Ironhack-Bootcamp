$(function() {
  window.phrases = [
    'The cake is a lie',
    'The cake is not a lie',
    'Only one of these statements is false'
  ];

  function shuffle() {
    $('h1').text(phrases[Math.floor(Math.random()*(phrases.length))]);
    refreshList();
  }

  function refreshList() {
    $('#list').empty();
    var current = $('h1').text();
    for (var i = 0; i < phrases.length; i++) {
      var listitem = '';
      if (phrases[i] === current) {
        listitem = "<li class='highlight'>"+phrases[i]+"</li>";
      } else {
        listitem = "<li>"+phrases[i]+"</li>";
      }
      $('#list').append(listitem);
    }
  }

  shuffle();
  refreshList();

  $('form').on('focus', 'input', function(){
    $('#list').append("<li id='new'>");
  });

  $('form').on('keypress', 'input', function(){
    text = $('#new').text();
    text = text.concat(String.fromCharCode(event.keyCode));
    $('#new').text(text);
  });

  $('.refresh').on('click', function(){
    shuffle();
  });

  $('ul').on('click', 'li', function(){
    var text = this.firstChild.data;
    var index = phrases.indexOf(text);
    phrases.splice(index, 1);
    this.remove();
  });

  $('form').on('submit', function(){
    var input = $('input').prop('value');
    phrases.push(input);
    $('input').prop('value', '').blur();
    refreshList();
  });
});
