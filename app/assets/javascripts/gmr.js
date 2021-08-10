$(function(){

  $('.request-button').click(function(){
    //音量をとっておく
    var volume = player[0].getVolume();
    //音量を下げる
    player[0].setVolume(1);
    $('#new-channel').on('hidden.bs.modal', function () {
      player[0].setVolume(volume);
      player[1].stopVideo();
      if ($('#add-song-window').is(':visible')) {
        $('#add-song-window').toggle();
      }
    });
  });
  $('#search').click(function(){

    // 検索キーワードからyoutubeを検索
    var url = "https://www.googleapis.com/youtube/v3/search";
    var options = {
      'q': $('#q').val(),
      'key': 'AIzaSyBVZsvnYDYssm2u3br2Ma84wLm0TmREWdQ',
      'part': 'id, snippet',
      'alt': "json",
      'type': 'video',
      'maxResults': 50
    };
    $('#list').empty();
    $.get(url, options, function(rs){
      for (var i=0; i<rs.items.length; i++) {
        var f = rs.items[i]
        var imageUrl = 'url(' + f['snippet']['thumbnails']['default']['url'] + ')'
        $('#list').append(
          $('<li class="movie">').css({'background-image':imageUrl, 'background-size':'cover', 'color':'#ddd'}).append(
            $('<div class="movie-img">').css({'background':'rgba(0, 0, 0, 0.6)','height':'100%'}).append(f['snippet']['title']
            )
          ).data('video-id', f['id']['videoId'])
        )
      }
    }, "json");
  });
  $(document).on('click', 'li.movie', function(){
    if ($('#add-song-window').is(':hidden')) {
      $('#add-song-window').toggle();
    }
    player[1].loadVideoById($(this).data('video-id'));
  });

  $("#add-song-button").click(function(){
    console.log(player[1].getVideoUrl())
    var url = player[1].getVideoUrl();
    $.ajax({
        url: "/impressions",
        type: "POST",
        data: {channel_id: channel_id,
                url: url
                },
        dataType: "html",
        success: function(data) {
            alert("success");
        },
        error: function(data) {
            alert("errror");
        }
    });
  });

});
