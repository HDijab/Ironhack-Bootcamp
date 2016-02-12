$(function(){
  var Search = window.SpotifyApp.Search($('#searchbar'));
  var Control = window.SpotifyApp.Control();
  var Modal = window.SpotifyApp.Modal();
  
  $('#searchform').on('submit', Search.song);
  $('.btn-play').on('click', Control.handle);
  $('.author').on('click', Modal.show);
});