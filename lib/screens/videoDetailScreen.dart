import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/controllers/videoDetailController.dart';
import 'package:idragon_pro/screens/videoScreen.dart';
// import 'package:andmagnus/screens/videoScreen.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';

class VideoDetailScreen extends StatelessWidget {
  final VideoDetailController videoDetailController =
      Get.put(VideoDetailController());

  onBackPressed(var navigatorKey) {}

  VideoDetailScreen(String id) {
    videoDetailController.fetchVideoDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => (videoDetailController.isLoading.value)
            ? Center(
                child: (CircularProgressIndicator()),
              )
            : ListView(
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: videoDetailController
                                .videoDetails.value!.nBigBannerUrl,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
                                child:
                                    Center(child: CircularProgressIndicator())),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: CircleAvatar(
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
                            bottom: -10,
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                                videoDetailController.videoDetails.value!.name,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
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
                                if (videoDetailController
                                        .videoDetails.value!.isFree ==
                                    "Yes") {
                                  Get.to(() => VideoPlayer(), arguments: [
                                    {
                                      "url": videoDetailController
                                          .videoDetails.value!.trailerUrl
                                    },
                                  ]);
                                } else if (videoDetailController
                                        .videoDetails.value!.comingSoon ==
                                    "Yes") {
                                  Get.defaultDialog(
                                      title: 'Coming Soon',
                                      middleText: 'Stay tuned');
                                } else {}
                              }),
                          RoundCornerButton(
                              buttonText: 'Play',
                              width: MediaQuery.of(context).size.width * 0.4,
                              onpressed: () {
                                Get.to(() => VideoPlayer(), arguments: [
                                  {
                                    "url": videoDetailController
                                        .videoDetails.value!.videoUrl
                                  },
                                ]);
                              })
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Icon(
                                Icons.add_to_photos_rounded,
                                color: Colors.white,
                                size: 30,
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
