import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:install_apk/bindings/app_binding.dart';
import 'package:install_apk/controllers/theme_controller.dart';
import 'package:install_apk/routes/app_pages.dart';
import 'package:install_apk/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var themeController = Get.put(ThemeController());

    return Obx(
      () => GetMaterialApp(
        themeMode:
            themeController.isDarkMode ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        binds: AppBinding().dependencies(),

        initialRoute: Routes.SPLASH,
        theme: themeController.activeTheme,
        defaultTransition: Transition.fade,
        getPages: AppPages.pages,
        darkTheme: themeController.darkTheme,
        //   home: SetupProfilePage(),

        locale: const Locale('pt', 'BR'),
        // translationsKeys: AppTranslation.translations,
      ),
    );
  }
}
