(function() {
  window.Spotify = window.Spotify || {};

  var SearchManager = function(container) {
    this.container = container;
    this.returned = [];
  };

  SearchManager.prototype.parse = function(results) {
    var manager = this;
    results.forEach( function(result) {
      var item = new Spotify.SearchTerm(result);
      manager.returned.push(item);
    });
    console.log(manager.returned);
  };

  SearchManager.prototype.request = function(data) {
    var manager = this;
    $.ajax({
      type: 'GET',
      url: 'https://api.spotify.com/v1/search',
      success: function (results) {
        var data = results.artists.items;
        manager.parse(data);
      },
      data: data,
      error: function (error) {
        console.error('Error!');
      }
    });
  };

  SearchManager.prototype.search = function(query, type) {
    var searchData = {
      query: query,
      type: type
    };
    
    this.request(searchData);
  };

  window.Spotify.SearchManager = SearchManager;
})();