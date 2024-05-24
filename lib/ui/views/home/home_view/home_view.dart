import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/home_view/home_view_controller.dart';
import 'package:car_service/ui/views/home/home_view/home_widget/conteiner_info.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const CustomAppBar(
        title: 'Home',
        iconSetting: true,
      ),
      (10.h).ph,
      // CustomContainerPayment(
      //   indexes: 0,
      // ),
      // (15.h).ph,
      // Obx(() => Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: List.generate(controller.cash.length, (index) {
      //         return Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 5.w),
      //           child: CircleAvatar(
      //             radius: 8.r,
      //             backgroundColor: controller.focusColorSlider(index, 0)
      //                 ? AppColors.mainColor
      //                 : AppColors.grayColor,
      //           ),
      //         );
      //       }),
      //     )),
      // (15.h).ph,
      // ...List.generate(controller.homeAction.length, (index) {
      //   return CunstomContainerAction(
      //     action: controller.homeAction[index],
      //     time: '5:12:45',
      //     price: '2500',
      //   );
      // })
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const  CustomContainerInfo(
            image: 'bmwi8.jpg',
            title: 'Welcom Back',
            body: 'Laith Alskaf',
          ),
          (10.w).pw,
          const CustomContainerInfo(
            image: 'car_repair.png',
            isIcon: true,
            title: 'Your Location',
            body: 'Hims, Syria',
          ),
        ],
      ),
      (20.h).ph,
      Padding(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 10.w),
        child: CustomContainerInfo(
          title: 'Wanna Park ?',
          body: 'Check out avalible spots near you',
          existImage: false,
          height: 90.h,
          icon: 'ic_park',
        ),
      ),
      (20.h).ph,
      Container(
        height: 200.h,
        margin:  EdgeInsets.symmetric(horizontal: 10.w),
        decoration: BoxDecoration(
          color: AppColors.mainColor,
          borderRadius: BorderRadius.all(Radius.circular(35.r)),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.w),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: 'My Vehicle',
                        textType: TextStyleType.bodyBig,
                        textColor: AppColors.whiteColor.withOpacity(0.5),
                      ),
                      CustomText(
                        text: 'BMW i8 2024',
                        textType: TextStyleType.title,
                        fontWeight: FontWeight.bold,
                        textColor: AppColors.whiteColor,
                      )
                    ],
                  ),
                  const Spacer(),
                  Container(
                      height: 80.w,
                      padding: EdgeInsets.all(20.w),
                      width: 80.w,
                      decoration: BoxDecoration(
                          color: AppColors.secondColorMain.withOpacity(0.3),
                          borderRadius: BorderRadius.all(Radius.circular(100.r))),
                      child: SvgPicture.asset('assets/images/ic_edit.svg')),
                ],
              ),
            ),
            Image.asset('assets/images/ic_car.png',height: 115.h,)
          ],
        ),
      ),
    ]);
  }
}
