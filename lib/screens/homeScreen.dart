import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/controllers/homePageController.dart';
import 'package:idragon_pro/pageStructure.dart';
import 'package:idragon_pro/screens/videoDetailScreen.dart';
import 'package:page_transition/page_transition.dart';

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
        () => ListView.builder(
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
                            height: MediaQuery.of(context).size.height * 0.45),
                        carouselController: _controller,
                        items: homePageController.bannerList.map((banner) {
                          return Builder(
                            builder: (BuildContext context) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.rightToLeft,
                                          duration: Duration(milliseconds: 500),
                                          child: VideoDetailScreen(
                                              banner.iVideoId.toString())));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                                  child: CachedNetworkImage(
                                    imageUrl: banner.bannerUrl,
                                    fit: BoxFit.contain,
                                    placeholder: (context, url) => Center(
                                        child: CircularProgressIndicator()),
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
                          onTap: () => _controller.animateToPage(entry.key),
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
                                    .withOpacity(
                                        _current == entry.key ? 0.9 : 0.4)),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              );
            } else {
              var category = homePageController.categoryList[index - 1];
              if (category.banners != null)
                return Container(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(category.category),
                      ),
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          initialPage: 0,
                          viewportFraction: 1,
                          aspectRatio: 16 / 9,
                          autoPlay: false,
                          enableInfiniteScroll: false,
                          enlargeCenterPage: false,
                        ),
                        itemCount: (category.banners?.length),
                        itemBuilder: (context, index, realIdx) {
                          return Row(
                            children: category.banners!.map((idx) {
                              return Expanded(
                                flex: 1,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type:
                                                PageTransitionType.rightToLeft,
                                            duration:
                                                Duration(milliseconds: 500),
                                            child: VideoDetailScreen(
                                                idx.iVideoId.toString())));
                                  },
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.25,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: idx.iBannerUrl,
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Center(child: Icon(Icons.error)),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          );
                        },
                      ),
                    ],
                  ),
                );
              else {
                return Container();
              }
            }
          },
        ),
      ),
    );
  }
}
