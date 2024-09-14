import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:install_apk/popups/animation_loader.dart';
import 'package:install_apk/ui/theme/app_colors.dart';

class FullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          // color: themeController.isDarkMode ? TpsColors.dark : TpsColors.white,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                AnimationLoaderWidget(text: text, animation: animation),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void openSavingLoading(
    String text,
  ) {
    showDialog(
      context: Get.overlayContext!,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          // color: themeController.isDarkMode ? TpsColors.dark : TpsColors.white,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 250,
                ),
                // AnimationLoaderWidget(text: text, animation: animation),
                Text(
                  text,
                  // style: themeController.activeTheme.textTheme.bodyLarge,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Stop the currently open loading dialog.
  // This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
