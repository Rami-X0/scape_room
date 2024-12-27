import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/widgets/app_cached_network_image.dart';
import 'package:scape_room/core/widgets/app_loading.dart';
import 'package:scape_room/features/home/cubit/home_cubit.dart';
import 'package:scape_room/features/home/cubit/home_state.dart';

class ImageAndDetailsRoom extends StatelessWidget {
  final String image;
  final String id;
  final String time;
  final String openTime;
  final String closeTime;
  final int capacity;


  const ImageAndDetailsRoom({
    super.key,
    required this.image,
    required this.id,
    required this.time,
    required this.openTime,
    required this.closeTime,
    required this.capacity,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      child: SingleChildScrollView(
        child: Column(
          spacing: 5.h,
          children: [
            Hero(
              tag: id,
              child: AppCachedNetworkImage(imageUrl: image),
            ),
            _defaultDivider(),
            _defaultText(
                title: 'Capacity',
                subTitle: '$capacity Person',
                icon: Icons.reduce_capacity),
            _defaultDivider(),
            _defaultText(title: 'Time', subTitle: time, icon: Icons.timer),
            _defaultDivider(),
            _defaultText(
                title: 'OpenTime', subTitle: openTime, icon: Icons.open_in_new),
            _defaultDivider(),
            _defaultText(
                title: 'CloseTime',
                subTitle: closeTime,
                icon: Icons.close_fullscreen_rounded),
            _defaultDivider(),
            BlocBuilder<HomeCubit, HomeInitialState>(
              builder: (context, state) {
                if (state is GetAllBusinessSuccessState) {
                  final reviews = state.data
                      .expand(
                          (business) => business.reviews) // Collect all reviews
                      .toList();
                  return ExpansionTile(
                    title: Text(
                      'Comments',
                      textAlign: TextAlign.start,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: AppColors.secondColor,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    children: List.generate(
                      reviews.length,
                      (index) {
                        return ListTile(
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              reviews[index].rating,
                              (index) {
                                return Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                );
                              },
                            ),
                          ),
                          title: Row(
                            spacing: 5.w,
                            children: [
                              Icon(
                                Icons.person,
                                size: 18.h,
                                color: AppColors.defaultColor,
                              ),
                              Text(
                                reviews[index].username,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: AppColors.defaultColor,
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Row(
                            spacing: 5.w,
                            children: [
                              Icon(
                                Icons.comment,
                                size: 18.h,
                              ),
                              Expanded(
                                child: Text(
                                  reviews[index].comment,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    color: AppColors.secondColor,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  );
                }
                else if (state is GetAllBusinessLoadingState) {
                  return AppLoading();
                }
                return Text('ss');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _defaultText({
    required String title,
    required String subTitle,
    required IconData icon,
  }) {
    return Row(
      spacing: 10.w,
      children: [
        Text(
          '$title: ',
          style: TextStyle(
            color: AppColors.defaultColor,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          subTitle,
          style: TextStyle(
            color: AppColors.secondColor,
            fontSize: 17.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        Icon(
          icon,
          color: AppColors.secondColor,
        ),
      ],
    );
  }

  Widget _defaultDivider() {
    return Divider(
      indent: 10.w,
      endIndent: 10.w,
    );
  }
}
