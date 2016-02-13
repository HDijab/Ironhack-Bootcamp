(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function Progress(){
    var position;
    var audio = $('audio');
    var progress = $('progress');
    var updateProgress = window.SpotifyApp.Control().updateProgress;
    var buttonState = window.SpotifyApp.Control().buttonState;
    var calculatePosition = function(input){position = Math.round(input /= 5);};
    var offset = $('progress').parent().offset().left;

    function updateTooltip(){
      var time = position < 10 ? ('0' + position) : position;
      progress.prop('title', '00:'+ time);
      $('.tooltip-inner').text('00:'+ time);
    }

    function read(){
      calculatePosition(event.pageX - offset);
      updateTooltip();
      if (buttonState()){
        progress.tooltip();
      } else {
        progress.tooltip('hide');
      }
    }

    function update(){
      if (buttonState()){
        audio.prop('currentTime', position);
        updateProgress(position);
      }
    }

    functions = {
      read: read,
      update: update
    };
    return functions;
  }

  window.SpotifyApp.Progress = Progress;
})();