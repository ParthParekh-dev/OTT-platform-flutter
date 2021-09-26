import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/controllers/homePageController.dart';
import 'package:idragon_pro/models/homePageResponse.dart';
import 'package:idragon_pro/pageStructure.dart';
import 'package:idragon_pro/screens/videoDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.navigatorKey});

  final GlobalKey? navigatorKey;

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
    return IDragonPageStructure(
      navigatorKey: widget.navigatorKey,
      mainChild: Obx(
        () => (homePageController.isLoading.value)
            ? Center(child: (CircularProgressIndicator()))
            : ListView.builder(
                itemCount: homePageController.categoryList.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                  autoPlay: true,
                                  enlargeCenterPage: false,
                                  aspectRatio: 16 / 9,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      _current = index;
                                    });
                                  },
                                  initialPage: 0,
                                  enableInfiniteScroll: false,
                                  disableCenter: true,
                                  autoPlayInterval: Duration(seconds: 4),
                                  autoPlayAnimationDuration:
                                      Duration(milliseconds: 800),
                                  autoPlayCurve: Curves.linear,
                                  scrollDirection: Axis.horizontal,
                                  height: MediaQuery.of(context).size.height *
                                      0.45),
                              carouselController: _controller,
                              items:
                                  homePageController.bannerList.map((banner) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(() => VideoDetailScreen(
                                            banner.iVideoId.toString()));
                                      },
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.0),
                                        child: CachedNetworkImage(
                                          imageUrl: banner.bannerUrl,
                                          fit: BoxFit.contain,
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    );
                                  },
                                );
                              }).toList(),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: homePageController.bannerList
                                .asMap()
                                .entries
                                .map((entry) {
                              return GestureDetector(
                                onTap: () =>
                                    _controller.animateToPage(entry.key),
                                child: Container(
                                  width: 8.0,
                                  height: 8.0,
                                  margin: EdgeInsets.symmetric(
                                      vertical: 8.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.dark
                                              ? Colors.white
                                              : Colors.white)
                                          .withOpacity(_current == entry.key
                                              ? 0.9
                                              : 0.4)),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    );
                  } else {
                    var category = homePageController.categoryList[index - 1];
                    if (category.banners != null) {
                      if (category.iType == IType.VERTICAL) {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 10),
                                child: Text(category.category),
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
                                        Get.to(() => VideoDetailScreen(category
                                            .banners![index].iVideoId
                                            .toString()));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.contain,
                                            imageUrl: category
                                                .banners![index].iBannerUrl,
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) => Center(
                                                    child: Icon(Icons.error)),
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
                      } else {
                        return Container(
                          height: MediaQuery.of(context).size.height * 0.20,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 10),
                                child: Text(category.category),
                              ),
                              Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: (category.banners?.length),
                                  itemBuilder: (context, index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Get.to(() => VideoDetailScreen(category
                                            .banners![index].iVideoId
                                            .toString()));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: CachedNetworkImage(
                                            fit: BoxFit.contain,
                                            imageUrl: category
                                                .banners![index].iBannerUrl,
                                            placeholder: (context, url) => Center(
                                                child:
                                                    CircularProgressIndicator()),
                                            errorWidget:
                                                (context, url, error) => Center(
                                                    child: Icon(Icons.error)),
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
                      }
                    } else {
                      return Container();
                    }
                  }
                },
              ),
      ),
    );
  }
}
