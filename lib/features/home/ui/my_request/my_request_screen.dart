import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/widgets/app_loading.dart';
import 'package:scape_room/core/widgets/app_scaffold.dart';
import 'package:scape_room/features/home/cubit/home_cubit.dart';
import 'package:scape_room/features/home/cubit/home_state.dart';

class MyRequestScreen extends StatefulWidget {
  const MyRequestScreen({super.key});

  @override
  State<MyRequestScreen> createState() => _MyRequestScreenState();
}

class _MyRequestScreenState extends State<MyRequestScreen> {
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondColor,
        elevation: 10,
        shadowColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Rooms Request',
          style: TextStyle(
              color: AppColors.defaultColor,
              fontSize: 25.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(top: 12.h),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: BlocBuilder<HomeCubit, HomeInitialState>(
            buildWhen: (previous, current) =>
                current is GetAllBookingSuccessState ||
                current is GetAllBookingLoadingState,
            builder: (context, state) {
              if (state is GetAllBookingLoadingState) {
                return AppLoading();
              } else if (state is GetAllBookingSuccessState) {
                return
                  state.data.isNotEmpty?
                  ListView.builder(
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    // Parse and format the date
                    final rawDate = state.data[index].date;
                    final formattedDate = DateFormat('MMMM dd, yyyy, h:mm a')
                        .format(DateTime.parse(rawDate));

                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      margin: EdgeInsets.symmetric(vertical: 5.h),
                      width: 200.w,
                      height: 80.h,
                      decoration: BoxDecoration(
                          color: AppColors.defaultColor,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Room Name: ${state.data[index].bookingName}',
                            style: TextStyle(
                                color: AppColors.secondColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700),
                          ),
                          Divider(),
                          Text(
                            'Date: $formattedDate',
                            style: TextStyle(
                                color: AppColors.secondColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    );
                  },
                ):Text("No Data");
              } else {
                return Center(
                  child: Text('No Data'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
