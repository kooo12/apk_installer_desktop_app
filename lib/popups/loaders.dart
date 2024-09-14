import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:install_apk/ui/theme/app_colors.dart';
import 'package:install_apk/utilities/sizes.dart';

class TpsLoader {
  static void openSavingLoading(
    String text,
  ) {
    showDialog(
        barrierDismissible: false,
        context: Get.context!,
        builder: (_) {
          return AlertDialog(
            backgroundColor: TpsColors.black.withOpacity(0.4),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CupertinoActivityIndicator(
                  color: TpsColors.white,
                ),
                const SizedBox(
                  height: TpsSizes.spaceBtwItems,
                ),
                Text(
                  text.tr,
                  // style: themeController.activeTheme.textTheme.titleLarge!
                  //     .copyWith(color: TpsColors.white),
                )
              ],
            ),
          );
        });
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }

  static hideSnackBar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
          ),
          // color: themeController.isDarkMode
          //     ? TpsColors.darkerGrey.withOpacity(0.9)
          //     : TpsColors.grey.withOpacity(0.9)),
          child: Center(
            child: Text(
              message,
              // style: themeController.activeTheme.textTheme.bodyMedium,
            ),
          ),
        )));
  }

  static successSnackBar({required title, message = '', duration = 3}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TpsColors.white,
        backgroundColor: TpsColors.success,
        snackPosition: SnackPosition.top,
        duration: Duration(seconds: duration),
        margin: const EdgeInsets.all(10),
        icon: const Icon(
          Iconsax.check,
          color: TpsColors.white,
        ));
  }

  static warningSanckBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TpsColors.white,
        backgroundColor: Colors.orange,
        snackPosition: SnackPosition.bottom,
        duration: const Duration(seconds: 5),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: TpsColors.white,
        ));
  }

  static errorSanckBar({required title, message = ''}) {
    Get.snackbar(title, message,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: TpsColors.white,
        backgroundColor: Colors.red.shade600,
        snackPosition: SnackPosition.bottom,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.all(20),
        icon: const Icon(
          Iconsax.warning_2,
          color: TpsColors.white,
        ));
  }
}
