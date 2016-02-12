(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function Modal(){
    var artistquery;
    var artistinfo;
    var baseurl = 'https://api.spotify.com/v1/search?type=artist&q=';
    var modal = $('.modal');
    var changeHeader = function(name){$('.modal-header h2').text(name);};
    var changeImage = function(uri){$('.modal-body img').attr('src', uri);};
    
    function fetch(){
      return $.ajax(baseurl + artistquery);
    }

    function populate(){
      changeHeader(artistinfo.name);
      changeImage(artistinfo.images[0].url);
      modal.modal('show');
    }

    function parse(response){
      artistinfo = response.artists.items[0];
      populate();
    }

    function show(){
      artistquery = event.currentTarget.innerText;
      fetch().then(parse);
    }

    functions = {
      show: show
    };
    return functions;
  }

  window.SpotifyApp.Modal = Modal;
})();
