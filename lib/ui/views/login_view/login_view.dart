import 'package:animate_do/animate_do.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/core/utils/string_urtil.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/login_view/login_view_controller.dart';
import 'package:car_service/ui/views/main_view/main_view.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../password/forgetpassword_view/forgetpassword_view.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});

  LoginViewController controller = Get.put(LoginViewController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Form(
              key: controller.formKey1,
              child: Column(
                children: [
                  (0.1.sh).ph,
                  ZoomIn(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 300),
                    child: SvgPicture.asset(
                      'assets/images/ic_verfiy.svg',
                      width: 120.w,
                    ),
                  ),
                  CustomText(
                    text: 'Car Medic',
                    textType: TextStyleType.title,
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.textColor2,
                  ),
                  (100.h).ph,
                  const Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: CustomText(
                      text: 'Welocme !',
                      textType: TextStyleType.title,
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.blackColor,
                    ),
                  ),
                  (15.h).ph,
                  Align(
                    alignment: AlignmentDirectional.centerStart,
                    child: CustomText(
                      text: 'Login to your account',
                      textType: TextStyleType.bodyBig,
                      fontWeight: FontWeight.normal,
                      textColor: AppColors.blackColor,
                      startPadding: 15.w,
                    ),
                  ),
                  (10.h).ph,
                  FadeInLeft(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 300),
                    child: CustomTextFormField(
                      hintText: 'Email',
                      controller: controller.emailController,
                      validator: (value) {
                        if (value!.isEmpty && StringUtil.isEmail(value)) {
                          return 'please check your Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  (25.h).ph,
                  FadeInLeft(
                    delay: const Duration(milliseconds: 1000),
                    duration: const Duration(milliseconds: 300),
                    child: CustomTextFormField(
                      hintText: 'Password',
                      controller: controller.passwordController,
                      validator: (value) {
                        if (value!.isEmpty || StringUtil.isPassword(value)) {
                          return 'please check your Email';
                        }
                        return null;
                      },
                    ),
                  ),
                  (10.h).ph,
                  FadeInLeft(
                    delay: const Duration(milliseconds: 1300),
                    duration: const Duration(milliseconds: 300),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const ForgetPasswordView());
                        },
                        child: CustomText(
                          text: 'Forget Password',
                          textType: TextStyleType.small,
                          textColor: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ),
                  (25.h).ph,
                  ZoomIn(
                    delay: const Duration(milliseconds: 1600),
                    duration: const Duration(milliseconds: 300),
                    child: CustomButton(
                      width: 1.sw,
                      height: 50.h,
                      buttonTypeEnum: ButtonTypeEnum.normal,
                      onPressed: () {
                        Get.off(() => MainView());
                      },
                      text: 'Log in',
                    ),
                  ),
                  const Spacer(),
                  const CustomText(
                      text: 'you don\'t have an account yet',
                      textType: TextStyleType.small),
                  (10.h).ph,
                  InkWell(
                    onTap: () {
                      Get.to(
                        () => SignUpMain(),
                        transition: Transition.zoom,
                        duration: const Duration(milliseconds: 350),
                      );
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
            )),
      ),
    );
  }
}
