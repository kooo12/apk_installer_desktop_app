import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:install_apk/controllers/app_controller.dart';
import 'package:install_apk/controllers/theme_controller.dart';
import 'package:install_apk/routes/app_routes.dart';

enum TitlePosition {
  top,
  bottom,
}

class SplashController extends GetxController {
  //Static --------------------------------------------------------NONE

  //Public  -------------------------------------------------------NONE
  String? version = "";
  TitlePosition titlePosition = TitlePosition.top;
  bool isTitleShow = true;
  bool isShowLoading = true;
  bool isShowVersion = true;
  double logoWidth = 0;
  double logoHeight = 0;

  //Private properties---------------------------------------------
  final _isLoading = true.obs;
  String? _title;
  String? _backgroundImage;
  final String _logoImage = "assets/app_logo.png";
  final _themeCtrl = Get.find<ThemeController>();
  //Getters---------------------------------------------
  get isReady => !_isLoading.value;
  String? get title => _title;
  String? get backgroungImage => _backgroundImage;
  String? get logoImage => _logoImage;
  ThemeData get activeTheme => _themeCtrl.activeTheme;

  SplashController();
  ////Releated controllers
  final _appCtrl = Get.find<AppController>();
  // final _userCtrl = Get.find<UserController>();
  @override
  void onInit() {
    super.onInit();

    // Get version
    getVersion();
    logoWidth = Get.width / 3;
    logoHeight = logoWidth;
    //Get for App controller

    //must run first controller setup
    _appCtrl.setup().then((nullvalue) {
      print(_appCtrl.runtime);
      _appCtrl.updateTheme();
      // checkToken();
      toDashboard();
    });
  }

  // Future<void> checkToken() async {
  //   var status = await _userCtrl.validateSaveUser();

  //   //Login already , check necessarity
  //   if (status) {
  //     switchToUserHome();
  //   } else {
  //     _appCtrl.isInterLoginShow ? toInternalSignIn() : toMainSignIn();
  //   }
  // }

  // void switchToUserHome() {
  //   switch (_userCtrl.currentUser?.userType) {
  //     case UserType.admin:
  //       toAdminDashboard();
  //     case UserType.driver:
  //       toDriverHome();
  //     default:
  //       toHome();
  //   }
  // }

  toDashboard() {
    Get.offAllNamed(Routes.HOMEDASHBOARD);
  }

  // toDriverHome() {
  //   Get.offAllNamed(Routes.NAVIGATION);
  // }

  // toHome() {
  //   //Get.offAllNamed(Routes.YOURSCREEN);
  //   Get.offAllNamed(Routes.NAVIGATION);
  // }

  // toSetup() {
  //   //Get.offAllNamed(Routes.YOURSCREEN);
  //   Get.offAllNamed(Routes.SETUP);
  // }

  // //to onboarding

  // toMainSignIn() {
  //   Get.offAllNamed(Routes.MAINSIGNIN);
  // }

  // toInternalSignIn() {
  //   Get.offAllNamed(Routes.INTERNALSIGNIN);
  // }

  getVersion() async {
    // PackageInfo packageInfo = await PackageInfo.fromPlatform();
    // String versionNo = packageInfo.version;
    // // String buildNo = packageInfo.buildNumber.obs;
    version = "1.0.0";
  }
}
