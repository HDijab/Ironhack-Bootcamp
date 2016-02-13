(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function Control(){
    var audio = $('audio');
    var toggleButton = function(){$('.btn-play').toggleClass('playing');};
    var buttonState = function(){return $('.btn-play').hasClass('playing');};
    var buttonDisabled = function(){return $('.btn-play').hasClass('disabled');};
    var toggleAudio = function() {audio.trigger(buttonState() ? 'play' : 'pause');};
    var changeTime = function(time) {$('progress').prop('value', time);};
    audio.on('timeupdate', updateProgress);

    function changeTimeIndicator(time){
      time = Math.floor(time);
      time = time < 10 ? ('0' + time) : time;
      time = '00:' + time;
      $('.seekbar span').text(time);
    }

    function handle(){
      if (!buttonDisabled()){
        toggleButton();
        toggleAudio();
      }
    }

    function restartPlayback() {
      changeTime(0);
      changeTimeIndicator('0');
      $('.btn-play').removeClass('playing');
      $('.btn-play').removeClass('disabled');
    }

    function updateProgress(currentTime) {
      var current = audio.prop('currentTime');
      changeTime(current);
      changeTimeIndicator(current);
      if (current >= 30) restartPlayback();
    }

    functions = {
      handle: handle,
      restartPlayback: restartPlayback
    };
    return functions;
  }

  window.SpotifyApp.Control = Control;
})();