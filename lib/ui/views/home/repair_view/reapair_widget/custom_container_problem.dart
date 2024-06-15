import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomContainerProblem extends StatelessWidget {
  const CustomContainerProblem(
      {super.key,
      required this.nameProblem,
      this.isClick,
      this.onTap,
      this.width,
      this.height});

  final String nameProblem;
  final double? width;
  final double? height;
  final bool? isClick;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width ?? 190.w,
        height: height ?? 180.w,
        margin: EdgeInsetsDirectional.only(bottom: 20.w),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: isClick == true ? AppColors.mainColor : AppColors.whiteColor,
            borderRadius: BorderRadius.all(Radius.circular(25.r)),
            boxShadow: isClick == true
                ? null
                : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 3),
                    ),
                  ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/$nameProblem.svg',
              width: 50.w,
              height: 50.w,
              color: isClick == true ? AppColors.whiteColor : null,
            ),
            (10.w).ph,
            CustomText(
              text: nameProblem,
              isTextAlign: TextAlign.center,
              textType: TextStyleType.bodyBig,
              textColor:
                  isClick == true ? AppColors.whiteColor : AppColors.blackColor,
            )
          ],
        ),
      ),
    );
  }
}
