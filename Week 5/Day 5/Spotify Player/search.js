(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function Search(baseurl){
    function fetch(query){
      return $.ajax(baseurl + query);
    }

    functions = {
      fetch: fetch
    };
    return functions;
  }

  window.SpotifyApp.Search = Search;
})();