## Events
You can listen to video player events like:
```dart
  initialized,
  play,
  pause,
  seekTo,
  openFullscreen,
  hideFullscreen,
  setVolume,
  progress,
  finished,
  exception,
  controlsVisible,
  controlsHidden,
  setSpeed,
  changedSubtitles,
  changedTrack,
  changedPlayerVisibility,
  changedResolution
```

After creating `BetterPlayerController` you can add event listener this way:
```dart
_betterPlayerController.addEventsListener((event){
    print("Better player event: ${event.betterPlayerEventType}");
});
```
Your event listener will be removed on dispose time automatically.
