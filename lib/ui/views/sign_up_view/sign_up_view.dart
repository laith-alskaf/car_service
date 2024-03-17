import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  SignUpViewController controller = Get.put(SignUpViewController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          children: [
            (0.1.sh).ph,
            SvgPicture.asset('assets/images/ic_login.svg'),
            (20.h).ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(4, (index) {
                return Obx(() {
                  return Container(
                    margin: EdgeInsetsDirectional.only(end: 20.w),
                    height: 15.h,
                    width: 15.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color: controller.currentIndex.value == index
                            ? AppColors.mainColor
                            : AppColors.backgroundColor),
                  );
                });
              }),
            ),
            (100.h).ph,
            const CustomTextFormField(
              hintText: 'User Name',
            ),
            (25.h).ph,
            const CustomTextFormField(
              hintText: 'Email',
            ),
            (25.h).ph,
            const CustomTextFormField(
              hintText: 'Password',
            ),
            (25.h).ph,
            CustomButton(
              width: 1.sw,
              height: 50.h,
              buttonTypeEnum: ButtonTypeEnum.normal,
              onPressed: () {},
              text: 'Sign Up',
            ),
            const Spacer(),
            const CustomText(
                text: 'Already have account', textType: TextStyleType.small),
            (10.h).ph,
            InkWell(
              onTap: () {},
              child: CustomText(
                text: 'Log In',
                textType: TextStyleType.bodyBig,
                textColor: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            (35.h).ph,
          ],
        ),
      ),
    );
  }
}
