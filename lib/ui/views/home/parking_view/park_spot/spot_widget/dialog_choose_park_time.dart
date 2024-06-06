import 'package:car_service/core/translation/app_translation.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text_field.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/parking_view/park_spot/park_spot_view_controller.dart';
import 'package:car_service/ui/views/home/parking_view/park_spot/spot_widget/custom_date.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

showDialogDatePark(
    {required String nameSpot, required ParkSpotViewController controller}) {
  // ParkSpotViewController controller = Get.find();
  showDialog(
    barrierDismissible: true,
    context: Get.context!,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: const EdgeInsets.only(),
        content: IntrinsicHeight(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(20),
            ),
            width: 400.w,
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        text: tr("Select Date and Start Hour"),
                        textType: TextStyleType.title),
                    (20.h).ph,
                    GetBuilder<ParkSpotViewController>(builder: (s) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ContainerDate(
                            ontap: controller.selectDate(),
                            controller: controller.dateSpot,
                          ),
                          (20.w).pw,
                          ContainerDate(
                              controller: controller.timeSpot,
                              ontap: controller.selectTime()),
                        ],
                      );
                    }),
                    (100.h).ph,
                    CustomText(
                        text: tr("Parking Time"),
                        textType: TextStyleType.title),
                    (20.h).ph,
                    Container(
                      width: 50.w,
                      height: 40.h,
                      child: CustomText(
                        isTextAlign: TextAlign.center,
                        textType: TextStyleType.bodyBig,
                        text: '-',
                      ),
                    ),
                    GetBuilder<ParkSpotViewController>(builder: (s) {
                      return Container(
                        width: 50.w,
                        height: 40.h,
                        child: CustomText(
                          isTextAlign: TextAlign.center,
                          textType: TextStyleType.bodyBig,
                          text: controller.numberHoursPark.toString(),
                        ),
                      );
                    }),
                    Container(
                      width: 50.w,
                      height: 40.h,
                      child: CustomText(
                        isTextAlign: TextAlign.center,
                        textType: TextStyleType.bodyBig,
                        text: '+',
                      ),
                    ),
                    (20.h).ph,
                    CustomText(
                        text: tr("Parking Spot"),
                        textType: TextStyleType.title),
                    (20.h).ph,
                    CustomText(text: nameSpot, textType: TextStyleType.title),
                    (40.h).ph,
                    Center(
                        child: CustomButton(
                      text: tr("Next"),
                      buttonTypeEnum: ButtonTypeEnum.normal,
                      onPressed: () {
                        // if (_formKey.currentState!.validate()) {}
                      },
                    )),
                    (20.h).ph,
                    Center(
                        child: CustomText(
                      text: "Cansel",
                      textType: TextStyleType.title,
                      textColor: AppColors.mainColor,
                    )),
                  ],
                )),
          ),
        ),
      );
    },
  );
}
