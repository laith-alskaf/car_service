import 'package:animate_do/animate_do.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_otp_field.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/forget_password_view/forget_password_controller.dart';
import 'package:car_service/ui/views/login_view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class VerifyForgetPassView extends StatelessWidget {
  VerifyForgetPassView({
    super.key, required this.controller,
  });

final  ForgePasswordController controller;
  final GlobalKey<FormState> _formKeyVerifyForget = GlobalKey(
    debugLabel: 'verifyForgetKey',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Form(
              key: _formKeyVerifyForget,
              child: Column(
                children: [
                  (0.05.sh).ph,
                  SvgPicture.asset('assets/images/ic_right.svg'),
                  (70.h).ph,
                  ZoomIn(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 300),
                    child: const CustomText(
                        text: 'Please Enter The 6 Digits Code sent to you',
                        textType: TextStyleType.bodyBig),
                  ),
                  (25.h).ph,
                  CustomOtpField(
                    controller: controller.verifyCodeController,
                  ),
                  (25.h).ph,
                  GestureDetector(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomText(
                          text: 'Resend',
                          isTextAlign: TextAlign.center,
                          textType: TextStyleType.bodyBig,
                          textColor: AppColors.mainColor,
                        ),
                        (10.w).pw,
                        SvgPicture.asset('assets/images/referach.svg'),
                      ],
                    ),
                  ),
                  (25.h).ph,
                  ZoomIn(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 300),
                    child: CustomButton(
                      width: 1.sw,
                      height: 50.h,
                      buttonTypeEnum: ButtonTypeEnum.normal,
                      onPressed: () {
                        if (_formKeyVerifyForget.currentState!.validate()) {
                          Get.offAll(() => LoginView());
                        }
                      },
                      text: 'Verify',
                    ),
                  ),
                  (25.h).ph,
                  ZoomIn(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 300),
                    child: CustomText(
                      text: 'You will be redirected to login page',
                      textType: TextStyleType.bodyBig,
                      textColor: AppColors.grayColor,
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
