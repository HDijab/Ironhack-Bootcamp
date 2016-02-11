(function(){
    function Modal() {
      var modal = $('.modal');
      var name = $('.modal-title span');
      var id = $('.modal-title small');
      var sprite = $('.modal-title img');
      var description = $('.dl-horizontal');
      var default_attr = {
        height: 'Height:',
        weight: 'Weight:',
        attack: 'Attack:',
        defense: 'Defense:',
        hp: 'HP:',
        sp_atk: 'Special Attack:',
        sp_def: 'Special Defense:',
        speed: "Speed:"
      };

      function fillBody(pokeinfo, options) {
        var attributes = options || default_attr;
        var content = '';
        for (var attr in attributes) {
          content += '<dt>'+ attributes[attr] +'</dt>';
          content += '<dd>'+ pokeinfo[attr] +'</dd>';
        }
        return content;
      }

      function populate(spriteinfo, pokeinfo) {
        var link = 'http://pokeapi.co/' + spriteinfo.image;
        name.text(pokeinfo.name);
        id.text('#'+pokeinfo.pkdx_id);
        sprite.attr('src', link);
        description.html(fillBody(pokeinfo));
      }

      function show(spriteinfo, pokeinfo) {
        populate(spriteinfo, pokeinfo);
        modal.modal('show');
      }

      var functions = {
        show: show
      };

      return functions;
    }

    window.PokemonApp.Modal = Modal;
})();