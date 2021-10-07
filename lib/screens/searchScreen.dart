import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/controllers/searchController.dart';
import 'package:idragon_pro/pageStructure.dart';
import 'package:idragon_pro/screens/iDragonMain.dart';
import 'package:idragon_pro/screens/videoDetailScreen.dart';

class SearchScreen extends StatefulWidget {
  SearchScreen({required this.navigatorKey});

  final GlobalKey? navigatorKey;

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController searchController = Get.put(SearchController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return IDragonPageStructure(
      navigatorKey: widget.navigatorKey,
      mainChild: Obx(() => Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.07,
                child: Row(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    //   child: IconButton(
                    //     onPressed: () {
                    //       Get.to(() => IDragonMain());
                    //     },
                    //     icon: Icon(
                    //       Icons.arrow_back,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: TextField(
                          key: Key('100'),
                          autofocus: true,
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          onChanged: (value) {
                            searchController.fetchSearchResponse(value);
                            print(value);
                          },
                          decoration: InputDecoration(
                            hintText: 'Search here',
                            hintStyle: TextStyle(color: Color(0xFFB4B4FF)),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 180,
                          childAspectRatio: 3 / 2,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: searchController.searchResult.length,
                      itemBuilder: (BuildContext ctx, index) {
                        return (searchController
                                    .searchResult.value[index].smallBannerUrl !=
                                null)
                            ? GestureDetector(
                                onTap: () {
                                  Get.to(() => VideoDetailScreen(
                                      searchController
                                          .searchResult.value[index].id
                                          .toString()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.contain,
                                      imageUrl: searchController.searchResult
                                          .value[index].smallBannerUrl,
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Center(child: Icon(Icons.error)),
                                    ),
                                  ),
                                ),
                              )
                            : Container();
                      }),
                ),
              ),
            ],
          )),
    );
  }
}
