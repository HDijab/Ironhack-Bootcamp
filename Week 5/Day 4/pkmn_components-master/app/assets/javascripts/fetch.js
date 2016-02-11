(function(){
    function Fetch() {
      var Modal = PokemonApp.Modal();

      function fetch(uri, callback) {
        var success = callback || sprite;
        $.ajax({
          type: 'GET',
          url: uri,
          success: success,
          error: function (error) {
            console.error('Error!');
          }
        });
      }

      function sprite(pokeinfo) {
        var sprite = pokeinfo.sprites[0].resource_uri;
        var callback = function(spriteinfo) {
          var pokemon = pokeinfo;
          Modal.show(spriteinfo, pokeinfo);
        };
        fetch(sprite, callback);
      }

      function pokemon() {
        var target = event.currentTarget;
        var uri = $(target).attr('data-pokemon-uri');
        fetch(uri);
      }

      var functions = {
        pokemon: pokemon,
      };

      return functions;
    }

    window.PokemonApp.Fetch = Fetch;
})();