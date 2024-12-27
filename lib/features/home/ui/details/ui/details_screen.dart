import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scape_room/core/di/dependency_injection.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/widgets/app_dialog.dart';
import 'package:scape_room/core/widgets/app_scaffold.dart';
import 'package:scape_room/features/home/cubit/home_cubit.dart';
import 'package:scape_room/features/home/ui/details/ui/widgets/add_book.dart';
import 'package:scape_room/features/home/ui/details/ui/widgets/form_comment.dart';
import 'package:scape_room/features/home/ui/details/ui/widgets/image_and_details_room.dart';

class DetailsScreen extends StatelessWidget {
  final String name;
  final int rate;
  final int capacity;
  final int level;
  final String id;
  final String roomId;
  final String duration;
  final String image;
  final String openTime;
  final String closeTime;
  final int difficulty;
  final int pricePerson;

  const DetailsScreen({
    super.key,
    required this.capacity,
    required this.level,
    required this.duration,
    required this.openTime,
    required this.closeTime,
    required this.difficulty,
    required this.pricePerson,
    required this.name,
    required this.id,
    required this.image,
    required this.roomId,
    required this.rate,
  });

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.white,
        elevation: 10,
        shadowColor: Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return BlocProvider(
                      create:(context)=> HomeCubit(getIt()),
                      child: AppDialog(
                        height: 250,
                        child: AddBook(
                          name: name,
                          roomId: roomId,
                        ),
                      ),
                    );
                  },
                );
              },
              child: CircleAvatar(
                backgroundColor: AppColors.defaultColor,
                child: Icon(
                  Icons.request_quote_outlined,
                  color: AppColors.secondColor,
                ),
              ),
            ),
          )
        ],
        title: Text(
          name,
          style: TextStyle(
              color: AppColors.defaultColor,
              fontSize: 25.sp,
              fontWeight: FontWeight.w700),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.defaultColor,
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return BlocProvider.value(
                  value: getIt<HomeCubit>(),
                  child: AppDialog(
                    height: 250,
                    child: FormComment(
                      businessId: id,
                      roomId: roomId,
                      rate: rate,
                    ),
                  ),
                );
              }).then((onValue) {
            if (context.mounted) {
              context.read<HomeCubit>().getAllBusinesses();
            }
          });
        },
        child: FaIcon(
          FontAwesomeIcons.solidComment,
          color: AppColors.secondColor,
          size: 25.w,
        ),
      ),
      body: SafeArea(
        minimum: EdgeInsets.only(top: 12.h),
        child: ImageAndDetailsRoom(
          image: image,
          id: id,
          time: duration,
          openTime: openTime,
          closeTime: closeTime,
          capacity: capacity,
        ),
      ),
    );
  }
}
