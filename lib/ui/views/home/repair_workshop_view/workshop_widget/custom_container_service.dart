import 'package:animate_do/animate_do.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/repair_workshop_view/repair_workshop_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class CustomContainerService extends StatelessWidget {
  final ServiceItem service;
  final int index;
  final RepairWorkshopController controller;

  const CustomContainerService(
      {super.key,
      required this.service,
      required this.controller,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Obx(() => AnimatedContainer(
          margin: EdgeInsets.only(
              bottom: controller.itemService.length == index + 1 ? 30.h : 0),
          duration: const Duration(milliseconds: 300),
          height: controller.expandContainers.value == index ? 240.h : 120.h,
          decoration: BoxDecoration(
              color: AppColors.backgroundColor,
              border: const Border(
                  bottom: BorderSide(color: AppColors.blackColor, width: 0.2))),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/${service.image}.png',
                        width: 120.w,
                        height: 100.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: service.name!,
                            textType: TextStyleType.title,
                            fontWeight: FontWeight.bold,
                            textColor:
                                controller.expandContainers.value == index
                                    ? AppColors.mainColor
                                    : null,
                          ),
                          (10.h).ph,
                          CustomText(
                            text: service.servicesAvailable == null
                                ? '120 Zontrike point'
                                : '${service.servicesAvailable} Services Available',
                            textType: TextStyleType.bodyBig,
                            textColor: service.servicesAvailable == null
                                ? AppColors.mainColor
                                : null,
                          ),
                        ],
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          controller.handleClick(index: index);
                        },
                        child: SizedBox(
                          width: 60.w,
                          height: 60.w,
                          child: Transform.flip(
                              flipY: controller.expandContainers.value == index,
                              child: const Icon(Icons.arrow_downward)),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                    visible: controller.expandContainers.value == index,
                    child: FadeInLeft(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 400),
                      child: Column(
                        children: List.generate(
                            service.services!.length,
                            (index) => CustomText(
                                bottomPadding:
                                    service.services!.length == index + 1
                                        ? 0
                                        : 10.h,
                                startPadding: 30.w,
                                endPadding: 30.w,
                                text: service.services![index],
                                textType: TextStyleType.bodyBig)),
                      ),
                    )),
              ],
            ),
          ),
        ));
  }
}
