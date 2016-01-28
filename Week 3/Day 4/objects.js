var Car = function(model, noise) {
  this.model = model;
  this.noise = noise;
}

Car.prototype.makeNoise = function() {
  console.log(this.noise);
}

Car.prototype.wheels = 4;

var car = new Car('honda', 'boop');
car.makeNoise();
console.log(car.model);
console.log(car.wheels);