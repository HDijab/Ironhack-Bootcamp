$(function(){
  var generateView = window.SpotifyApp.View().generate;
  var handleControls = window.SpotifyApp.Control().handle;
  var showModal = window.SpotifyApp.Modal().show;
  var Progress = window.SpotifyApp.Progress();

  $('#searchform').on('submit', generateView);
  $('.btn-play').on('click', handleControls);
  $('.author').on('click', showModal);
  $('progress').on('mousemove', Progress.read);
  $('progress').on('click', Progress.update);
});