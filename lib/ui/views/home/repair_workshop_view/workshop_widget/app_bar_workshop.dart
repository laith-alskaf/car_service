import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/repair_workshop_view/repair_workshop_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget tabBarWorkshop(
    {required RepairWorkshopController repairWorkshopController,
    bool? isSubView}) {
  return Container(
      padding: EdgeInsetsDirectional.only(top: 50.h),
      width: 1.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(10.r)),
      ),
      child: Obx(
        () => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    repairWorkshopController.selectedTypeTab.value = 0;
                    repairWorkshopController.selectTab.value = TypeServices.electric.name;

                  },
                  child: SizedBox(
                    width: 100.w,
                    height: 30.h,
                    child: CustomText(
                      textType: TextStyleType.bodyBig,
                      text: 'Electric',
                      textColor:
                          repairWorkshopController.selectedTypeTab.value == 0
                              ? AppColors.mainColor
                              : null,
                    ),
                  ),
                ),
                (50.w).pw,
                GestureDetector(
                  onTap: () {
                    repairWorkshopController.selectedTypeTab.value = 1;
                    repairWorkshopController.selectTab.value = TypeServices.mechanic.name;
                  },
                  child: SizedBox(
                    height: 30.h,
                    width: 100.w,
                    child: CustomText(
                      textType: TextStyleType.bodyBig,
                      text: 'Mechanic',
                      textColor:
                          repairWorkshopController.selectedTypeTab.value == 1
                              ? AppColors.mainColor
                              : null,
                    ),
                  ),
                ),
                (50.w).pw,
                GestureDetector(
                  onTap: () {
                    repairWorkshopController.selectedTypeTab.value = 2;
                    repairWorkshopController.selectTab.value = TypeServices.others.name;
                  },
                  child: SizedBox(
                    height: 30.h,
                    width: 100.w,
                    child: CustomText(
                      textType: TextStyleType.bodyBig,
                      text: 'Others',
                      textColor:
                          repairWorkshopController.selectedTypeTab.value == 2
                              ? AppColors.mainColor
                              : null,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                padding: EdgeInsetsDirectional.only(
                    start: (repairWorkshopController.selectedTypeTab.value == 0)
                        ? 30.w
                        : (repairWorkshopController.selectedTypeTab.value == 1
                            ? 145
                            : 250)),
                child: Container(
                  width: 120.w,
                  height: 4.h,
                  color: AppColors.mainColor,
                ),
              ),
            )
          ],
        ),
      ));
}
