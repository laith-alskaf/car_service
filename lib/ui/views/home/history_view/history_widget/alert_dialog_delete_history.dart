import 'package:car_service/core/translation/app_translation.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

showAlertDelete({required String text, required Function ontap}) {
  Get.dialog(Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.r))),
    backgroundColor: AppColors.whiteColor,
    insetPadding: const EdgeInsets.only(),
    child: Container(
      color: AppColors.whiteColor,
      width: 460.w,
      height: 208.h,
      child: Padding(
        padding: EdgeInsets.all(20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 48.w, height: 43.w, child: Image.asset('')),
                Padding(
                  padding: EdgeInsets.only(top: 5.h),
                  child: CustomText(
                    textType: TextStyleType.title,
                    fontSize: 26.sp,
                    text: 'Confirm Delete',
                    fontWeight: FontWeight.bold,
                    textColor: AppColors.secondColorMain,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                (50.w).pw,
                Flexible(
                  flex: 8,
                  child: CustomText(
                    text: text,
                    textType: TextStyleType.bodyBig,
                    textColor: AppColors.secondColorMain,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15.h,
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(end: 8.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    buttonTypeEnum: ButtonTypeEnum.small,
                    backgroundColor: AppColors.whiteColor,
                    borderColor: AppColors.secondColorMain,
                    onPressed: ontap,
                    text: tr('key_cancel'),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  CustomButton(
                    buttonTypeEnum: ButtonTypeEnum.small,
                    backgroundColor: AppColors.mainColor,
                    onPressed: ontap,
                    text: 'Ok',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ),
  ));
}
