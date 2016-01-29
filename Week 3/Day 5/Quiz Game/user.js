var User = function(name) {
  this.name = name;
  this.score = 0;
};

User.prototype.adjustScore = function(points) {
  this.score = this.score + points;
};

module.exports = User;