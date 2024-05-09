import 'package:animate_do/animate_do.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_drop_menu.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpModel extends StatelessWidget {
  SignUpModel({super.key});

  SignUpViewController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FadeInLeft(
          delay: const Duration(milliseconds: 1300),
          duration: const Duration(milliseconds: 200),
          child: const CustomTextFormField(
            hintText: 'Car Brand And Model',
          ),
        ),
        (25.h).ph,
        FadeInLeft(
          delay: const Duration(milliseconds: 1500),
          duration: const Duration(milliseconds: 200),
          child: const CustomTextFormField(
            hintText: 'Car Number',
          ),
        ),
        (25.h).ph,
        FadeInLeft(
          delay: const Duration(milliseconds: 1700),
          duration: const Duration(milliseconds: 200),
          child: CustomDropMenu(
            items: controller.listCarType,
            onSaved: (value) {
              controller.carType = value!;
            },
          ),
        ),
        (25.h).ph,
        FadeInLeft(
          delay: const Duration(milliseconds: 1900),
          duration: const Duration(milliseconds: 200),
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
