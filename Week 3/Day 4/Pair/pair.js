var fs = require('fs');

function fileActions(err, file){
  function printRating(rating) {
    var totalStars = '';
    for (var i = 1; i < rating; i++) {
      totalStars = totalStars.concat('*')
    };
    return totalStars;
  }

  function display(episodes) {
    episodes.forEach(function(item){
      console.log(item.title + ' ' + item.episode_number)
      console.log(item.description)
      console.log(item.rating + ' ' + printRating(item.rating))
      console.log('\n')
    });
  }

  function jon(episode) {
    var jon = 0;
    var check = (episode.description).indexOf('Jon');
    if (check !== -1) {
      jon = episode.episode_number;
    } else {
      return;
    };
    return jon;
  }

  function searchFor(episodes) {
    episodes.forEach(function(episode){
      if (jon(episode) !== undefined) {
        console.log(jon(episode));
      }
    })
  }

  if (err) {
      throw err;
  }
  var episodes = JSON.parse(file);
  var sortedEpisodes = episodes.sort(function(a,b){
    return a.episode_number - b.episode_number
  });
  var filteredEpisodes = sortedEpisodes.filter(function(episode){
    return episode.rating > 8.5
  });
  display(sortedEpisodes);
  display(filteredEpisodes);
  searchFor(sortedEpisodes);
};

fs.readFile("./GoTEpisodes.json", 'utf8', fileActions);