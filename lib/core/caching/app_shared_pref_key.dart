import 'package:scape_room/core/caching/app_shared_pref.dart';

class AppSharedPrefKey {
  static String token = 'token';
  static String userName = 'userName';
  static String userId = 'userId';
}

var token=AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.token);
var userName=AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.userName);
var userId=AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.userId);