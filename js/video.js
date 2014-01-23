// 2. This code loads the IFrame Player API code asynchronously.
var tag = document.createElement('script');
tag.src = "http://www.youtube.com/player_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);
// 3. This function creates an <iframe> (and YouTube player)
//    after the API code downloads.
var player;
function onYouTubePlayerAPIReady() {
  player = new YT.Player('player', {
    height: '100%',
    width: '100%',
    playerVars: { 'rel':0 , 'autoplay': 0, 'loop':1, 'controls':0, 'start':00, 'autohide':1,'wmode':'opaque' },
    videoId: 'j0bhd6AkGFk',
    events: {
      'onReady': onPlayerReady,
      'onStateChange': onPlayerStateChange}
  });
}
// 4. The API will call this function when the video player is ready.
function onPlayerReady(event) {
  event.target.mute();
  //    event.target.setSize(width:100, height:750);
}
// when video ends
function onPlayerStateChange(event) {
    if(event.data === 0) {
        event.target.playVideo();
    }
  }

