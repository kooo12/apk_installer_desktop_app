import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class AppStateRepository {
  //Constant
  //
  // final _apiService = APIService();
  static const String PropertyKey = 'property';
  static const String RuntimeKey = 'runtime';
  static const String LoggedInKey = 'loggedIn';
  static const String AccessTokenKey = 'access_token';
  static const String RefreshTokenKey = 'refresh_token';

  static const String MasterDataKey = 'masterData';

  Map<String, dynamic> _properties = {};
  // User? _currentUser;
  SharedPreferences? _pref;

  AppStateRepository() {
    // _initialize();
  }

  get properties => _properties;

  // Future<void> _initialize() async {
  //   _pref = await SharedPreferences.getInstance();
  //   await fetchMasterData();
  //   // await loadMasterData();
  // }

  //Getters
  Future<int> get runtime async {
    _pref = _pref ?? await SharedPreferences.getInstance();
    return _pref?.getInt(RuntimeKey) ?? 0;
  }

  //Setters
  set runtime(value) {
    _pref = (_pref ??
        SharedPreferences.getInstance().then((pref) {
          _pref?.setInt(RuntimeKey, value);
          return null;
        })) as SharedPreferences?;
    _pref?.setInt(RuntimeKey, value);
  }

  Future<void> updateProperty(String key, dynamic value) async {
    _pref = _pref ?? await SharedPreferences.getInstance();

    _properties[key] = value;
    String propertyStr = jsonEncode(_properties);
    await _pref?.setString(PropertyKey, propertyStr);
  }

  // Future<String?> getAccessToken() async {
  //   final prefs = _pref;
  //   return prefs?.getString(AccessTokenKey);
  // }

  // Future<void> setAccessToken(String token) async {
  //   final prefs = await _pref;
  //   await prefs?.setString(AccessTokenKey, token);
  // }

  // Future<String?> getRefreshToken() async {
  //   final prefs = await _pref;
  //   return prefs?.getString(RefreshTokenKey);
  // }

  // Future<void> setRefreshToken(String token) async {
  //   final prefs = await _pref;
  //   await prefs?.setString(RefreshTokenKey, token);
  // }

  //Getting existing value from memory, fetchProperty must be run first
  dynamic getProperty(String key) => _properties[key];

  Future<dynamic> fetchProperty({String? key}) async {
    //Fetch app preference values here for multiple value
    try {
      _pref = _pref ?? await SharedPreferences.getInstance();

      //Add other values if required as per project requirement
      var propertyStr = _pref?.getString(PropertyKey) ?? "{}";
      _properties = jsonDecode(propertyStr);

      // var currentUserStr = _pref?.getString(USERKEY) ?? '';
      // if (currentUserStr.isNotEmpty) {
      //   var user = User.fromJson(jsonDecode(currentUserStr));
      //   _currentUser = user;
      // }
      return key != null ? _properties[key] : null;
    } catch (error) {
      return _properties;
    }
  }

  // Future<void> saveMasterData (dynamic data)async{
  //   String masterDataStr = jsonEncode(data);
  //   await _pref?.setString(MasterDataKey, masterDataStr);
  // }

  // Future<void> loadMasterData () async{
  //   String? masterDataStr = _pref?.getString(MasterDataKey);
  //   print('$masterDataStr data');
  //   if(masterDataStr != null){
  //     var data = jsonDecode(masterDataStr);
  //     var allCategories = Category.decode(data);
  //     _properties['masterData'] = allCategories;
  //     // print(allCategories.first.options.first.label);
  //   }
  //   else{
  //     await fetchMasterData();
  //   }
  // }

  // Future<Result> loadMasterData() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String? masterDataString = prefs.getString('masterData');

  //   if (masterDataString != null) {
  //     var data = jsonDecode(masterDataString);
  //     var allCategories = Category.decode(data);
  //     print(allCategories);
  //     return Result.success(allCategories);
  //   } else {
  //     return fetchMasterData();
  //   }
  // }
}
