(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function Modal(){
    var artistquery;
    var baseurl = 'https://api.spotify.com/v1/search?type=artist&q=';
    var modal = $('.modal');
    var header = $('.modal-header h2');
    var body = $('.modal-body dl');
    
    function fetch(){
      return $.ajax(baseurl + value());
    }

    function parse(response){

    }

    function show(){
      artistquery = event.currentTarget.innerText;
      populate();
      modal.modal('show');
    }

    functions = {
      show: show
    };
    return functions;
  }

  window.SpotifyApp.Modal = Modal;
})();

// (function(){
//     function Modal(pokeinfo, spriteinfo, descriptioninfo) {
//       var modal = $('.modal');
//       var name = $('.modal-title span');
//       var id = $('.modal-title small');
//       var sprite = $('.modal-title img');
//       var description = $('.modal-title p');
//       var attributes = $('.dl-horizontal');
//       var default_attr = {
//         height: 'Height:',
//         weight: 'Weight:',
//         attack: 'Attack:',
//         defense: 'Defense:',
//         hp: 'HP:',
//         sp_atk: 'Special Attack:',
//         sp_def: 'Special Defense:',
//         speed: 'Speed:'
//       };

//       function fillBody(options) {
//         var attributes = options || default_attr;
//         var content = '';
//         for (var attr in attributes) {
//           content += '<dt>'+ attributes[attr] +'</dt>';
//           content += '<dd>'+ pokeinfo[attr] +'</dd>';
//         }
//         return content;
//       }

//       function populate() {
//         var link = 'http://pokeapi.co/' + spriteinfo.image;
//         name.text(pokeinfo.name);
//         id.text('#'+pokeinfo.pkdx_id);
//         description.text(descriptioninfo.description);
//         sprite.attr('src', link);
//         attributes.html(fillBody());
//       }

//       function show() {
//         populate();
//         modal.modal('show');
//       }

//       var functions = {
//         show: show
//       };

//       return functions;
//     }

//     window.PokemonApp.Modal = Modal;
// })();