import 'package:animate_do/animate_do.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/history_view/history_view_controller.dart';
import 'package:car_service/ui/views/home/history_view/history_widget/alert_dialog_delete_history.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ContainerHistoryQr extends StatelessWidget {
  final List? myItems;
  final String image;
  final int? index;
  final HistoryViewController controller;
  final Function() onTap;

  const ContainerHistoryQr(
      {super.key,
      this.myItems,
      required this.image,
      this.index,
      required this.onTap,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: 10,
      itemBuilder: (context, index) => Obx(
        () => SizedBox(
          height: controller.checkExpandedContainer(index) ? 335.h : 130.h,
          child: InkWell(
            onTap: () {
              controller.clickToShow(index);
            },
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 350),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.r),
                      ),
                      color: AppColors.whiteColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.grayColor,
                          offset: const Offset(0.0, 2.0),
                          blurRadius: 2.0,
                        ),
                      ],
                    ),
                    width: 480.w,
                    height: controller.checkExpandedContainer(index)
                        ? 250.h
                        : 120.h,
                    child: Row(
                        mainAxisAlignment:
                            controller.checkExpandedContainer(index)
                                ? MainAxisAlignment.center
                                : MainAxisAlignment.start,
                        children: [
                          Visibility(
                            visible: controller.currentIndexON.value != index,
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(start: 10.w),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r)),
                                child: SizedBox(
                                  width: 100.h,
                                  height: 100.h,
                                  child: Image.asset(
                                    '',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (controller.currentIndexON.value != index)
                            SizedBox(
                              width: 10.w,
                            ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: controller.showText.value &&
                                        controller.currentIndexON.value == index
                                    ? 80.h
                                    : 20.h),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment:
                                    controller.checkExpandedContainer(index)
                                        ? CrossAxisAlignment.center
                                        : CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  controller.checkExpandedContainer(index)
                                      ? const SizedBox()
                                      : SizedBox(
                                          width: 210.w,
                                          height: 25.h,
                                          child: const CustomText(
                                            text: 'Laith_Alskaf',
                                            overflow: TextOverflow.clip,
                                            textType: TextStyleType.bodyBig,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                  if (controller.checkExpandedContainer(index))
                                    SizedBox(
                                      width: controller
                                              .checkExpandedContainer(index)
                                          ? 320.w
                                          : 280.w,
                                      height: 20.h,
                                      child: CustomText(
                                        textType: TextStyleType.body,
                                        isTextAlign: TextAlign.center,
                                        text: 'Uniform Clothing Store',
                                        overflow: controller
                                                .checkExpandedContainer(index)
                                            ? null
                                            : TextOverflow.ellipsis,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  if (controller.checkExpandedContainer(index))
                                    (12.h).ph,
                                  controller.showText.value &&
                                          controller.currentIndexON.value ==
                                              index
                                      ? const CustomText(
                                          textType: TextStyleType.body,
                                          maxLines: 3,
                                          text: "0988999888",
                                          fontWeight: FontWeight.normal,
                                        )
                                      : CustomText(
                                          topPadding: 5.h,
                                          text: '0982055788',
                                          textType: TextStyleType.body,
                                          fontWeight: FontWeight.normal,
                                        ),
                                  (2.h).ph,
                                  controller.checkExpandedContainer(index)
                                      ? const SizedBox()
                                      : Padding(
                                          padding: EdgeInsetsDirectional.only(
                                              start: 196.w),
                                          child: const CustomText(
                                            text: " 18-12-2023",
                                            fontWeight: FontWeight.normal,
                                            textType: TextStyleType.bodyBig,
                                          ),
                                        ),
                                ],
                              ),
                            ),
                          ),
                        ]),
                  ),
                ),
                controller.checkExpandedContainer(index)
                    ? ZoomIn(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: ClipOval(
                            child: Image.asset(
                              '',
                              width: 100.w,
                              height: 100.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.only(top: 30.h, start: 400.w),
                    child: InkWell(
                      onTap: () => showAlertDelete(
                          text: 'Sure Delete History Info',
                          ontap: () => Get.back()),
                      child: SizedBox(
                          width: 20.w, height: 20.w, child: Image.asset('')),
                    ),
                  ),
                ),
                if (controller.checkExpandedContainer(index))
                  Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsetsDirectional.only(
                            top: 110.h, start: 50.w, end: 50.w),
                        child: Column(
                          children: [
                            const CustomText(
                              text: 'Laith_Alskaf',
                              textType: TextStyleType.bodyBig,
                              fontWeight: FontWeight.bold,
                            ),
                            Divider(
                              color: AppColors.textColor,
                              height: 0.1,
                            ),
                          ],
                        ),
                      ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
