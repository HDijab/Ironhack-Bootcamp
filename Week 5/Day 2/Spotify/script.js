$(function () {
  $('form').on('submit', function(){
    event.preventDefault();

    var searchTerm = {
      query: $('#search').val(),
      type: 'artist'
    };

    $.ajax({
      type: 'GET',
      url: 'https://api.spotify.com/v1/search',
      success: show,
      data: searchTerm,
      error: function (error) {
        console.log('Error!');
      }
    });

    function show(response) {
      console.log(response);
    }
  });
});