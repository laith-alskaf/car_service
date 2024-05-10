import 'package:animate_do/animate_do.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/general_util.dart';
import '../../../shared/custom_widget/custom_button.dart';
import '../../../shared/custom_widget/custom_text.dart';
import '../../../shared/custom_widget/custom_text_field.dart';

class ResetPassword_view extends StatefulWidget {
  const ResetPassword_view({Key? key}) : super(key: key);

  @override
  State<ResetPassword_view> createState() => _ResetPassword_viewState();
}

class _ResetPassword_viewState extends State<ResetPassword_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            (0.1.sh).ph,
            FadeInLeft(
              delay: const Duration(milliseconds: 700),
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: CustomText(
                  text: "Reset Your Password",
                  textType: TextStyleType.title,
                  textColor: AppColors.mainColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            (80.h).ph,
            FadeInLeft(
              delay: const Duration(milliseconds: 1000),
              duration: const Duration(milliseconds: 300),
              child: CustomText(
                text: "Password",
                textType: TextStyleType.bodyBig,
                textColor: AppColors.blackColor,
              ),
            ),
            (5.h).ph,
            FadeInLeft(
              delay: const Duration(milliseconds: 1000),
              duration: const Duration(milliseconds: 300),
              child: CustomTextFormField(hintText: "Password"),
            ),
            (20.h).ph,
            FadeInLeft(
              delay: const Duration(milliseconds: 1300),
              duration: const Duration(milliseconds: 300),
              child: CustomText(
                text: "Confirm Password",
                textType: TextStyleType.bodyBig,
                textColor: AppColors.blackColor,
              ),
            ),
            (5.h).ph,
            FadeInLeft(
              delay: const Duration(milliseconds: 1300),
              duration: const Duration(milliseconds: 300),
              child: CustomTextFormField(hintText: "Confirm Password"),
            ),
            (40.h).ph,
            ZoomIn(
              delay: const Duration(milliseconds: 1600),
              duration: const Duration(milliseconds: 300),
              child: CustomButton(
                  width: 1.sw,
                  height: 50.h,
                  onPressed: () {
                  },
                  text: "Reset Password",
                  buttonTypeEnum: ButtonTypeEnum.normal),
            ),
            (40.h).ph,
            FadeInLeft(
              delay: const Duration(milliseconds: 1900),
              duration: const Duration(milliseconds: 300),
              child: Center(
                child: CustomText(
                  text: "You will be redirected to login page",
                  textType: TextStyleType.body,
                  textColor: AppColors.blackColor.withOpacity(0.6),
                ),
              ),
            ),










          ],
        ),
      ),
    );
  }
}
