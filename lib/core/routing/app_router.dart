import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scape_room/core/di/dependency_injection.dart';
import 'package:scape_room/core/routing/animation_route/page_route_alignment.dart';
import 'package:scape_room/core/routing/routes.dart';
import 'package:scape_room/features/account/cubit/account_cubit.dart';
import 'package:scape_room/features/account/ui/account_screen.dart';
import 'package:scape_room/features/home/cubit/home_cubit.dart';
import 'package:scape_room/features/home/ui/home_screen.dart';
import 'package:scape_room/features/home/ui/my_request/my_request_screen.dart';
import 'package:scape_room/features/splash/ui/splash_screen.dart';

Route generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splash:
      return PageRouteFade(child: const SplashScreen());
    case Routes.login:
      return PageRouteFade(
          child: BlocProvider(
              create: (context) => AccountCubit(getIt(), getIt()),
              child: const AccountScreen()));
    case Routes.signUp:
      return PageRouteFade(
          child: BlocProvider(
              create: (context) => AccountCubit(getIt(), getIt()),
              child: const AccountScreen()));
    case Routes.home:
      return PageRouteFade(
          child: BlocProvider(
              create: (context) => getIt<HomeCubit>()..getAllBusinesses(),
              child: const HomeScreen()));
    case Routes.myRequest:
      return PageRouteFade(
          child: BlocProvider.value(
              value: getIt<HomeCubit>()..getAllBooking(),
              child: const MyRequestScreen()));

    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No route defined for ${settings.name}'),
          ),
        ),
      );
  }
}
