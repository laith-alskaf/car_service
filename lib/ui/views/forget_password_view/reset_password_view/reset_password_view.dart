import 'package:animate_do/animate_do.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/forget_password_view/forget_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ResetPasswordView extends StatelessWidget {
  ResetPasswordView({
    super.key,
  });

  final ForgePasswordController controller = Get.find();

  final GlobalKey<FormState> _formKeyReset =
      GlobalKey(debugLabel: 'resetScreenKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Form(
          key: _formKeyReset,
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
                child: const CustomText(
                  text: "Password",
                  textType: TextStyleType.bodyBig,
                  textColor: AppColors.blackColor,
                ),
              ),
              (5.h).ph,
              FadeInLeft(
                delay: const Duration(milliseconds: 1000),
                duration: const Duration(milliseconds: 300),
                child: CustomTextFormField(
                  hintText: "Password",
                  controller: controller.passwordController,
                ),
              ),
              (20.h).ph,
              FadeInLeft(
                delay: const Duration(milliseconds: 1300),
                duration: const Duration(milliseconds: 300),
                child: const CustomText(
                  text: "Confirm Password",
                  textType: TextStyleType.bodyBig,
                  textColor: AppColors.blackColor,
                ),
              ),
              (5.h).ph,
              FadeInLeft(
                delay: const Duration(milliseconds: 1300),
                duration: const Duration(milliseconds: 300),
                child: CustomTextFormField(
                  hintText: "Confirm Password",
                  controller: controller.confirmPasswordController,
                ),
              ),
              (40.h).ph,
              ZoomIn(
                delay: const Duration(milliseconds: 1600),
                duration: const Duration(milliseconds: 300),
                child: CustomButton(
                    width: 1.sw,
                    height: 50.h,
                    onPressed: () {
                      if (_formKeyReset.currentState!.validate()) {}
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
      ),
    );
  }
}
