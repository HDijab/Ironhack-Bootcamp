(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function View(){
    var changeTitle = function(input){$('.title').text(input);};
    var changeAuthor = function(input){$('.author').text(input);};
    var changeCoverImage = function(input){$('.cover img').attr('src', input);};
    var changeAudio = function(input){$('audio').attr('src', input);};
    
    function generate(info){
      changeTitle(info.name);
      changeAuthor(info.artists[0].name);
      changeCoverImage(info.album.images[0].url);
      changeAudio(info.preview_url);
      $('.btn-play').removeClass('playing');
      $('progress').prop('value', 0);
    }

    functions = {
      generate: generate
    };
    return functions;
  }

  window.SpotifyApp.View = View;
})();