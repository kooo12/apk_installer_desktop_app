import 'package:get/get.dart';
import 'package:install_apk/controllers/app_controller.dart';

class AppBinding implements Binding {
  @override
  List<Bind<dynamic>> dependencies() {
    //Load all prerequested controllers/non-page controller here

    Get.put(AppController(), permanent: true);
    // Get.put(UserController(), permanent: true); //Pass respective repo
    // Get.put(SidemenuController(), permanent: true);
    // Get.put(ScreenUtil());
    // Get.put(LocationController());
    // Get.put(SplashController());

    return [];
  }
}
