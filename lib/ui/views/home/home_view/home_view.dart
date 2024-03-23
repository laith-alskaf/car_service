import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/home_view/home_view_controller.dart';
import 'package:car_service/ui/views/home/home_view/widget/custom_container_action.dart';
import 'package:car_service/ui/views/home/home_view/widget/custom_container_payment.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const CustomAppBar(
        title: 'Dashboard',
        iconSetting: true,
      ),
      (10.h).ph,
      CustomContainerPayment(
        indexes: 0,
      ),
      (15.h).ph,
      Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(controller.cash.length, (index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: CircleAvatar(
                  radius: 8.r,
                  backgroundColor: controller.focusColorSlider(index, 0)
                      ? AppColors.mainColor
                      : AppColors.grayColor,
                ),
              );
            }),
          )),
      (15.h).ph,
      ...List.generate(controller.homeAction.length, (index) {
        return CunstomContainerAction(
          action: controller.homeAction[index],
          time: '5:12:45',
          price: '2500',
        );
      })
    ]);
  }
}
