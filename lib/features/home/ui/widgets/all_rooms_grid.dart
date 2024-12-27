import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:scape_room/core/di/dependency_injection.dart';
import 'package:scape_room/core/helper/extension.dart';
import 'package:scape_room/core/routing/animation_route/page_route_alignment.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/widgets/app_cached_network_image.dart';
import 'package:scape_room/core/widgets/app_loading.dart';
import 'package:scape_room/features/home/cubit/home_cubit.dart';
import 'package:scape_room/features/home/cubit/home_state.dart';
import 'package:scape_room/features/home/data/models/get_all_businesses_response.dart';
import 'package:scape_room/features/home/ui/details/ui/details_screen.dart';

class AllRoomsGrid extends StatelessWidget {
  const AllRoomsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeInitialState>(
      buildWhen: (previous, current) =>
          current is GetAllBusinessSuccessState ||
          current is GetAllBusinessFailureState ||
          current is GetAllBusinessLoadingState,
      builder: (context, state) {
        if (state is GetAllBusinessSuccessState) {
          debugPrint('Data${state.data}');
          return state.data.isNotEmpty
              ? GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8.h,
                    crossAxisSpacing: 10.w,
                    mainAxisExtent: 220.h,
                    mainAxisSpacing: 5.h,
                  ),
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        actionThenTapRoom(context, state.data, index);
                      },
                      child: Container(
                        height: 220.h,
                        decoration: BoxDecoration(
                          color: AppColors.secondColor,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.r),
                          ),
                        ),
                        child: Column(
                          spacing: 5.h,
                          children: [
                            AppCachedNetworkImage(
                              bottomLeftBorder: 0,
                              bottomRightBorder: 0,
                              heightImage: 130,
                              imageUrl: state.data[index].mainImage,
                              fitImage: BoxFit.cover,
                            ),
                            Divider(),
                            Text(
                              textAlign: TextAlign.center,
                              state.data[index].name,
                              style: TextStyle(
                                color: AppColors.defaultColor,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Expanded(
                              child: Row(
                                spacing: 5.w,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    textAlign: TextAlign.center,
                                    'Capacity: ${state.data[index].rooms[index].capacity}',
                                    style: TextStyle(
                                      color: AppColors.defaultColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Icon(
                                    Icons.person,
                                    color: AppColors.defaultColor,
                                    size: 15.w,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text(
                  'No Rooms',
                  style: TextStyle(
                    color: AppColors.defaultColor,
                    fontSize: 50.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ));
        } else if (state is GetAllBusinessFailureState) {
          return Text(state.failure.getAllMessages());
        } else {
          return AppLoading();
        }
      },
    );
  }

  actionThenTapRoom(
      BuildContext context, List<GetAllBusinessesResponse> data, int index) {
    Navigator.push(
      context,
      PageRouteFade(
        child: BlocProvider.value(
          value: (context).read<HomeCubit>(),
          child: DetailsScreen(
            rate: data[index].reviews[index].rating,
            roomId: data[index].rooms[index].id,
            capacity: data[index].rooms[index].capacity,
            name: data[index].name,
            id: data[index].id,
            level: data[index].rooms[index].level,
            image: data[index].mainImage,
            duration: data[index].rooms[index].duration,
            openTime: data[index].rooms[index].openTime,
            closeTime: data[index].rooms[index].closeTime,
            difficulty: data[index].rooms[index].difficulty,
            pricePerson: data[index].rooms[index].pricePerPerson,
          ),
        ),
      ),
    );
  }
}
