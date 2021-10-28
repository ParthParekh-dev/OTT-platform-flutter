import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/controllers/homePageController.dart';
import 'package:idragon_pro/models/homePageResponse.dart';
import 'package:idragon_pro/screens/chatScreen.dart';
import 'package:idragon_pro/screens/webSeriesScreen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:idragon_pro/screens/profileScreen.dart';
import 'package:idragon_pro/screens/searchScreen.dart';
import 'package:share_plus/share_plus.dart';

import 'package:idragon_pro/screens/showCategoryScreen.dart';
import 'package:idragon_pro/screens/userScreen.dart';
import 'package:idragon_pro/screens/videoDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomePageController homePageController = Get.put(HomePageController());
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    homePageController.fetchHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(
            () => (homePageController.isLoading.value)
                ? Center(child: (CircularProgressIndicator()))
                : MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      itemCount: homePageController.categoryList.length + 1,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          return Stack(
                            children: [
                              CarouselSlider(
                                options: CarouselOptions(
                                  enlargeStrategy:
                                      CenterPageEnlargeStrategy.height,
                                  height:
                                      MediaQuery.of(context).size.height * 0.65,
                                  autoPlay: true,
                                  enlargeCenterPage: false,
                                  viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  disableCenter: false,
                                  autoPlayInterval: Duration(seconds: 4),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 500),
                                  autoPlayCurve: Curves.linear,
                                  scrollDirection: Axis.horizontal,
                                ),
                                carouselController: _controller,
                                items:
                                    homePageController.bannerList.map((banner) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return GestureDetector(
                                        onTap: () {
                                          Get.to(() => VideoDetailScreen(
                                              id: banner.iVideoId.toString()));
                                        },
                                        child: Stack(
                                          children: [
                                            CachedNetworkImage(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              imageUrl: banner.bannerUrl,
                                              fit: BoxFit.cover,
                                              placeholder: (context, url) => Center(
                                                  child:
                                                      CircularProgressIndicator()),
                                              errorWidget:
                                                  (context, url, error) =>
                                                      Icon(Icons.error),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 55.0),
                                              child: Align(
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        homePageController
                                                            .addToWatchlist(
                                                                GetStorage().read(
                                                                    Constant()
                                                                        .USER_ID),
                                                                banner.iVideoId
                                                                    .toString());
                                                      },
                                                      child: Icon(
                                                        Icons.add_to_photos,
                                                        color: Colors.white,
                                                        size: 50,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons
                                                          .play_circle_outline_outlined,
                                                      color: Colors.white,
                                                      size: 50,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Share.share(
                                                            'Hey I’m watching ${banner.videodetails.name}. Check it out now on iDragon New Movies App\nhttps://idragonpro.com/info.php?play=393');
                                                      },
                                                      child: Icon(
                                                        Icons.share,
                                                        color: Colors.white,
                                                        size: 50,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              Align(
                                alignment: Alignment.topCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 60.0, right: 20.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      // Get.to(() => WebSeriesScreen());
                                      Get.defaultDialog(
                                          title: 'Web series coming Soon!',
                                          middleText: 'Stay tuned');
                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          width: 130,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Center(
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                      'web_series'.tr,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          //fontWeight: FontWeight.bold,
                                                          fontSize: 14.0),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.6),
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned.fill(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      boxShadow: <BoxShadow>[
                                        BoxShadow(
                                            spreadRadius: 40.0,
                                            color: Colors.black,
                                            blurRadius: 40.0,
                                            offset: Offset(0, 0.75))
                                      ],
                                    ),
                                    // child: Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.center,
                                    //   children: homePageController.bannerList
                                    //       .asMap()
                                    //       .entries
                                    //       .map((entry) {
                                    //     return GestureDetector(
                                    //       onTap: () => _controller
                                    //           .animateToPage(entry.key),
                                    //       child: Container(
                                    //         width: 5.0,
                                    //         height: 5.0,
                                    //         margin: EdgeInsets.symmetric(
                                    //             vertical: 8.0, horizontal: 2.0),
                                    //         decoration: BoxDecoration(
                                    //             shape: BoxShape.circle,
                                    //             color: (Theme.of(context)
                                    //                             .brightness ==
                                    //                         Brightness.dark
                                    //                     ? Colors.white
                                    //                     : Colors.white)
                                    //                 .withOpacity(
                                    //                     _current == entry.key
                                    //                         ? 0.9
                                    //                         : 0.4)),
                                    //       ),
                                    //     );
                                    //   }).toList(),
                                    // ),
                                    child: Container(
                                      child: SizedBox(
                                        height: 15,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          var category =
                              homePageController.categoryList[index - 1];
                          if (category.banners != null) {
                            if (category.iType == IType.VERTICAL) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.30,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(() => ShowCategoryScreen(
                                              category: category));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                                child: Text(category.category)),
                                            Icon(
                                              Icons.chevron_right,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        physics: ScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: (category.banners?.length),
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Get.to(() => VideoDetailScreen(
                                                  id: category
                                                      .banners![index].iVideoId
                                                      .toString()));
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15.0),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                child: CachedNetworkImage(
                                                  fit: BoxFit.contain,
                                                  imageUrl: category
                                                      .banners![index]
                                                      .iBannerUrl,
                                                  placeholder: (context, url) =>
                                                      Center(
                                                          child:
                                                              CircularProgressIndicator()),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Center(
                                                              child: Icon(
                                                                  Icons.error)),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (category.iType == IType.COMMING_SOON) {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 10),
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.to(() => ShowCategoryScreen(
                                              category: category));
                                        },
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(category.category),
                                            Icon(
                                              Icons.chevron_right,
                                              color: Colors.white,
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 5.0),
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: (category.banners?.length),
                                          itemBuilder: (context, index) {
                                            return GestureDetector(
                                              onTap: () {
                                                Get.to(() => VideoDetailScreen(
                                                    id: category.banners![index]
                                                        .iVideoId
                                                        .toString()));
                                              },
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 10.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15.0),
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.fitHeight,
                                                    imageUrl: category
                                                        .banners![index]
                                                        .iBannerUrl,
                                                    placeholder: (context,
                                                            url) =>
                                                        Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Center(
                                                            child: Icon(
                                                                Icons.error)),
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else if (category.iType == IType.HORIZONTAL) {
                              return Padding(
                                padding: (index ==
                                        homePageController.categoryList.length)
                                    ? const EdgeInsets.only(bottom: 85.0)
                                    : const EdgeInsets.all(0.0),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.18,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15.0, vertical: 10),
                                        child: GestureDetector(
                                          onTap: () {
                                            Get.to(() => ShowCategoryScreen(
                                                category: category));
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(category.category),
                                              Icon(
                                                Icons.chevron_right,
                                                color: Colors.white,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount:
                                                (category.banners?.length),
                                            itemBuilder: (context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  Get.to(() =>
                                                      VideoDetailScreen(
                                                          id: category
                                                              .banners![index]
                                                              .iVideoId
                                                              .toString()));
                                                },
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.0),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.fitHeight,
                                                      imageUrl: category
                                                          .banners![index]
                                                          .iBannerUrl,
                                                      placeholder: (context,
                                                              url) =>
                                                          Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Center(
                                                              child: Icon(
                                                                  Icons.error)),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return Container();
                            }
                          } else {
                            return Container();
                          }
                        }
                      },
                    ),
                  ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xFFC4C4C4).withOpacity(0.8),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(
                        Icons.home,
                        size: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => UserScreen());
                        },
                        child: Icon(
                          Icons.videocam_rounded,
                          size: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => SearchScreen());
                        },
                        child: Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          Get.to(() => ChatScreen());
                          // const url =
                          //     'https://idragonpro.com/chatwindow.php#max-widget';
                          // if (await canLaunch(url)) {
                          //   await launch(url);
                          // } else {
                          //   throw 'Could not launch $url';
                          // }
                        },
                        child: Icon(
                          Icons.message,
                          size: 30,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => ProfileScreen());
                        },
                        child: Icon(
                          Icons.person,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
