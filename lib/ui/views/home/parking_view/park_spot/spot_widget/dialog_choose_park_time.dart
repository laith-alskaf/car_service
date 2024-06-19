import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/translation/app_translation.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/parking_view/park_spot/park_spot_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

showDialogDatePark(
    {required String nameSpot, required ParkSpotViewController controller}) {
  Get.dialog(Dialog(
    insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.r))),
    child: IntrinsicHeight(
      child: Container(

        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(20),
        ),
        width: 400.w,
        height:0.3.sh ,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: tr("Select Date and Start Hour"),
                    textType: TextStyleType.title),
                (20.h).ph,
                GetBuilder<ParkSpotViewController>(builder: (s) {
                  return InkWell(
                      onTap: () {
                        controller.selectTime();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 170.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.mainColor,
                          ),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: CustomText(
                          isTextAlign: TextAlign.center,
                          textType: TextStyleType.bodyBig,
                          textColor: controller.time.value == ''
                              ? AppColors.grayColor
                              : null,
                          text: controller.time.value == ''
                              ? 'Select time'
                              : controller.time.value,
                        ),
                      ));
                }),
                (20.h).ph,
                CustomText(
                    text: tr("Parking Time"), textType: TextStyleType.title),
                (20.h).ph,
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        controller.changePrice(dec: false);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.mainColor,
                          ),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        width: 40.w,
                        height: 40.w,
                        child: CustomText(
                          isTextAlign: TextAlign.center,
                          textType: TextStyleType.bodyBig,
                          text: '-',
                        ),
                      ),
                    ),
                    GetBuilder<ParkSpotViewController>(builder: (s) {
                      return Container(
                        alignment: Alignment.center,
                        width: 40.w,
                        height: 40.w,
                        child: CustomText(
                          isTextAlign: TextAlign.center,
                          textType: TextStyleType.bodyBig,
                          text: controller.numberHoursPark.toString(),
                        ),
                      );
                    }),
                    InkWell(
                      onTap: () {
                        controller.changePrice(dec: true);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.mainColor,
                          ),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        width: 40.w,
                        height: 40.w,
                        child: const CustomText(
                          isTextAlign: TextAlign.center,
                          textType: TextStyleType.bodyBig,
                          text: '+',
                        ),
                      ),
                    ),
                    const Spacer(),
                    GetBuilder<ParkSpotViewController>(builder: (s) {
                      return Container(
                        alignment: Alignment.center,
                        width: 130.w,
                        height: 40.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.mainColor,
                          ),
                          borderRadius: BorderRadius.circular(15.r),
                        ),
                        child: CustomText(
                          isTextAlign: TextAlign.center,
                          textType: TextStyleType.bodyBig,
                          text: controller.checkPrice.toString(),
                        ),
                      );
                    }),
                    (20.w).pw,
                  ],
                ),
                (20.h).ph,
                CustomText(
                    text: tr("Parking Spot"), textType: TextStyleType.title),
                (20.h).ph,
                CustomText(text: nameSpot, textType: TextStyleType.title),
                (20.h).ph,
                Center(
                    child: CustomButton(
                  text: tr("Next"),
                  buttonTypeEnum: ButtonTypeEnum.normal,
                  onPressed: () {
                    if (controller.time.value != '') {

                        controller.chooseTimeSpot();
                        controller.parkingTimer();

                    } else {
                      CustomToast.showMessage(
                          message: 'Please input time and date',
                          messageType: MessageType.REJECTED);
                    }
                  },
                )),
                (20.h).ph,
                Center(
                    child: InkWell(
                  onTap: () {
                    controller.clearData();
                    Get.back();
                  },
                  child: CustomText(
                    text: "Cansel",
                    textType: TextStyleType.title,
                    textColor: AppColors.mainColor,
                  ),
                )),
              ],
            )),
      ),
    ),
  ));
  // showDialog(
  //   barrierDismissible: true,
  //   context: Get.context!,
  //   builder: (BuildContext context) {
  //     return AlertDialog(
  //       contentPadding: const EdgeInsets.only(),
  //       content: IntrinsicHeight(
  //         child: Container(
  //           decoration: BoxDecoration(
  //             color: AppColors.whiteColor,
  //             borderRadius: BorderRadius.circular(20),
  //           ),
  //           width: 400.w,
  //           child: Padding(
  //               padding: EdgeInsets.symmetric(horizontal: 10.w),
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   CustomText(
  //                       text: tr("Select Date and Start Hour"),
  //                       textType: TextStyleType.title),
  //                   (20.h).ph,
  //                   GetBuilder<ParkSpotViewController>(builder: (s) {
  //                     return Row(
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         ContainerDate(
  //                           ontap: controller.selectDate(),
  //                           controller: controller.dateSpot,
  //                         ),
  //                         (20.w).pw,
  //                         ContainerDate(
  //                             controller: controller.timeSpot,
  //                             ontap: controller.selectTime()),
  //                       ],
  //                     );
  //                   }),
  //                   (100.h).ph,
  //                   CustomText(
  //                       text: tr("Parking Time"),
  //                       textType: TextStyleType.title),
  //                   (20.h).ph,
  //                   Container(
  //                     width: 50.w,
  //                     height: 40.h,
  //                     child: CustomText(
  //                       isTextAlign: TextAlign.center,
  //                       textType: TextStyleType.bodyBig,
  //                       text: '-',
  //                     ),
  //                   ),
  //                   GetBuilder<ParkSpotViewController>(builder: (s) {
  //                     return Container(
  //                       width: 50.w,
  //                       height: 40.h,
  //                       child: CustomText(
  //                         isTextAlign: TextAlign.center,
  //                         textType: TextStyleType.bodyBig,
  //                         text: controller.numberHoursPark.toString(),
  //                       ),
  //                     );
  //                   }),
  //                   Container(
  //                     width: 50.w,
  //                     height: 40.h,
  //                     child: CustomText(
  //                       isTextAlign: TextAlign.center,
  //                       textType: TextStyleType.bodyBig,
  //                       text: '+',
  //                     ),
  //                   ),
  //                   (20.h).ph,
  //                   CustomText(
  //                       text: tr("Parking Spot"),
  //                       textType: TextStyleType.title),
  //                   (20.h).ph,
  //                   CustomText(text: nameSpot, textType: TextStyleType.title),
  //                   (40.h).ph,
  //                   Center(
  //                       child: CustomButton(
  //                     text: tr("Next"),
  //                     buttonTypeEnum: ButtonTypeEnum.normal,
  //                     onPressed: () {
  //                       // if (_formKey.currentState!.validate()) {}
  //                     },
  //                   )),
  //                   (20.h).ph,
  //                   Center(
  //                       child: CustomText(
  //                     text: "Cansel",
  //                     textType: TextStyleType.title,
  //                     textColor: AppColors.mainColor,
  //                   )),
  //                 ],
  //               )),
  //         ),
  //       ),
  //     );
  //   },
  // );
}
