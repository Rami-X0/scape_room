import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scape_room/core/caching/app_shared_pref.dart';
import 'package:scape_room/core/caching/app_shared_pref_key.dart';
import 'package:scape_room/core/helper/bloc_observer.dart';
import 'package:scape_room/scape_room_app.dart';
import 'package:scape_room/core/di/dependency_injection.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  await AppSharedPref.initSharedPref();
  await ScreenUtil.ensureScreenSize();
  Bloc.observer = MyBlocObserver();
  token = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.token);
  userName = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.userName);
  userId = await AppSharedPref.sharedPrefGet(key: AppSharedPrefKey.userId);
  runApp(const ScapeRoomApp());
  print(userId);
}
