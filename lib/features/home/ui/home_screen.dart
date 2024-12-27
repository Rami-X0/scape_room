import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/routing/routes.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/widgets/app_scaffold.dart';
import 'package:scape_room/features/home/cubit/home_cubit.dart';
import 'package:scape_room/features/home/ui/widgets/all_rooms_grid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        elevation: 10,
        shadowColor: Colors.black,
        title: Text(
          'Rooms',
          style: TextStyle(
              color: AppColors.defaultColor,
              fontSize: 45.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(top: 12.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: AllRoomsGrid(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text("My booking",style: TextStyle(
          color: AppColors.secondColor,
          fontSize: 15.sp,
          fontWeight: FontWeight.w700

        ),),
        backgroundColor: AppColors.defaultColor,
        onPressed: () {
          context.push(Routes.myRequest);
        },
      ),
    );
  }
}
