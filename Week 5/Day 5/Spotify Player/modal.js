(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function Modal(){
    var searchFor = window.SpotifyApp.Search('https://api.spotify.com/v1/artists/').fetch;
    var changeHeader = function(name){$('.modal-header h2').text(name);};
    var changeImage = function(uri){$('.modal-body img').attr('src', uri);};

    function populate(response){
      changeHeader(response.name);
      changeImage(response.images[0].url);
    }

    function setup(id){
      searchFor(id).then(populate);
    }

    function show(){
      $('.modal').modal('show');
    }

    functions = {
      setup: setup,
      show: show
    };
    return functions;
  }

  window.SpotifyApp.Modal = Modal;
})();
