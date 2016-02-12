(function(){
    function Pokemon() {
      var Fetch = PokemonApp.Fetch();
      var pokeinfo;
      var spriteinfo;
      var descriptioninfo;

      function details(response) {
        pokeinfo = response;
        var spriteUri = pokeinfo.sprites[0].resource_uri;
        var descriptionUri = description(pokeinfo);
        var spriteinfo = Fetch.fetch(spriteUri);
        var descriptioninfo = Fetch.fetch(descriptionUri);
        spriteinfo.done(function(response){
          spriteinfo = response;
        });
        descriptioninfo.done(function(response){
          descriptioninfo = response;
          PokemonApp.Modal(pokeinfo, spriteinfo, descriptioninfo).show();
        });
      }

      function description() {
        var toSort = pokeinfo.descriptions;
        var sorted = toSort.sort(function(a, b) {
          var one = parseInt(a.name.substr(a.name.length - 1));
          var two = parseInt(b.name.substr(b.name.length - 1));
          return two - one;
        });
        var descriptionUri = sorted[0].resource_uri;
        return descriptionUri;
      }

      function get_info() {
        var target = event.currentTarget;
        var uri = $(target).attr('data-pokemon-uri');
        var promise = Fetch.fetch(uri);
        promise.done(details);
      }

      var functions = {
        get_info: get_info,
      };

      return functions;
    }

    window.PokemonInfo.Pokemon = Pokemon;
})();