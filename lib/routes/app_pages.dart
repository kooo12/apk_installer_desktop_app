import 'package:get/get.dart';
import 'package:install_apk/bindings/home_binding.dart';
import 'package:install_apk/bindings/splash_binding.dart';
import 'package:install_apk/screen/home_dashboard/home_dashboard.dart';
import 'package:install_apk/screen/splash/splash_page.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.SPLASH,
        page: () => const SplashPage(),
        binding: SplashBinding()),

    //for onboarding
    GetPage(
        name: Routes.HOMEDASHBOARD,
        page: () => const HomeDashboard(),
        binding: HomeBinding(),
        transition: Transition.fadeIn),
    // GetPage(
    //     name: Routes.TANDC,
    //     page: () => const TermsAndConditionsPage(),
    //     binding: TermsAndConditionsBinding(),
    //     transition: Transition.fadeIn),
  ];
}
