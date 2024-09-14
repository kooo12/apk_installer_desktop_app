import 'package:get/get.dart';
import 'package:install_apk/controllers/app_controller.dart';
import 'package:install_apk/controllers/theme_controller.dart';
import 'package:install_apk/screen/splash/splash_controller.dart';

class SplashBinding implements Binding {
  @override
  List<Bind<dynamic>> dependencies() {
    Get.put(ThemeController());
    Get.put(AppController());
    // Get.put(UserController());
    Get.put(SplashController());
    // Get.lazyPut(() {
    //   HomeController();
    // });
    // Get.lazyPut(() {
    //   AdminHomeController();
    // });
    // Get.put(AdminHomeController());

    // Get.put(ProfileController());
    // Get.put(ChatController());
    // Get.put(SocketController());
    return [];
  }
}
