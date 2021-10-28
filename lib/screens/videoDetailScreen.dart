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
import 'package:idragon_pro/widgets/descriptionText.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoDetailScreen extends StatelessWidget {
  late BetterPlayerController _betterPlayerController;

  final VideoDetailController videoDetailController =
      Get.put(VideoDetailController());

  onBackPressed(var navigatorKey) {}

  VideoDetailScreen({required id}) {
    videoDetailController.fetchVideoDetails(id);
  }

  @override
  Widget build(BuildContext context) {
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
        playerTheme: BetterPlayerTheme.material,
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
              autoDetectFullscreenDeviceOrientation: false,
              deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
              controlsConfiguration: controlsConfiguration,
              aspectRatio: MediaQuery.of(context).size.width /
                  MediaQuery.of(context).size.height,
              allowedScreenSleep: false,
              fit: BoxFit.cover);

      BetterPlayerDataSource dataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        videoUrl,
      );

      _betterPlayerController =
          BetterPlayerController(betterPlayerConfiguration);
      _betterPlayerController.setupDataSource(dataSource);
      videoDetailController.videoPlayerReady.value = true;
    }

    return SafeArea(
      child: Obx(
        () => Scaffold(
          body: (videoDetailController.isLoading.value)
              ? Center(
                  child: (CircularProgressIndicator()),
                )
              : ListView(
                  children: [
                    Column(
                      children: [
                        (videoDetailController.videoPlayerReady.value)
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.33,
                                child: BetterPlayer(
                                  controller: _betterPlayerController,
                                ),
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
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(15.0),
                                              child: Text(
                                                videoDetailController
                                                    .videoDetails.value!.name,
                                                maxLines: 2,
                                                overflow: TextOverflow.clip,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          // child: Text(
                          //   videoDetailController.videoDetails.value!.synopsis,
                          //   maxLines: 2,
                          // ),
                          child: DescriptionTextWidget(videoDetailController
                              .videoDetails.value!.synopsis),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            RoundCornerButton(
                                buttonText: 'trailer'.tr,
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
                                buttonText: 'play'.tr,
                                width: MediaQuery.of(context).size.width * 0.4,
                                onpressed: () async {
                                  var videoDetail =
                                      videoDetailController.videoDetails.value!;
                                  if (videoDetail.comingSoon == "Yes") {
                                    Get.defaultDialog(
                                        title: 'coming_soon'.tr,
                                        middleText: 'Stay tuned');
                                  } else if (videoDetail.isFree == "Yes") {
                                    print('//////////free');
                                    activateVideoPlayer(
                                        videoUrl: videoDetail.videoUrl);
                                  } else if (videoDetail.isIosFree == "1") {
                                    print('//////////IoS');
                                    activateVideoPlayer(
                                        videoUrl: videoDetail.videoUrl);
                                  } else if (GetStorage()
                                      .read(Constant().IS_MOVIE_SUBS)) {
                                    print('//////////movieSub');
                                    activateVideoPlayer(
                                        videoUrl: videoDetail.videoUrl);
                                  } else if (videoDetail.sAllowedInPackage ==
                                          "1" ||
                                      videoDetail.daysdiff > 0 ||
                                      videoDetail.timediff > 0) {
                                    print('//////////package');
                                    activateVideoPlayer(
                                        videoUrl: videoDetail.videoUrl);
                                  } else {
                                    if (GetStorage()
                                        .read(Constant().IS_MOBILE_LOGIN)) {
                                      var url =
                                          'https://idragonpro.com/idragon/web_razor_payment_form/${GetStorage().read(Constant().USER_ID)}/' +
                                              videoDetail.id.toString();
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    } else {
                                      Get.to(() => MobileLoginScreen(),
                                          arguments: [videoDetail.id]);
                                    }
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
                                  'watch_list'.tr,
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            ),
                            Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Share.share(
                                        'Hey I’m watching ${videoDetailController.videoDetails.value!.name}. Check it out now on iDragon New Movies App\nhttps://idragonpro.com/info.php?play=393');
                                  },
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                                Text(
                                  'share'.tr,
                                  style: TextStyle(fontSize: 15),
                                )
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Text(
                            'more_details'.tr,
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
                            title: 'gener'.tr),
                        VideoDetailTile(
                            subtitle: videoDetailController
                                .videoDetails.value!.sDirector,
                            title: 'directors'.tr),
                        VideoDetailTile(
                            subtitle: videoDetailController
                                .videoDetails.value!.starCast
                                .toString()
                                .replaceAll('[', '')
                                .replaceAll(']', ''),
                            title: 'cast'.tr),
                        VideoDetailTile(
                            subtitle: videoDetailController
                                .videoDetails.value!.category,
                            title: 'language'.tr),
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
