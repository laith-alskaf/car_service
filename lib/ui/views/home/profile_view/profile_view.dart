import 'package:animate_do/animate_do.dart';
import 'package:car_service/core/data/models/api/user_info_model.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_container.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/profile_view/custom_info.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
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
                              const CustomText(
                                  fontWeight: FontWeight.bold,
                                  text: 'Laith Alskaf',
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
                      title: 'Personal Info',
                      textBody: [
                        'Name : ${userInfo.username}',
                        'Email : ${userInfo.email} ',
                      ],
                      suffixText: 'Edit',
                    ),
                    (20.h).ph,
                    CustomInfo(
                      title: 'Car Info',
                      textBody: [
                        'Car Number : ${userInfo.car!.carNumber!}',
                        'Car Type : ${userInfo.car!.carType} ',
                        'Car Model : ${userInfo.car!.carModel} ',
                      ],
                      suffixText: 'Edit',
                      onTap: () {},
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
