(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function Control(){
    var audio = $('audio');
    var toggleButton = function(){$('.btn-play').toggleClass('playing');};
    var buttonState = function(){return $('.btn-play').hasClass('playing');};
    var toggleAudio = function() {audio.trigger(buttonState() ? 'play' : 'pause');};
    var changeTime = function(time) {$('progress').prop('value', time);};
    audio.on('timeupdate', updateProgress);

    function handle(){
      toggleButton();
      toggleAudio();
    }

    function restartPlayback() {
      toggleButton();
      changeTime(0);
    }

    function updateProgress(currentTime) {
      var current = audio.prop('currentTime');
      changeTime(current);
      if (current >= 30) restartPlayback();
    }

    functions = {
      handle: handle
    };
    return functions;
  }

  window.SpotifyApp.Control = Control;
})();