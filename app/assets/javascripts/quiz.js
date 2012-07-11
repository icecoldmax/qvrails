var tag = document.createElement('script');
    tag.src = "http://www.youtube.com/player_api";
    var firstScriptTag = document.getElementsByTagName('script')[0];
    firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
        
    var ytplayer;

    function onYouTubePlayerAPIReady() {
        ytplayer = new YT.Player('ytplayer', {
          
          width: '100%',
          height: '100%',
          //videoId: getParameterByName('vid0'),
          playerVars: { 'autoplay': 0, 'controls': 0, 'wmode': 'opaque',
          				//'playlist': vids.join(),
          				'origin': 'http://www.stopdontpanic.com/', 'modestbranding': 1, 'showinfo': 0 
          			},
          events: {
            'onReady': onPlayerReady,
            'onStateChange': onPlayerStateChange,
            'onError': onPlayerError
          }
        });
    }
    function onPlayerReady(evt) {
     	//setInterval(updatePlayerInfo, 1000);
     	//updatePlayerInfo();
     	//interval = getParameterByName('interval');
     	//ytplayer.loadPlaylist(vids);
	 	//initIFrameClick();
	//	evt.target.playVideo();
  console.log("Player is ready");
    }
 
 function onPlayerStateChange(evt) {
 		var newState = evt.data;
 //   	updateHTML("playerState", newState);
		console.log("newState: " + newState);
	if (newState == 0 || newState == 2 || newState == 3 || newState == 5) {
		clearInterval(t);
		console.log("clearInterval ran (state change)");
	} else if (newState == 1) {
		t = setInterval(stopAtTime, 1000, interval);
	}

 }

 // This function is called when an error is thrown by the player
function onPlayerError(errorCode) {
  alert("An error occured of type:" + errorCode);
}

// Update a particular HTML element with a new value
function updateHTML(elmId, value) {
  document.getElementById(elmId).innerHTML = value;
}

// Display information about the current state of the player
function updatePlayerInfo() {
// Also check that at least one function exists since when IE unloads the page, it will destroy the SWF before clearing the interval.
    if(ytplayer && ytplayer.getDuration) {
      updateHTML("videoDuration", ytplayer.getDuration());
      updateHTML("videoCurrentTime", ytplayer.getCurrentTime());
      updateHTML("bytesTotal", ytplayer.getVideoBytesTotal());
      //updateHTML("startBytes", ytplayer.getVideoStartBytes());
      updateHTML("bytesLoaded", ytplayer.getVideoBytesLoaded());
      updateHTML("volume", ytplayer.getVolume());
    }
}

/*
__________.__                              _________                __                .__          
\______   \  | _____  ___.__. ___________  \_   ___ \  ____   _____/  |________  ____ |  |   ______
 |     ___/  | \__  \<   |  |/ __ \_  __ \ /    \  \/ /  _ \ /    \   __\_  __ \/  _ \|  |  /  ___/
 |    |   |  |__/ __ \\___  \  ___/|  | \/ \     \___(  <_> )   |  \  |  |  | \(  <_> )  |__\___ \ 
 |____|   |____(____  / ____|\___  >__|     \______  /\____/|___|  /__|  |__|   \____/|____/____  >
                    \/\/         \/                \/            \/                             \/ 
*/

function setVideoVolume() {
  var volume = parseInt(document.getElementById("volumeSetting").value);
  if(isNaN(volume) || volume < 0 || volume > 100) {
      alert("Please enter a valid volume between 0 and 100.");
  } else if (ytplayer) {
      ytplayer.setVolume(volume);
  }
}

function playVideo() {
  if (ytplayer) {
    ytplayer.playVideo();
  }
}

function playWithStops() {
  if (ytplayer) {
    console.log("PlayWithStops function ran");      
    updateHTML("interval", interval);
    ytplayer.setPlaybackQuality("default");
    ytplayer.playVideo();
  }
}

function pauseVideo() {
  if (ytplayer) {
      ytplayer.pauseVideo();
      console.log("PauseVideo function ran");
  }
}

function stopVideo() {
  if (ytplayer) {
      ytplayer.stopVideo();
      console.log("Stopvideo function ran");
  }
}

function muteVideo() {
  if(ytplayer) {
      ytplayer.mute();
  }
}

function unMuteVideo() {
  if(ytplayer) {
      ytplayer.unMute();
  }
}