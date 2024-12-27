import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppScaffold extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final bool? resizeToAvoidBottomInset;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final BottomNavigationBar? bottomNavigationBar;
  final Color? statusBarColor;
  final Brightness? statusBarIconBrightness;

  const AppScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.bottomNavigationBar,
    this.statusBarColor,
    this.statusBarIconBrightness, this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? Colors.transparent,
        statusBarIconBrightness: statusBarIconBrightness ?? Brightness.light,
      ),
    );
    return Scaffold(
      appBar: appBar,
      body: body,
      floatingActionButton
      :floatingActionButton,
      backgroundColor: backgroundColor ?? Colors.white,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBody: extendBody,
      extendBodyBehindAppBar: extendBodyBehindAppBar,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
