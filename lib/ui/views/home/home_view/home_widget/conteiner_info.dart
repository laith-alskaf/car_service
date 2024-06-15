import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainerInfo extends StatelessWidget {
  const CustomContainerInfo(
      {super.key,
      this.image,
      required this.title,
      this.width,
      this.height, this.onpresed});

  final String? image;
  final Function? onpresed;
  final String title;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 10.h, left: 20.w, right: 20.w),
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 15.w),
      width: width ?? 0.8.sw,
      height: height ?? 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color:  AppColors.mainColor.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3),
          ),
        ],

      ),
      child: Row(
        children: [
          CustomText(text:title , textType: TextStyleType.body,textColor: AppColors.blackColor,),
          (10.h).pw,
          SvgPicture.asset("assets/images/$image.svg")
        ],
      )
    );
  }
}
