import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:scape_room/core/di/dependency_injection.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/widgets/app_cached_network_image.dart';
import 'package:scape_room/core/widgets/app_elevated_button.dart';
import 'package:scape_room/core/widgets/app_loading.dart';
import 'package:scape_room/features/home/cubit/home_cubit.dart';
import 'package:scape_room/features/home/cubit/home_state.dart';

class AddBook extends StatefulWidget {
  final String name;
  final String roomId;

  const AddBook({
    super.key,
    required this.name,
    required this.roomId,
  });

  @override
  State<AddBook> createState() => _AddBookState();
}

List<int> numberOfPlayers = [1, 2, 3, 4, 5];

class _AddBookState extends State<AddBook> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondColor,
      child: BlocBuilder<HomeCubit, HomeInitialState>(
        builder: (context, state) {
          if (state is AddBookingSuccessState) {
            return Container(
              color: Colors.white,
              width: 200.w,
              child: AppCachedNetworkImage(
                imageUrl: state.data.qrCode.toString(),
              ),
            );
          }
          return Column(
            spacing: 10.w,
            children: [
              Text(
                widget.name,
                style: TextStyle(
                    color: AppColors.defaultColor,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700),
              ),
              Text(
                'Number Of Players',
                style: TextStyle(
                    color: AppColors.defaultColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5.w,
                  children: List.generate(
                    (5),
                    (index) {
                      return InkWell(
                        onTap: () {
                          DateTime now = DateTime.now();
                          String formattedDate =
                              DateFormat("yyyy-MM-ddTHH:mm:ss.SSS'Z'")
                                  .format(now);

                          context.read<HomeCubit>().numberOfPlayers =
                              numberOfPlayers[index];
                          context.read<HomeCubit>().date = formattedDate;
                          context.read<HomeCubit>().bookingName = widget.name;
                          context.read<HomeCubit>().roomId = widget.roomId;
                          print(context.read<HomeCubit>().bookingName);
                          print(context.read<HomeCubit>().roomId);
                          print(context.read<HomeCubit>().date);
                          print(context.read<HomeCubit>().numberOfPlayers);
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.defaultColor,
                          child: Text(
                            numberOfPlayers[index].toString(),
                            style: TextStyle(
                                color: AppColors.secondColor, fontSize: 15.sp),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              BlocBuilder<HomeCubit, HomeInitialState>(
                builder: (context, state) {
                  if (state is AddBookingLoadingState) {
                    return SizedBox(height: 50.h, child: AppLoading());
                  } else {
                    return AppElevatedButton(
                      borderRadius: 50,
                      onPressed: () {
                        print(context.read<HomeCubit>().bookingName);
                        print(context.read<HomeCubit>().roomId);
                        print(context.read<HomeCubit>().date);
                        print(context.read<HomeCubit>().numberOfPlayers);
                        context.read<HomeCubit>().addBooking();
                      },
                      text: 'Done',
                      backgroundColor: AppColors.defaultColor,
                    );
                  }
                },
              )
            ],
          );
        },
      ),
    );
  }
}
