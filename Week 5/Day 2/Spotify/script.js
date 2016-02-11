$(function () {
  var container = $('#results');
  var manager = new Spotify.SearchManager(container);

  $('form').on('submit', function(){
    event.preventDefault();
    manager.search(($('#search').val()), 'artist');
    $('#search').val('').blur();
  });
});