var fs = require('fs');
var read = require('read');
var getQuestion = require('./question.js');
var User = require('./user.js');

function quiz(){
  function loop() {
    var current = getQuestion();
    var options = {
    prompt: current.text,
    };
    function evaluate(err, response){
      console.log((current.answer));
      console.log((response));
      console.log((current.answer).indexOf(response));
      console.log((current.answer).indexOf(response) !== -1);
      if ((current.answer).indexOf(response) !== -1) {
        console.log('Correct!');
        console.log('');
        loop(); 
      } else {
        console.log('Incorrect!');
        console.log('');
        loop();
      }
    }
    read(options, evaluate);
  }
  loop();
}

function setup(){
  function storeUser(user){
    fs.writeFile("test.json", user, function(err) {
      if(err) {
          return console.log(err);
      }
    });
  }
  function saveUser(err, name){
    var user = new User(name);
    storeUser(JSON.stringify(user));
    quiz();
  }
  function start(){
    var options = {
      prompt: "What's your name?\n>"
    };
    read(options, saveUser);
  }
  start();
}


setup();
