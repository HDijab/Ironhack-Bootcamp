(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function Search(input){
    View = window.SpotifyApp.View();
    var baseurl = 'https://api.spotify.com/v1/search?type=track&q=';
    var value = function(param){
      result = param === undefined ? input.val() : input.val(param);
      return result;
    };

    function fetch(){
      return $.ajax(baseurl + value());
    }

    function parse(response){
      var trackinfo = response.tracks.items[0];
      View.generate(trackinfo);
    }

    function song(){
      event.preventDefault();
      fetch().then(parse);
      value('').blur();
    }

    functions = {
      song: song
    };
    return functions;
  }

  window.SpotifyApp.Search = Search;
})();