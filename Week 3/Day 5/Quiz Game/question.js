var Question = function(text, answer, id) {
  this.text = text;
  this.answer = answer;
  this.id = id;
};

var q1 = new Question ('Which US state is named on the label of a Jack Daniels bottle?', 'tennessee', 1);
var q2 = new Question ('A phlebotomist extracts what from the human body?', 'blood', 2);
var q3 = new Question ('What is the female equivalent of polygyny?', 'polyandry', 3);
var q4 = new Question ('How many feet are there in a fathom?', '6', 4);
var q5 = new Question ('Granadilla is another name for which fruit?', 'passion fruit', 5);
var q6 = new Question ('Nariyal is the Indian term for which nut?', 'coconut', 6);
var q7 = new Question ('Who was president of Vietnam from 1945-54?', 'ho chi min', 7);
var q8 = new Question ('In which county of the UK is Bramber Castle?', 'west sussex', 8);
var q9 = new Question ('What type of animal was inside Sputnik 2 when launched into orbit in 1957?', 'dog', 9);
var q10 = new Question ('Who was the eldest of the Marx Brothers?', 'leonard marx', 10);
var q11 = new Question ('What type of creature is a dugite?', 'snake', 11);
var q12 = new Question ('What are the first names of English novelist G K Chesterton?', 'gilbert keith', 12);
var q13 = new Question ('In computing what does DMA normally stand for?', 'direct memory access', 13);
var q14 = new Question ('Who painted The Water Lily Pool?', 'claude monet', 14);
var q15 = new Question ('Which vitamin is also known as pantothenic acid?', 'B5', 15);
var q16 = new Question ('A couple celebrating their crystal wedding anniversary have been married for how many years?', '15', 16);
var q17 = new Question ('The song Luck be a Lady features in which musical?', 'guys and dolls', 17);
var q18 = new Question ('In the city of Manchester (England) the Irk and Medlock join which river?', 'irwell', 18);
var q19 = new Question ('What type of animal is a Kolinsky?', 'weasel', 19);
var q20 = new Question ('Who wrote the book Catch-22?', 'joseph heller', 20);
var q21 = new Question ('Kodiak Island is in which US state?', 'alaska', 21);
var q22 = new Question ('In the human body what is the hallux?', 'big toe', 22);
var q23 = new Question ('In which year did Henry VIII become King of England?', '1509', 23);
var q24 = new Question ('The 1999 film Tea with Mussolini is based on whose autobiography?', 'franco zeffirelli', 24);
var q25 = new Question ('Port Said is in which North African country?', 'egypt', 25);
var q26 = new Question ('In which year were premium bonds first issued in Britain?', '1956', 26);
var q27 = new Question ('Who designed the Beatles Sgt Peppers Lonely Hearts Club Band album cover?', 'peter blake', 27);
var q28 = new Question ('Madame de Pompadour was the mistress of which French King?', 'louis xv', 28);
var q29 = new Question ("What is the name of Moe's pet cat in the cartoon show The Simpsons?", 'mr snookums', 29);
var q30 = new Question ('Which country is known as the Pearl of Africa?', 'uganda', 30);

function getQuestion(id){
  var list = [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, q13, q14, q15, q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30];
  if (id) {
    return list[id];
  } else {
    return list[Math.floor(Math.random()*list.length)];
  }
}

module.exports = getQuestion;