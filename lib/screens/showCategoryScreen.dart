import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/models/homePageResponse.dart';
import 'package:idragon_pro/screens/videoDetailScreen.dart';

class ShowCategoryScreen extends StatelessWidget {
  Category category;

  ShowCategoryScreen({required this.category});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(category.category),
        ),
        body: Container(
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: (category.banners?.length),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Get.to(() => VideoDetailScreen(
                      category.banners![index].iVideoId.toString()));
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
                              imageUrl: category.banners![index].iBannerUrl,
                              placeholder: (context, url) =>
                                  Center(child: CircularProgressIndicator()),
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
                            category.banners![index].videodetails.name,
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
