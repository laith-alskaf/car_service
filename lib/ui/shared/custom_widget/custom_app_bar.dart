import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key,
    required this.title,
    this.existContainer,
    this.existAppBar,
    this.positionedTop,
    this.positionedLeft,
    this.positionedRight,
    this.positionedBottom,
    this.onTapBack,
    this.iconSetting,
    this.onTapList,
    this.existBorderRadius,
    this.titleColor,
    this.backgroundColor,
    this.height,
    this.existAppBarThemeColored});

  final String title;
  final bool? existContainer;
  final bool? existAppBar;
  final bool? existAppBarThemeColored;
  final double? positionedTop;
  final double? positionedLeft;
  final double? positionedRight;
  final double? positionedBottom;
  final double? height;
  final bool? iconSetting;
  final Function()? onTapBack;
  final Function()? onTapList;
  final Color? titleColor;
  final Color? backgroundColor;
  final bool? existBorderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        AnimatedOpacity(
          duration: const Duration(milliseconds: 350),
          opacity: 1,
          child: Container(
            width: double.infinity,
            height: 70.h,
            decoration: BoxDecoration(
                color:backgroundColor?? AppColors.mainColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.r),
                    bottomRight: Radius.circular(25.r))),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20.h),
          child: Row(
            children: [
              if (existAppBar ?? false) ...[
                (30.w).pw,
                GestureDetector(
                  onTap: onTapBack ??
                          () {
                        Get.back();
                      },
                  child: SizedBox(
                    height: 20.w,
                    width: 20.w,
                    child: SvgPicture.asset('assets/images/ic_back.svg'),
                  ),
                ),
              ],
              Expanded(
                child: CustomText(
                    startPadding: iconSetting == true ? 40.w : 0,
                    endPadding:existAppBar==true? 50.w:0,
                    isTextAlign: TextAlign.center,
                    textType: TextStyleType.title,
                    fontWeight: FontWeight.bold,
                    text: title,
                    textColor: titleColor ?? AppColors.whiteColor),
              ),
                // iconSetting ?? false ? (0.w).pw : (66.w).pw,
                Visibility(
                  visible: iconSetting ?? false,
                  child: InkWell(
                      onTap: onTapList,
                      child: SizedBox(
                          width: 30.w,
                          child:
                          SvgPicture.asset('assets/images/ic_setting.svg'))),
                ),
                iconSetting ?? false ? (30.w).pw : const SizedBox()



              // (66.w).pw,
            ],
          ),
        )
      ],
    );
  }
}
