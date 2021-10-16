import 'dart:io';

import 'package:better_player/better_player.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_sim_country_code/flutter_sim_country_code.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/controllers/videoDetailController.dart';
import 'package:idragon_pro/screens/mobileLoginScreen.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';

class VideoDetailScreen extends StatelessWidget {
  late BetterPlayerController _betterPlayerController;

  final VideoDetailController videoDetailController =
      Get.put(VideoDetailController());

  onBackPressed(var navigatorKey) {}

  VideoDetailScreen(String id) {
    videoDetailController.fetchVideoDetails(id);
  }
  Future<void> activateVideoPlayer({required String videoUrl}) async {
    String? platformVersion;

    try {
      platformVersion = await FlutterSimCountryCode.simCountryCode;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    print(platformVersion);

    try {
      _betterPlayerController.pause();
    } catch (e) {
      print(e);
    }

    videoDetailController.videoPlayerReady.value = false;
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

    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
            autoPlay: true,
            fullScreenByDefault: false,
            deviceOrientationsOnFullScreen: [
              DeviceOrientation.landscapeLeft,
              DeviceOrientation.landscapeRight
            ],
            deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
            controlsConfiguration: controlsConfiguration,
            aspectRatio: 16 / 9,
            fullScreenAspectRatio: 16 / 9,
            allowedScreenSleep: false,
            fit: BoxFit.contain);

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      videoUrl,
    );

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    videoDetailController.videoPlayerReady.value = true;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          appBar: (videoDetailController.videoPlayerReady.value)
              ? AppBar(
                  backgroundColor: Colors.black,
                )
              : null,
          body: (videoDetailController.isLoading.value)
              ? Center(
                  child: (CircularProgressIndicator()),
                )
              : ListView(
                  children: [
                    Column(
                      children: [
                        (videoDetailController.videoPlayerReady.value)
                            ? BetterPlayer(
                                controller: _betterPlayerController,
                              )
                            : Stack(
                                children: [
                                  CachedNetworkImage(
                                    imageUrl: videoDetailController
                                        .videoDetails.value!.nBigBannerUrl,
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) => Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.6,
                                        child: Center(
                                            child:
                                                CircularProgressIndicator())),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                  Align(
                                    alignment: Alignment.topLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.black,
                                        child: IconButton(
                                          icon: Icon(Icons.arrow_back),
                                          onPressed: () {
                                            Get.back();
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      height: 20,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                              spreadRadius: 90.0,
                                              color: Colors.black,
                                              blurRadius: 80.0,
                                              offset: Offset(0.75, 0))
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        videoDetailController
                                            .videoDetails.value!.name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            videoDetailController.videoDetails.value!.synopsis,
                            maxLines: 2,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundCornerButton(
                                buttonText: 'Trailer',
                                width: MediaQuery.of(context).size.width * 0.4,
                                onpressed: () {
                                  activateVideoPlayer(
                                      videoUrl: videoDetailController
                                          .videoDetails.value!.trailerUrl);
                                  // Get.to(() => VideoPlayer(), arguments: [
                                  //   {
                                  //     "url": videoDetailController
                                  //         .videoDetails.value!.trailerUrl
                                  //   }
                                  // ]);
                                }),
                            RoundCornerButton(
                                buttonText: 'Play',
                                width: MediaQuery.of(context).size.width * 0.4,
                                onpressed: () {
                                  if (videoDetailController
                                          .videoDetails.value!.comingSoon ==
                                      "Yes") {
                                    Get.defaultDialog(
                                        title: 'Coming Soon',
                                        middleText: 'Stay tuned');
                                  } else if (videoDetailController
                                          .videoDetails.value!.isFree ==
                                      "Yes") {
                                    activateVideoPlayer(
                                        videoUrl: videoDetailController
                                            .videoDetails.value!.videoUrl);
                                  } else {
                                    Get.to(() => MobileLoginScreen());
                                  }
                                })
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    videoDetailController.addToWatchlist(
                                        GetStorage().read(Constant().USER_ID),
                                        videoDetailController
                                            .videoDetails.value!.id
                                            .toString());
                                  },
                                  child: (videoDetailController
                                          .addingToWatchList.value)
                                      ? (CircularProgressIndicator())
                                      : Icon(
                                          Icons.add_to_photos_rounded,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                ),
                                Text(
                                  'Watch List',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  'Share',
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'More Details',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 120, vertical: 0),
                          child: Divider(
                            thickness: 2,
                            color: Colors.red,
                          ),
                        ),
                        VideoDetailTile(
                            subtitle: videoDetailController
                                .videoDetails.value!.genre
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', ''),
                            title: 'Genre'),
                        VideoDetailTile(
                            subtitle: videoDetailController
                                .videoDetails.value!.sDirector,
                            title: 'Directors'),
                        VideoDetailTile(
                            subtitle: videoDetailController
                                .videoDetails.value!.starCast
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', ''),
                            title: 'Cast'),
                        VideoDetailTile(
                            subtitle: videoDetailController
                                .videoDetails.value!.category,
                            title: 'Language'),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1,
                        )
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}

class VideoDetailTile extends StatelessWidget {
  VideoDetailTile({required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Text(
            subtitle,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Divider(
            thickness: 2,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
