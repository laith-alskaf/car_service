import 'package:animate_do/animate_do.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class SignUpVerify extends StatelessWidget {
  SignUpVerify({super.key});

  SignUpViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (50.h).ph,
        ZoomIn(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 300),
          child: const CustomText(
              text: 'Please Enter The 4 Digits Code sent to you',
              textType: TextStyleType.bodyBig),
        ),
        (25.h).ph,
        PinCodeTextField(
          mainAxisAlignment: MainAxisAlignment.center,
          appContext: context,
          length: 6,
          obscuringCharacter: '*',
          controller: controller.verifyCodeController,
          obscureText: true,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          boxShadows: const [],
          pinTheme: PinTheme(
            inactiveBorderWidth: 1.5.w,
            fieldOuterPadding: EdgeInsets.symmetric(horizontal: 5.w),
            errorBorderColor: Colors.red,
            shape: PinCodeFieldShape.box,
            activeColor: AppColors.mainColor,
            borderWidth: 0.2,
            activeFillColor: AppColors.whiteColor,
            inactiveColor: AppColors.mainColor,
            selectedColor: AppColors.whiteColor,
            inactiveFillColor: AppColors.whiteColor,
            selectedFillColor: AppColors.mainColor,
            borderRadius: BorderRadius.circular(14.r),
            fieldHeight: 60.w,
            fieldWidth: 60.w,
          ),
          animationDuration: const Duration(milliseconds: 300),
          enableActiveFill: true,
          onCompleted: (v) {
            "Completed";
          },
          beforeTextPaste: (text) {
            "Allowing to paste $text";
            return true;
          },
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
              controller.sendCode();
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
        ),
      ],
    );
  }
}
