import 'package:get/get.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';

class InstallAPKController extends GetxController {
  RxList<String> apkPaths = <String>[].obs;

  void selectAPKFiles() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['apk'],
    );

    if (result != null && result.files.isNotEmpty) {
      List<String> paths = result.files.map((file) => file.path!).toList();
      apkPaths.addAll(paths);
    }
  }

  void removeAPK(int index) {
    apkPaths.removeAt(index);
  }

  void installAPKsToDevice(BuildContext context) async {
    bool adbExists = await Process.run('adb', ['version'])
        .then((result) => result.exitCode == 0)
        .catchError((error) => false);

    if (!adbExists) {
      Get.defaultDialog(
        title: 'ADB Not Found',
        middleText: 'ADB is not installed or not added to the system PATH.',
        textConfirm: 'OK',
        onConfirm: () => Get.back(),
      );
      return;
    }

    if (apkPaths.isEmpty) {
      Get.defaultDialog(
        title: 'No APKs Selected',
        middleText: 'Please select APK files to install.',
        textConfirm: 'OK',
        onConfirm: () => Get.back(),
      );
      return;
    }

    for (String apkPath in apkPaths) {
      ProcessResult result =
          await Process.run('adb', ['install', '-r', apkPath]);
      if (result.exitCode == 0) {
        Get.defaultDialog(
          title: 'Installation Successful',
          middleText: 'APK installed successfully.',
          textConfirm: 'OK',
          onConfirm: () => Get.back(),
        );
      } else {
        Get.defaultDialog(
          title: 'Installation Failed',
          middleText: 'Failed to install APK: ${result.stderr}',
          textConfirm: 'OK',
          onConfirm: () => Get.back(),
        );
      }
    }
  }
}
