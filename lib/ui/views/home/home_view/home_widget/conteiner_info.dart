import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomContainerInfo extends StatelessWidget {
  const CustomContainerInfo(
      {super.key,
      this.isIcon,
      this.image,
      required this.title,
      required this.body,
      this.width,
      this.existImage,
      this.height, this.icon});

  final bool? isIcon;
  final String? image;
  final String? icon;
  final String title;
  final String body;
  final double? width;
  final double? height;
  final bool? existImage;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(bottom: 10.h, left: 20.w, right: 20.w),
      padding:
          EdgeInsetsDirectional.symmetric(horizontal: 10.w, vertical: 15.w),
      width: width ?? 250.w,
      height: height ?? 80.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50.r)),
        // color: AppColors.secondGray
        color: AppColors.mainColor,
      ),
      child: Row(
        children: [
          if (existImage ?? true && image != null) ...[
            Container(
              height: 60.w,
              width: 60.w,
              decoration: BoxDecoration(
                  color: isIcon ?? true
                      ? AppColors.whiteColor
                      : AppColors.secondGray,
                  borderRadius: BorderRadius.all(Radius.circular(100.r)),
                  image: DecorationImage(
                      image: AssetImage('assets/images/$image'),
                      fit: BoxFit.cover)),
            ),
            (15.w).pw,
          ],
          Padding(
            padding: EdgeInsetsDirectional.only(
                start: existImage ?? true ? 0 : 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  textType: existImage ?? true
                      ? TextStyleType.body
                      : TextStyleType.title,
                  fontWeight: FontWeight.bold,
                  textColor: existImage ?? true
                      ? AppColors.whiteColor.withOpacity(0.5)
                      : AppColors.whiteColor,
                ),
                (15.h).ph,
                CustomText(
                  text: body,
                  textType: TextStyleType.body,
                  textColor: existImage ?? true
                      ? AppColors.whiteColor
                      : AppColors.whiteColor.withOpacity(0.5),
                ),
              ],
            ),
          ),
         const  Spacer(),
          if (isIcon ?? true == false) ...[
            SvgPicture.asset('assets/images/$icon.svg'),
            (20.w).pw,
          ],
        ],
      ),
    );
  }
}
