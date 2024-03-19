import 'package:animate_do/animate_do.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

// ignore: must_be_immutable
class SignUpVerify extends StatelessWidget {
  SignUpVerify({super.key});

  SignUpViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (50.h).ph,
        ZoomIn(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 300),
          child: const CustomText(
              text:
                  'We need to verify your email address we have sent an email to',
              textType: TextStyleType.bodyBig),
        ),
        ZoomIn(
          delay: const Duration(milliseconds: 700),
          duration: const Duration(milliseconds: 300),
          child: CustomText(
            text: 'eng.hashem.alhasan@gmail.com',
            textType: TextStyleType.bodyBig,
            textColor: AppColors.mainColor,
          ),
        ),
        ZoomIn(
          delay: const Duration(milliseconds: 1000),
          duration: const Duration(milliseconds: 300),
          child: const CustomText(
              text:
                  'Containing as 6 digit code which expire in 15 minutes please enter the code in below.',
              textType: TextStyleType.bodyBig),
        ),
        (25.h).ph,
        PinCodeTextField(
          mainAxisAlignment: MainAxisAlignment.center,
          appContext: context,
          length: 6,
          obscuringCharacter: '*',
          obscureText: true,
          animationType: AnimationType.fade,
          keyboardType: TextInputType.number,
          boxShadows: [

          ],
          pinTheme: PinTheme(
            inactiveBorderWidth: 1.5.w,
            fieldOuterPadding:
            EdgeInsets.symmetric(horizontal: 5.w),
            errorBorderColor: Colors.red,
            shape: PinCodeFieldShape.box,
            activeColor: AppColors.mainColor,
            borderWidth: 0.2,
            activeFillColor: AppColors.whiteColor,
            inactiveColor: AppColors.mainColor,
            selectedColor: AppColors.whiteColor,
            inactiveFillColor: AppColors.whiteColor,
            selectedFillColor:
            AppColors.mainColor,
            borderRadius: BorderRadius.circular(14.r),
            fieldHeight: 60.w,
            fieldWidth: 60.w,
          ),
          animationDuration:
          const Duration(milliseconds: 300),
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
        ZoomIn(
          delay: const Duration(milliseconds: 1300),
          duration: const Duration(milliseconds: 300),
          child: CustomButton(
            width: 1.sw,
            height: 50.h,
            buttonTypeEnum: ButtonTypeEnum.normal,
            onPressed: () {},
            text: 'Finish',
          ),
        ),
      ],
    );
  }
}
