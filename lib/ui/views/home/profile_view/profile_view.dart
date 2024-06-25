import 'package:animate_do/animate_do.dart';
import 'package:car_service/core/data/models/api/user_info_model.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_container.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/profile_view/profile_widget/custom_info.dart';
import 'package:car_service/ui/views/home/profile_view/edit_profile_view/edit_profile_view.dart';
import 'package:car_service/ui/views/home/profile_view/profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController controller = Get.put(ProfileController());
    UserInfo userInfo = storage.getUserInfo()!;
    return SafeArea(
      child: Scaffold(
        body: ListView(children: [
          CustomAppBar(
            title: 'Profile',
            onTapBack: () {
              Get.back();
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    CustomContainer(
                      height: 300.h,
                      child: ZoomIn(
                        duration: const Duration(milliseconds: 800),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'profile.png',
                                height: 140.w,
                                width: 140.w,
                                fit: BoxFit.fill,
                              ),
                              (10.h).ph,
                              CustomText(
                                  fontWeight: FontWeight.bold,
                                  text:
                                      '${storage.getUserInfo()!.firstName} ${storage.getUserInfo()!.lastName}',
                                  textType: TextStyleType.subtitle),
                              (2.h).ph,
                              const CustomText(
                                  text: 'Your iD : 0988999888',
                                  fontWeight: FontWeight.normal,
                                  textType: TextStyleType.bodyBig)
                            ],
                          ),
                        ),
                      ),
                    ),
                    (20.h).ph,
                    CustomInfo(
                      index: 0,
                      title: 'Personal Info',
                      textBody: [
                        'Name : ${userInfo.username}',
                        'Email : ${userInfo.email} ',
                      ],
                      suffixText: 'Edit',
                      onTap: () {
                        controller.expandedContainer[0] = true;
                        controller.expandedContainer[1] = false;
                        Get.to(() => const EditProfileView());
                      },
                    ),
                    (20.h).ph,
                    CustomInfo(
                      index: 1,
                      title: 'Car Info',
                      textBody: [
                        'Car Number : ${userInfo.car!.carNumber!}',
                        'Car Type : ${userInfo.car!.carType} ',
                        'Car Model : ${userInfo.car!.carModel} ',
                      ],
                      suffixText: 'Edit',
                      onTap: () {
                        controller.expandedContainer[0] = false;
                        controller.expandedContainer[1] = true;
                        Get.to(() => const EditProfileView());
                      },
                    ),
                    (20.h).ph,
                    // CustomInfo(
                    //   title: tr('key_favourite'),
                    //   suffixText: tr('key_showInfo'),
                    //   onTap: () {},
                    // ),
                    // (20.h).ph,
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
