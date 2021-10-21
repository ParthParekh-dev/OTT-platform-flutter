import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:idragon_pro/constants.dart';
import 'package:idragon_pro/controllers/promoController.dart';
import 'package:idragon_pro/screens/googleLoginScreen.dart';
import 'package:idragon_pro/screens/homeScreen.dart';

import 'package:idragon_pro/widgets/roundCornerButton.dart';

class PromoScreen extends StatefulWidget {
  @override
  _PromoScreenState createState() => _PromoScreenState();
}

class _PromoScreenState extends State<PromoScreen> {
  final PromoController promoController = Get.find();

  late BetterPlayerController _betterPlayerController;

  @override
  Widget build(BuildContext context) {
    promoController.videoPlayerReady.value = false;
    BetterPlayerControlsConfiguration controlsConfiguration =
        BetterPlayerControlsConfiguration(
      showControls: false,
      enableFullscreen: false,
      enablePlayPause: false,
      showControlsOnInitialize: false,
      loadingColor: Colors.red,
    );

    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
            autoPlay: true,
            fullScreenByDefault: false,
            deviceOrientationsOnFullScreen: [DeviceOrientation.portraitUp],
            deviceOrientationsAfterFullScreen: [DeviceOrientation.portraitUp],
            controlsConfiguration: controlsConfiguration,
            aspectRatio: 9 / 16,
            allowedScreenSleep: false,
            fit: BoxFit.fill);

    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      promoController.promoDetails.value!.flashVideoUrl,
    );

    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    promoController.videoPlayerReady.value = true;

    promoController.startTimer();

    return SafeArea(
      child: Scaffold(
        body: Obx(() => Padding(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.black,
                child: (promoController.isLoading.value)
                    ? Center(child: (CircularProgressIndicator()))
                    : Stack(
                        children: [
                          BetterPlayer(
                            controller: _betterPlayerController,
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 60),
                              child: RoundCornerButton(
                                  buttonText: (promoController
                                          .isTimerOver.value)
                                      ? ('Continue')
                                      : promoController.coundDown.toString(),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  onpressed: () {
                                    if (promoController.isTimerOver.value) {
                                      Get.off(() => GetStorage()
                                              .read(Constant().IS_GOOGLE_LOGIN)
                                          ? HomeScreen()
                                          : GoogleLoginScreen());
                                    } else {
                                      null;
                                    }
                                  }),
                            ),
                          )
                        ],
                      ),
              ),
            )),
      ),
    );
  }
}
