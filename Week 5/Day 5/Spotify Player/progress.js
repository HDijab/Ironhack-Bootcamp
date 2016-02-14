(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function Progress(){
    var position;
    var audio = $('audio');
    var progress = $('progress');
    var percentage = progress.width() / 30;
    var updateProgress = window.SpotifyApp.Control().updateProgress;
    var buttonDisabled = window.SpotifyApp.Control().buttonDisabled;
    var calculatePosition = function(input){position = Math.round(input /= percentage);};
    var offset = $('progress').parent().offset().left;

    function updateTooltip(){
      var time = position < 10 ? ('0' + position) : position;
      progress.prop('title', '00:'+ time);
      $('.tooltip-inner').text('00:'+ time);
    }

    function read(){
      calculatePosition(event.pageX - offset);
      updateTooltip();
    }

    function update(){
      if (!buttonDisabled()){
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