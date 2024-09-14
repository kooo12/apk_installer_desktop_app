import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:install_apk/controllers/theme_controller.dart';

import 'splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // const menuRatio = 5.0;
    // final height = Get.height / menuRatio;
    final imageHeights = MediaQuery.of(context).size.height;
    final imageWidth = MediaQuery.of(context).size.width;
    final themeController = Get.find<ThemeController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // ignore: sdk_version_ui_as_code
          if (controller.backgroungImage != null)
            Image.asset(
              controller.backgroungImage!,
              fit: BoxFit.fill,
              height: imageHeights,
              width: imageWidth,
            ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // ignore: sdk_version_ui_as_code
                // if (controller.isTitleShow &&
                //     controller.titlePosition == TitlePosition.top)
                //   (Padding(
                //     padding: EdgeInsets.only(bottom: 10),
                //     child: Text(
                //       controller.title ?? "",
                //       style: controller.activeTheme.textTheme.displayMedium,
                //     ),
                //   )),
                // ignore: sdk_version_ui_as_code
                if (controller.logoImage != null)
                  Container(
                    margin: const EdgeInsets.only(bottom: 200),
                    width: controller.logoWidth,
                    height: controller.logoHeight,
                    child: Image.asset(
                      controller.logoImage!,
                    ),
                  ),
                // ignore: sdk_version_ui_as_code
                if (controller.isTitleShow &&
                    controller.titlePosition == TitlePosition.bottom)
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Text(
                      controller.title!.tr,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                // ignore: sdk_version_ui_as_code
              ],
            ),
          ),
          // ignore: sdk_version_ui_as_code
          if (controller.isShowVersion)
            Positioned(
              left: 10,
              right: 10,
              bottom: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text(
                  //   "ver",
                  //   style: TextStyle(fontSize: 20),
                  // ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Text(
                    controller.version?.tr ?? "",
                    style: themeController.activeTheme.textTheme.titleSmall,
                  ),
                ],
              ),
            ),
          if (controller.isShowLoading)
            const Positioned(
              left: 30,
              right: 30,
              bottom: 230,
              child: Center(),
            ),
        ],
      ),
    );
  }
}
