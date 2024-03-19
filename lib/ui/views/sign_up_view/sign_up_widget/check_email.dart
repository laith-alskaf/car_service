import 'package:animate_do/animate_do.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpCheckEmail extends StatelessWidget {
  SignUpCheckEmail({super.key});

  SignUpViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        (160.h).ph,
        ZoomIn(
          delay: const Duration(milliseconds: 400),
          duration: const Duration(milliseconds: 300),
          child: const CustomText(
              text:
                  'To confirm your email address tap the button in the email we sent to',
              isTextAlign: TextAlign.center,
              textType: TextStyleType.bodyBig),
        ),
        (15.h).ph,
        ZoomIn(
          delay: const Duration(milliseconds: 700),
          duration: const Duration(milliseconds: 300),
          child: CustomText(
            text: 'eng.hashem.alhasan@gmail.com',
            textType: TextStyleType.body,
            textColor: AppColors.mainColor,
          ),
        ),
        (25.h).ph,
        ZoomIn(
          delay: const Duration(milliseconds: 1000),
          duration: const Duration(milliseconds: 300),
          child: CustomButton(
            width: 1.sw,
            height: 50.h,
            buttonTypeEnum: ButtonTypeEnum.normal,
            onPressed: () {
              controller.currentIndex.value++;
            },
            text: 'Next',
          ),
        ),
      ],
    );
  }
}
