import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomOrderContiner extends StatelessWidget {
  final String location;
  final String your_problem;
  final String img;
  final String appointment_time;

  final String estimated_time;

  const CustomOrderContiner(
      {super.key,
      required this.location,
      required this.your_problem,
      required this.img,
      required this.appointment_time,
      required this.estimated_time});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      height: 0.9.sw,
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.mainColor, width: 4.h)),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 10.h, top: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Order Detials",
              textType: TextStyleType.body,
              textColor: AppColors.mainColor,
              fontSize: 20.h,
            ),
            (0.05.sh).ph,
            Row(
              children: [
                CustomText(
                  text: "Location :",
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                ),
                (0.05.sw).pw,
                CustomText(
                  text: location,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                ),
              ],
            ),
            (0.07.sh).ph,
            Row(
              children: [
                CustomText(
                  text: "Your Problem :",
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                ),
                (0.05.sw).pw,
                CustomText(
                  text: your_problem,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                ),
                (0.04.sw).pw,
                SvgPicture.asset("assets/images/${img}.svg")
              ],
            ),
            (0.07.sh).ph,
            Row(
              children: [
                CustomText(
                  text: "Appointment Time : ",
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold,
                ),
                (0.05.sw).pw,
                CustomText(
                  text: appointment_time,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
            (0.07.sh).ph,
            Row(
              children: [
                CustomText(
                  text: "Estimated Time : ",
                  textType: TextStyleType.body,
                  textColor: AppColors.grayColor,
                  fontSize: 18.h,
                ),
                (0.05.sw).pw,
                CustomText(
                  text: estimated_time,
                  textType: TextStyleType.body,
                  fontSize: 18.h,
                  fontWeight: FontWeight.bold,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
