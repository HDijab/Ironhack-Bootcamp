var Viking = function(name) {
  this.name = name;
  this.health = Math.floor((Math.random() * 50) + 10);
  this.strength = Math.floor((Math.random() * 50) + 10);
  this.accuracy = Math.floor((Math.random() * 50) + 10);
};

Viking.prototype.takeDamage = function(damage) {
  this.health = this.health - damage
};

var Saxon = function() {
  this.health = Math.floor((Math.random() * 25) + 5);
  this.strength = Math.floor((Math.random() * 25) + 5);
  this.accuracy = Math.floor((Math.random() * 25) + 5);
};

Saxon.prototype.takeDamage = function(damage) {
  this.health = this.health - damage
};

function pitFight(viking1, viking2) {
  var turns = Math.floor((Math.random() * 10) + 1);
  function chance(chance) {
    return chance > Math.floor((Math.random() * 50) + 10)
  };
  function turn(attacker, attackee) {
    if (chance(attacker.accuracy)) {
      attackee.takeDamage(Math.floor((attacker.strength)));
      console.log(attacker.name + ' swings his weapon...');
      console.log(attackee.name + ' took a hit!');
      console.log(attackee.name + ' has ' + attackee.health + ' hp left!');
      console.log('\n')
    } else {
      console.log(attacker.name + ' swings his weapon...');
      console.log(attacker.name + ' misses!');
      console.log(attackee.name + ' has ' + attackee.health + ' hp left!');
      console.log('\n')
    };
  };
  for (var i = 0; i < turns; i++) {
    turn(viking1, viking2);
    turn(viking2, viking1);
  };
  if (viking1.health > viking2.health) {
    console.log(viking1.name + ' won!');
  } else {
    console.log(viking2.name + ' won!');
  };
};

var george = new Viking('george');
var bob = new Viking('bob');

pitFight(george, bob)