import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/controllers/watchListController.dart';

import 'package:idragon_pro/screens/videoDetailScreen.dart';

class UserScreen extends StatefulWidget {
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  final WatchListController watchListController =
      Get.put(WatchListController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    watchListController.fetchWatchList(GetStorage().read(Constant().USER_ID));

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ),
                  Image.asset('assets/logo.png'),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5.0),
                    child: Icon(
                      Icons.settings,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                'watch_list'.tr,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 0),
              child: Divider(
                thickness: 2,
                color: Colors.red,
              ),
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: (watchListController.watchList.value.length),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => VideoDetailScreen(id:watchListController
                              .watchList.value[index].iVideoId
                              .toString()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.contain,
                                      imageUrl: (watchListController
                                                  .watchList
                                                  .value[index]
                                                  .nSmallBannerUrl ==
                                              null)
                                          ? ('https://www.coorg.com/wp-content/themes/TechNews/images/img_not_available.png')
                                          : watchListController.watchList
                                              .value[index].nSmallBannerUrl,
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Center(child: Icon(Icons.error)),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    watchListController
                                        .watchList.value[index].name,
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
