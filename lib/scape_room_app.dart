import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scape_room/core/routing/routes.dart';
import 'core/routing/app_router.dart' as routes;

class ScapeRoomApp extends StatelessWidget {
  const ScapeRoomApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        onGenerateRoute: routes.generateRoutes,
      ),
    );
  }
}
