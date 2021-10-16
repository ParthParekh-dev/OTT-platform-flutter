import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoPlayer extends StatefulWidget {
  @override
  _VideoPlayerState createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late BetterPlayerController _betterPlayerController;
  // var argumentData = Get.arguments;
  List<BetterPlayerDataSource> dataSourceList = <BetterPlayerDataSource>[];
  late BetterPlayerConfiguration betterPlayerConfiguration;

  @override
  void initState() {
    super.initState();

    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      ),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    );
    dataSourceList.add(
      BetterPlayerDataSource(BetterPlayerDataSourceType.network,
          "http://sample.vodobox.com/skate_phantom_flex_4k/skate_phantom_flex_4k.m3u8"),
    );

    BetterPlayerControlsConfiguration controlsConfiguration =
        BetterPlayerControlsConfiguration(
      controlBarColor: Colors.black26,
      iconsColor: Colors.white,
      playIcon: Icons.play_arrow_outlined,
      progressBarPlayedColor: Colors.indigo,
      progressBarHandleColor: Colors.indigo,
      skipBackIcon: Icons.replay_10_outlined,
      skipForwardIcon: Icons.forward_10_outlined,
      overflowMenuIcon: Icons.settings,
      backwardSkipTimeInMilliseconds: 10000,
      forwardSkipTimeInMilliseconds: 10000,
      enableSkips: true,
      enableFullscreen: true,
      enablePip: true,
      enablePlayPause: true,
      enableMute: true,
      enableAudioTracks: true,
      enableProgressText: true,
      enableSubtitles: false,
      showControlsOnInitialize: true,
      enablePlaybackSpeed: true,
      loadingColor: Colors.red,
      overflowModalColor: Colors.black54,
      overflowModalTextColor: Colors.white,
      overflowMenuIconsColor: Colors.white,
    );

    betterPlayerConfiguration = BetterPlayerConfiguration(
        autoPlay: true,
        fullScreenByDefault: true,
        controlsConfiguration: controlsConfiguration,
        aspectRatio: 16 / 9,
        fullScreenAspectRatio: 16 / 9,
        allowedScreenSleep: false,
        fit: BoxFit.contain);

    // BetterPlayerDataSource dataSource = BetterPlayerDataSource(
    //   BetterPlayerDataSourceType.network,
    //   argumentData[0]['url'],
    // );
    //
    // _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    // _betterPlayerController.setupDataSource(dataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.3,
      child: BetterPlayerPlaylist(
          betterPlayerConfiguration: betterPlayerConfiguration,
          betterPlayerPlaylistConfiguration: BetterPlayerPlaylistConfiguration(
            nextVideoDelay: Duration(seconds: 5),
          ),
          betterPlayerDataSourceList: dataSourceList),
    );
  }
}
