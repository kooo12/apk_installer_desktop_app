import 'dart:async';
import 'package:get/get.dart';
import 'package:install_apk/constants.dart' as Constants;
import 'package:install_apk/controllers/theme_controller.dart';
import 'package:install_apk/data/repositories/appstate_repository.dart';

class AppController extends GetxController {
  //Static --------------------------------------------------------NONE

  //Initialised properties  --------------------------------------
  final AppStateRepository repository = AppStateRepository();
  AppController();
  final themeCtrl = Get.find<ThemeController>();
  // final locationCtrl = Get.find<LocationController>();
  //Public  -------------------------------------------------------NONE

  //Private -------------------------------------------------------
  final _isSetup = false.obs; //TODO:get from db status
  final _isLogin = false.obs; //TODO:get from db status
  final _isConfigure =
      false.obs; //TODO:get from db status for necessar configuration
  // List<Category> _categories = [];

  //Getters
  bool get isSetup => _isSetup.value;
  bool get isLogin => _isLogin.value;
  bool get isConfigure => _isConfigure.value;
  // List<Category> get categorizedOptions => _categories;
  @override
  onInit() {
    super.onInit();
    setup();
    //Controller Initialization
  }

  //Getters

  get runtime => repository.getProperty(AppStateRepository.RuntimeKey) ?? 0;
  bool get isOnboardingPassed =>
      repository.getProperty(Constants.ONBOARDINGKEY) ??
      false; //TODO: use with property name
  bool get isTnCAccepted =>
      repository.getProperty(Constants.TNCKEY) ??
      false; //TODO: use with property name
  bool get isFirstTimeOptionsPicked =>
      repository.getProperty(Constants.FIRSTTIMEOPTIONPICK) ?? true;
  bool get isFirstTimeProfileShow =>
      repository.getProperty(Constants.FIRSTTIMEPROFILESHOW) ?? true;
  //social value
  get appleUserString => repository.getProperty(Constants.APPLEUSERKEY);
  // bool get isTesting => repository.getProperty(Constants.APIBASEKEY) ?? true;
  //Setters -------------------------------------------------------

  set appleUserString(value) =>
      repository.updateProperty(Constants.APPLEUSERKEY, value);
  set isTnCAccepted(value) =>
      repository.updateProperty(Constants.TNCKEY, value);
  set runtime(value) => repository.runtime = value;
  set isOnboardingPassed(value) => repository.updateProperty(
      Constants.ONBOARDINGKEY, value); //TODO: use with property name
  set isFirstTimeOptionsPicked(value) =>
      repository.updateProperty(Constants.FIRSTTIMEOPTIONPICK, value);
  set isFirstTimeProfileShow(value) =>
      repository.updateProperty(Constants.FIRSTTIMEPROFILESHOW, value);
  //Public Methods ( Functions) -----------------------------------

  Future<void> setup() async {
    await repository.fetchProperty(); //update repo with latest value

    await increaseRuntime();
    // _categories = await fetchMasterDataFromLocal();
    // if (_categories.isEmpty) {
    //   _categories = await fetchMasterData();
    //   //saveCategories();
    // }
  }

  // saveCategories() {
  //   repository.updateProperty(AppStateRepository.MasterDataKey, _categories);
  // }

  Future<void> updateTheme() async {
    var darkMode = (repository.getProperty("darkmode") ?? false);
    if (darkMode) {
      themeCtrl.setDarkMode(true);
    }
    return;
  }

  Future<void> increaseRuntime() async {
    await repository.updateProperty(AppStateRepository.RuntimeKey, ++runtime);
    return;
  }

  // Future<void> changeMode(bool isTesting) async {
  //   await repository.updateProperty(Constants.APIBASEKEY, isTesting);
  //   return;
  // }

  // Future<List<Category>> fetchMasterDataFromLocal() async {
  //   var masterData = repository.getProperty(AppStateRepository.MasterDataKey);
  //   print('master data: $masterData');
  //   if (masterData != null) {
  //     return List<Category>.from(masterData.map((e) => Category.fromJson(e)));
  //   } else {
  //     return [];
  //   }
  // }

  // Future<List<Category>> fetchMasterData() async {
  //   final result = await repository.fetchMasterData();
  //   if (result is Result.SuccessState) {
  //     return result.value;
  //   } else {
  //     return [];
  //   }
  // }

  // Future<Result.Result> uploadMedia(String imageType, File file) async {
  //   Result.Result result = await repository.uploadImage(imageType, file);
  //   if (result is Result.SuccessState) {
  //     print('Upload successful: ${result.value}');
  //   } else {
  //     print('Upload failed: ${result}');
  //   }
  // }

  // Future<String> _refreshToken() async {
  //   final refreshToken = await repository.getRefreshToken();
  //   final response = await http.post(
  //     Uri.parse('https://your-api-endpoint.com/refresh-token'),
  //     headers: {'Content-Type': 'application/json'},
  //     body: jsonEncode({'refresh_token': refreshToken}),
  //   );

  //   if (response.statusCode == 200) {
  //     final responseData = jsonDecode(response.body);
  //     final newAccessToken = responseData['access_token'];
  //     await repository.setAccessToken(newAccessToken);
  //     return newAccessToken;
  //   } else {
  //     throw Exception('Failed to refresh token');
  //   }
  // }

  // Future<http.Response> _makeAuthenticatedRequest(RequestType requestType, String path, Map<String, dynamic> parameters, Map<String, String> headers, String body) async {
  //   var response = await _apiService.request(requestType, path, parameters, headers, body);
  //   if (response.statusCode == 401) {
  //     final newAccessToken = await _refreshToken();
  //     headers[HttpHeaders.authorizationHeader] = 'Bearer $newAccessToken';
  //     response = await _apiService.request(requestType, path, parameters, headers, body);
  //   }
  //   return response;
  // }

  //Private Methods ( used internally ) ---------------------------
}
