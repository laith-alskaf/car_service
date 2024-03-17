import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
            (100.h).ph,
            const CustomTextFormField(
              hintText: 'Email',
            ),
            (25.h).ph,
            const CustomTextFormField(
              hintText: 'Password',
            ),
            (10.h).ph,
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () {},
                child: CustomText(
                  text: 'Forget Password',
                  textType: TextStyleType.small,
                  textColor: AppColors.mainColor,
                ),
              ),
            ),
            (25.h).ph,
            CustomButton(
              width: 1.sw,
              height: 50.h,
              buttonTypeEnum: ButtonTypeEnum.normal,
              onPressed: () {},
              text: 'Log in',
            ),
            const Spacer(),
            const CustomText(
                text: 'you don\'t have an account yet',
                textType: TextStyleType.small),
            (10.h).ph,
            InkWell(
              onTap: () {
                Get.to(SignUpView());
              },
              child: CustomText(
                text: 'Create One',
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
