import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:idragon_pro/controllers/promoController.dart';
import 'package:idragon_pro/screens/iDragonMain.dart';
import 'package:idragon_pro/widgets/roundCornerButton.dart';
import 'package:idragon_pro/widgets/videoItems.dart';
// import 'package:video_player/video_player.dart';

class PromoScreen extends StatelessWidget {
  final PromoController promoController = Get.put(PromoController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Obx(() => Container(
              color: Colors.black,
              child: (promoController.isLoading.value)
                  ? Center(child: (CircularProgressIndicator()))
                  : Stack(
                      children: [
                        // VideoItems(
                        //   videoPlayerController: VideoPlayerController.network(
                        //       promoController
                        //           .promoDetails.value!.flashVideoUrl),
                        //   looping: false,
                        //   autoplay: true,
                        //   showControls: false,
                        //   fullScreenDefault: false,
                        //   aspectRatio: 9 / 16,
                        // ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 60),
                            child: RoundCornerButton(
                                buttonText: (promoController.isTimerOver.value)
                                    ? ('Continue')
                                    : promoController.coundDown.toString(),
                                width: MediaQuery.of(context).size.width * 0.4,
                                onpressed: () {
                                  if (promoController.isTimerOver.value) {
                                    Get.to(() => IDragonMain());
                                  } else {
                                    null;
                                  }
                                }),
                          ),
                        )
                      ],
                    ),
            )),
      ),
    );
  }
}
