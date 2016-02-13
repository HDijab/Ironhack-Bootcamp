(function(){
  window.SpotifyApp = window.SpotifyApp || {};

  function Progress(){
    var position;
    var audio = $('audio');
    var progress = $('progress');
    var updateProgress = window.SpotifyApp.Control().updateProgress;
    var buttonDisabled = window.SpotifyApp.Control().buttonDisabled;
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
      if (!buttonDisabled()){
        progress.tooltip();
      } else {
        progress.tooltip('hide');
      }
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