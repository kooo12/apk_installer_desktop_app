import 'package:get/get.dart';
import 'package:install_apk/controllers/device_controller.dart';
import 'package:install_apk/controllers/theme_controller.dart';

class HomeBinding implements Binding {
  @override
  List<Bind<dynamic>> dependencies() {
    Get.put(ThemeController());
    Get.put(DeviceController());
    return [];
  }
}
