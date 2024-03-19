import 'package:animate_do/animate_do.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/login_view/login_view.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_view_controller.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_widget/check_email.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_widget/sign_up_model.dart';
import 'package:car_service/ui/views/sign_up_view/sign_up_widget/verify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignUpMain extends StatelessWidget {
  SignUpMain({super.key});

  SignUpViewController controller = Get.put(SignUpViewController());
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: AppColors.whiteColor,
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Obx(
              () => Column(
                children: [
                  (0.1.sh).ph,
                  FadeInDown(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 300),
                    child: SvgPicture.asset(
                      'assets/images/ic_${controller.imageSignUp[controller.currentIndex.value]}.svg',
                      width: 200.w,
                      height: 150.h,
                    ),
                  ),
                  (20.h).ph,
                  ZoomIn(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 500),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:
                          List.generate(controller.imageSignUp.length, (index) {
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
                  ),
                  (100.h).ph,
                  if (controller.currentIndex.value == 0) ...[
                    FadeInLeft(
                      delay: const Duration(milliseconds: 700),
                      duration: const Duration(milliseconds: 300),
                      child: const CustomTextFormField(
                        hintText: 'User Name',
                      ),
                    ),
                    (25.h).ph,
                    FadeInLeft(
                      delay: const Duration(milliseconds: 1000),
                      duration: const Duration(milliseconds: 300),
                      child: const CustomTextFormField(
                        hintText: 'Email',
                      ),
                    ),
                    (25.h).ph,
                    FadeInLeft(
                      delay: const Duration(milliseconds: 1300),
                      duration: const Duration(milliseconds: 300),
                      child: const CustomTextFormField(
                        hintText: 'Password',
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
                          controller.currentIndex.value++;
                        },
                        text: 'Sign Up',
                      ),
                    ),
                    const Spacer(),
                    const CustomText(
                        text: 'Already have account',
                        textType: TextStyleType.small),
                    (10.h).ph,
                    InkWell(
                      onTap: () {
                        Get.offAll(
                          LoginView(),
                          transition: Transition.zoom,
                          duration: const Duration(milliseconds: 350),
                        );
                      },
                      child: CustomText(
                        text: 'Log In',
                        textType: TextStyleType.bodyBig,
                        textColor: AppColors.mainColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    (35.h).ph,
                  ],
                  if (controller.currentIndex.value == 1) ...[SignUpModel()],
                  if (controller.currentIndex.value == 2) ...[SignUpCheckEmail()],
                  if (controller.currentIndex.value == 3) ...[SignUpVerify()],
                ],
              ),
            )),
      ),
      onPopInvoked: (pop) {
        if (controller.currentIndex.value != 0) {
          controller.currentIndex.value = controller.currentIndex.value - 1;
        } else {
          Get.offAll(
            () => LoginView(),
            transition: Transition.zoom,
            duration: const Duration(milliseconds: 350),
          );
        }
      },
    );
  }
}
