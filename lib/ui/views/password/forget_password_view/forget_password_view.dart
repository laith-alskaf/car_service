import 'package:animate_do/animate_do.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/password/reset_password_view/reset_password_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/utils/general_util.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          children: [
            (0.1.sh).ph,
            FadeInLeft(
              delay: const Duration(milliseconds: 700),
              duration: const Duration(milliseconds: 300),
              child: CustomText(
                text: "Forget Your Password",
                textType: TextStyleType.title,
                textColor: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            (30.h).ph,
            FadeInLeft(
              delay: const Duration(milliseconds: 1000),
              duration: const Duration(milliseconds: 300),
              child: CustomText(
                text: "Don’t worry it happens please enter your email address",
                textType: TextStyleType.subtitle,
                textColor: AppColors.blackColor.withOpacity(0.6),
              ),
            ),
            (80.h).ph,
            FadeInLeft(
              delay: const Duration(milliseconds: 1300),
              duration: const Duration(milliseconds: 300),
              child: const CustomTextFormField(hintText: "Email"),
            ),
            (40.h).ph,
            ZoomIn(
              delay: const Duration(milliseconds: 1600),
              duration: const Duration(milliseconds: 300),
              child: CustomButton(
                  width: 1.sw,
                  height: 50.h,
                  onPressed: () {
                    Get.to(() => const ResetPasswordView());
                  },
                  text: "Reset Password",
                  buttonTypeEnum: ButtonTypeEnum.normal),
            ),
          ],
        ),
      ),
    );
  }
}
