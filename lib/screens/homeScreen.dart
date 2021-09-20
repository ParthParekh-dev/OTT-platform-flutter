import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/controllers/homePageController.dart';
import 'package:idragon_pro/models/homePageResponse.dart';
import 'package:idragon_pro/pageStructure.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';
import 'package:idragon_pro/widgets/roundCornerIconButton.dart';

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
                              return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                child: Image.network(
                                  banner.bannerUrl,
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
              return Container(
                height: MediaQuery.of(context).size.height * 0.25,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(category.category),
                    CarouselSlider.builder(
                      options: CarouselOptions(
                        initialPage: 0,
                        autoPlay: false,
                        enableInfiniteScroll: false,
                        enlargeCenterPage: false,
                        viewportFraction: 1,
                      ),
                      itemCount: (category.banners?.length),
                      itemBuilder: (context, index, realIdx) {
                        return Row(
                          children: category.banners!.map((idx) {
                            return Expanded(
                              flex: 1,
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                child: Image.network(idx.iBannerUrl,
                                    fit: BoxFit.fill),
                              ),
                            );
                          }).toList(),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

//mainChild: Obx(
//           () => ListView(
//             children: [
//               Column(
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: CarouselSlider(
//                       options: CarouselOptions(
//                           autoPlay: true,
//                           enlargeCenterPage: false,
//                           aspectRatio: 16 / 9,
//                           onPageChanged: (index, reason) {
//                             setState(() {
//                               _current = index;
//                             });
//                           },
//                           initialPage: 0,
//                           enableInfiniteScroll: false,
//                           disableCenter: true,
//                           autoPlayInterval: Duration(seconds: 4),
//                           autoPlayAnimationDuration:
//                               Duration(milliseconds: 800),
//                           autoPlayCurve: Curves.linear,
//                           scrollDirection: Axis.horizontal,
//                           height: MediaQuery.of(context).size.height * 0.5),
//                       carouselController: _controller,
//                       items: homePageController.bannerList.map((banner) {
//                         return Builder(
//                           builder: (BuildContext context) {
//                             return Container(
//                               width: MediaQuery.of(context).size.width,
//                               margin: EdgeInsets.symmetric(horizontal: 5.0),
//                               child: Image.network(
//                                 banner.bannerUrl,
//                               ),
//                             );
//                           },
//                         );
//                       }).toList(),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: homePageController.bannerList
//                         .asMap()
//                         .entries
//                         .map((entry) {
//                       return GestureDetector(
//                         onTap: () => _controller.animateToPage(entry.key),
//                         child: Container(
//                           width: 8.0,
//                           height: 8.0,
//                           margin: EdgeInsets.symmetric(
//                               vertical: 8.0, horizontal: 2.0),
//                           decoration: BoxDecoration(
//                               shape: BoxShape.circle,
//                               color: (Theme.of(context).brightness ==
//                                           Brightness.dark
//                                       ? Colors.white
//                                       : Colors.white)
//                                   .withOpacity(
//                                       _current == entry.key ? 0.9 : 0.4)),
//                         ),
//                       );
//                     }).toList(),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ));
