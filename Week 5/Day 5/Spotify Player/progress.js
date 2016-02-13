(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function Progress(){
    var offset = $('progress').parent().offset().left;

    function read(){
      var x = event.pageX - offset;
      console.log(x);
    }

    functions = {
      read: read
    };
    return functions;
  }

  window.SpotifyApp.Progress = Progress;
})();