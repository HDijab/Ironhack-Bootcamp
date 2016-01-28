function blastOff (timer) {
  setTimeout(function() {console.log('blastOff!')}, ((timer + 1) * 1000));
  var fix = 0
  for (var i = timer; i >= 0; i--) {
    setTimeout(function(i){console.log(i)}, i * 1000, fix);
    fix++
  };
}

blastOff(5);