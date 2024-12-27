import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:scape_room/core/theming/app_colors.dart';
import 'package:scape_room/core/widgets/app_elevated_button.dart';
import 'package:scape_room/core/widgets/app_loading.dart';
import 'package:scape_room/core/widgets/app_text_form_field.dart';
import 'package:scape_room/features/home/cubit/home_cubit.dart';
import 'package:scape_room/features/home/cubit/home_state.dart';

class FormComment extends StatefulWidget {
  final String businessId, roomId;
  final int rate;

  const FormComment({
    super.key,
    required this.businessId,
    required this.roomId,
    required this.rate,
  });

  @override
  State<FormComment> createState() => _FormCommentState();
}

class _FormCommentState extends State<FormComment> {
  @override
  void initState() {
    super.initState();
    setState(() {
      context.read<HomeCubit>().businessId = widget.businessId;
      context.read<HomeCubit>().roomId = widget.roomId;
      context.read<HomeCubit>().rate = widget.rate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<HomeCubit>().formKey,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 8.w),
        child: Column(
          spacing: 25.h,
          children: [
            AppTextFormField(
              fillColor: AppColors.defaultColor.withValues(alpha: 0.5),
              hintText: 'Comment',
              suffixIcon: FaIcon(
                FontAwesomeIcons.pencil,
                size: 15.w,
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Comment is required';
                }
              },
              controller: HomeCubit.commentController,
            ),
            Row(
              spacing: 10.w,
              children: [
                Text(
                  'Rating',
                  style: TextStyle(
                    color: AppColors.defaultColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  children: List.generate(
                    rating.length,
                    (index) {
                      return InkWell(
                        excludeFromSemantics: true,
                        onTap: () {
                           context.read<HomeCubit>().addRate(rating[index]);
                        },
                        child: BlocBuilder<HomeCubit, HomeInitialState>(
                          builder: (context, state) {
                            int currentRate = 0;
                            if (state is AddReviewRateState) {
                              currentRate = state.rate;
                            }
                            return Icon(
                              currentRate < rating[index]
                                  ? Icons.star_border
                                  : Icons.star,
                              color: Colors.amber,
                            );
                          },
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
            BlocConsumer<HomeCubit, HomeInitialState>(
              builder: (context, state) {
                if (state is AddReviewLoadingState) {
                  return SizedBox(height: 100.h, child: AppLoading());
                } else if (state is AddReviewFailureState) {
                  return Column(
                    children: [
                      Text(state.failure.getAllMessages()),
                      _addReviewWidget()
                    ],
                  );
                }
                return _addReviewWidget();
              },
              listener: (context, state) {
                if (state is AddReviewSuccessState) {
                  Navigator.pop(context);
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  List<int> rating = [1, 2, 3, 4, 5];

  Widget _addReviewWidget() {
    return AppElevatedButton(
      onPressed: () {
        if (context.read<HomeCubit>().formKey.currentState!.validate()) {
          context.read<HomeCubit>().addReview();
        }
      },
      text: 'Add',
      backgroundColor: AppColors.defaultColor,
      borderRadius: 50,
    );
  }
}
