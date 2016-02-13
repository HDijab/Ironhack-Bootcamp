(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function View(){
    var clearProgress = window.SpotifyApp.Control().restartPlayback;
    var setupModalWith = window.SpotifyApp.Modal().setup;
    var searchFor = window.SpotifyApp.Search('https://api.spotify.com/v1/search?type=track&q=').fetch;
    var searchBar = $('#searchbar');
    var changeTitle = function(input){$('.title').text(input);};
    var changeAuthor = function(input){$('.author').text(input);};
    var changeCoverImage = function(input){$('.cover img').attr('src', input);};
    var changeAudio = function(input){$('audio').attr('src', input);};
    var value = function(param){return param === undefined ? searchBar.val() : searchBar.val(param);};
    
    function populate(response){
      var info = response.tracks.items[0];
      changeTitle(info.name);
      changeAuthor(info.artists[0].name);
      changeCoverImage(info.album.images[0].url);
      changeAudio(info.preview_url);
      clearProgress();
      setupModalWith(info.artists[0].id);
    }

    function generate(){
      event.preventDefault();
      searchFor(value()).then(populate);
      value('').blur();
    }

    functions = {
      generate: generate
    };
    return functions;
  }

  window.SpotifyApp.View = View;
})();