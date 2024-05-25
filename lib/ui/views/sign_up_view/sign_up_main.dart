import 'package:animate_do/animate_do.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/core/utils/string_urtil.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_drop_menu.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey(debugLabel: 'signScreenKey');

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Padding(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Obx(() => SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: IntrinsicHeight(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            (0.05.sh).ph,
                            if (controller.currentIndex.value != 0)
                              FadeInDown(
                                delay: const Duration(milliseconds: 400),
                                duration: const Duration(milliseconds: 300),
                                child: SvgPicture.asset(
                                  'assets/images/ic_${controller.imageSignUp[controller.currentIndex.value]}.svg',
                                  width: 200.w,
                                  height: 150.h,
                                ),
                              ),
                            if (controller.currentIndex.value == 0)
                              ZoomIn(
                                child: Align(
                                  alignment: AlignmentDirectional.centerStart,
                                  child: CustomText(
                                    text: 'Let’s Create New Account',
                                    textType: TextStyleType.bodyBig,
                                    textColor: AppColors.blackColor,
                                    startPadding: 15.w,
                                  ),
                                ),
                              ),
                            (20.h).ph,
                            ZoomIn(
                              delay: const Duration(milliseconds: 700),
                              duration: const Duration(milliseconds: 500),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                    controller.imageSignUp.length, (index) {
                                  return Obx(() {
                                    return Container(
                                      margin: EdgeInsetsDirectional.only(
                                          end: index + 1 ==
                                                  controller.imageSignUp.length
                                              ? 0
                                              : 20.w),
                                      height: 10.h,
                                      width: 10.h,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                          color:
                                              controller.currentIndex.value ==
                                                      index
                                                  ? AppColors.mainColor
                                                  : AppColors.backgroundColor),
                                    );
                                  });
                                }),
                              ),
                            ),
                            (20.h).ph,
                            if (controller.currentIndex.value == 0) ...[
                              Row(
                                children: [
                                  FadeInLeft(
                                    delay: const Duration(milliseconds: 700),
                                    duration: const Duration(milliseconds: 200),
                                    child: CustomTextFormField(
                                      onFieldSubmitted: (value) {
                                        if (value.isEmpty ||
                                            StringUtil.isName(value)) {
                                          return 'Input your first name';
                                        }
                                        return null;
                                      },
                                      widthContainer: 215.w,
                                      hintText: 'First Name',
                                      controller:
                                          controller.firstNameController,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            StringUtil.isName(value)) {
                                          return 'Input your first name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                  const Spacer(),
                                  FadeInLeft(
                                    delay: const Duration(milliseconds: 700),
                                    duration: const Duration(milliseconds: 200),
                                    child: CustomTextFormField(
                                      widthContainer: 215.w,
                                      hintText: 'Last Name',
                                      controller: controller.lastNameController,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            StringUtil.isName(value)) {
                                          return 'please check your last name';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              (25.h).ph,
                              FadeInLeft(
                                delay: const Duration(milliseconds: 900),
                                duration: const Duration(milliseconds: 200),
                                child: CustomTextFormField(
                                  hintText: 'Email',
                                  keyboardType: TextInputType.emailAddress,
                                  controller: controller.emailController,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !StringUtil.isEmail(value)) {
                                      return 'please check your email';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              (25.h).ph,
                              FadeInLeft(
                                delay: const Duration(milliseconds: 1100),
                                duration: const Duration(milliseconds: 200),
                                child: CustomTextFormField(
                                  controller: controller.passwordController,
                                  hintText: 'Password',
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        StringUtil.isPassword(value)) {
                                      return 'please check your password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              (25.h).ph,
                              FadeInLeft(
                                delay: const Duration(milliseconds: 1100),
                                duration: const Duration(milliseconds: 200),
                                child: CustomTextFormField(
                                  controller: controller.confirmController,
                                  hintText: 'Confirm Password',
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        controller.passwordController.text !=
                                            controller.confirmController.text) {
                                      return 'please check your confirm password';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              (25.h).ph,
                              SignUpModel(
                                fromKey: _formKey,
                              ),
                              (25.h).ph,
                              const Spacer(),
                              ZoomIn(
                                delay: const Duration(milliseconds: 1900),
                                duration: const Duration(milliseconds: 200),
                                child: const CustomText(
                                    isTextAlign: TextAlign.center,
                                    text: 'Already have account',
                                    textType: TextStyleType.small),
                              ),
                              (10.h).ph,
                              ZoomIn(
                                delay: const Duration(milliseconds: 1900),
                                duration: const Duration(milliseconds: 200),
                                child: InkWell(
                                  onTap: () {
                                    Get.offAll(() => LoginView(),
                                        transition: Transition.zoom,
                                        duration:
                                            const Duration(milliseconds: 350));
                                  },
                                  child: CustomText(
                                    isTextAlign: TextAlign.center,
                                    text: 'Log In',
                                    textType: TextStyleType.bodyBig,
                                    textColor: AppColors.mainColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              (35.h).ph,
                            ],
                            if (controller.currentIndex.value == 1) ...[
                              SignUpCheckEmail(
                                controller: controller,
                              )
                            ],
                            if (controller.currentIndex.value == 2) ...[
                              SignUpVerify(
                                controller: controller,
                              )
                            ],
                          ],
                        ),
                      ),
                    ),
                  ))),
        ),
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
