$(document).ready(function() {
	 $('#searchSubmit').click(function() {
    var searchString = $('#searchInput').attr('value');

    $.getScript("http://gdata.youtube.com/feeds/api/videos?v=2&alt=json-in-script&callback=searchVideos&q=" + searchString + "&max-results=5&format=5&safeSearch=strict");

    return false;
  });

});