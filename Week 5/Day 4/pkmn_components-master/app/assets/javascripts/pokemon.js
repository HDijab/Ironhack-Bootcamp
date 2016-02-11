// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(function(){
  var Fetch = PokemonApp.Fetch();
  $('.js-show-pokemon').on('click', Fetch.pokemon);
});