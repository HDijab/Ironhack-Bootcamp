(function(){
    function Fetch() {
      function fetch(uri) {
        return $.ajax({url: uri});
      }

      var functions = {
        fetch: fetch
      };

      return functions;
    }

    window.PokemonApp.Fetch = Fetch;
})();

