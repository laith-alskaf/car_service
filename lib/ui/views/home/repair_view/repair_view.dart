import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_app_bar.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/map/map_view.dart';
import 'package:car_service/ui/views/home/repair_view/repair_view_controller.dart';
import 'package:car_service/ui/views/home/repair_view/repair_workshop_view/repair_workshop_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RepairView extends StatelessWidget {
  RepairView({super.key});

  RepairViewController controller = Get.put(RepairViewController());

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const CustomAppBar(
        title: 'Repair',
        iconSetting: true,
      ),
      (30.h).ph,
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            const Center(
              child: CustomText(
                text: 'Choose  a',
                textType: TextStyleType.title,
                textColor: AppColors.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Center(
              child: CustomText(
                text: 'Mechanic Place',
                textType: TextStyleType.title,
                textColor: AppColors.mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            (70.h).ph,
            Container(
              height: 250.h,
              decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainColor),
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                  image: const DecorationImage(
                      image: AssetImage('assets/images/maps.png'),
                      fit: BoxFit.fill)),
            ),
            (25.h).ph,
            GestureDetector(
              onTap: () async {
                if (controller.currentLocation != null) {
                  // Get.to(() => MapView(
                  //       currentLocation: controller.currentLocation!,
                  //     ));
                } else {
                  controller.currentLocation = await locationService
                      .getUserCurrentLocation(hideLoader: true);
                  if (controller.currentLocation != null) {
                    // Get.to(() => MapView(
                    //       currentLocation: controller.currentLocation!,
                    //     ));
                  }
                }
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                width: 1.sw,
                height: 55.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainColor),
                  borderRadius: BorderRadius.all(Radius.circular(15.r)),
                ),
                child: CustomText(
                  text: controller.selectedLocation == null
                      ? 'No Location Selected'
                      : controller.selectedLocation!,
                  textType: TextStyleType.bodyBig,
                  isTextAlign: controller.selectedLocation == null
                      ? TextAlign.center
                      : null,
                  textColor: controller.selectedLocation == null
                      ? AppColors.grayColor
                      : AppColors.blackColor,
                ),
              ),
            ),
            (25.h).ph,
            CustomButton(
              onPressed: () {
                Get.to(() => RepairWorkshopView());
              },
              text: 'Next',
              buttonTypeEnum: ButtonTypeEnum.big,
              height: 45.h,
              width: 1.sw,
            )
          ],
        ),
      ),
    ]);
  }
}
