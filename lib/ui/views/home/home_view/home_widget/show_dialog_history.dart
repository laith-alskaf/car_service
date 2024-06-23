import 'package:car_service/ui/admin_view/all_order_detiels/all_order_controller.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_button.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/views/home/history_view/history_widget/alert_dialog_delete_history.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

showAlertEditRepair({required String id}) {
  Get.dialog(Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.r))),
    backgroundColor: AppColors.whiteColor,
    insetPadding: const EdgeInsets.only(),
    child: IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(35.r)),
          color: AppColors.whiteColor,
        ),
        width: 460.w,
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SizedBox(
                      width: 30.w,
                      height: 30.w,
                      child: SvgPicture.asset(
                        'assets/images/ic_edit.svg',
                        color: AppColors.blackColor,
                      )),
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 5.h, start: 5.w),
                    child: CustomText(
                      textType: TextStyleType.title,
                      fontSize: 26.sp,
                      text: 'Update Or Delete Order Repair',
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.secondColorMain,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    buttonTypeEnum: ButtonTypeEnum.medium,
                    backgroundColor: AppColors.mainColor,
                    onPressed: () {
                      Get.back();
                      showAlertUpdateRepair(id: id);
                    },
                    text: 'Update',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomButton(
                    buttonTypeEnum: ButtonTypeEnum.medium,
                    backgroundColor: AppColors.whiteColor,
                    borderColor: AppColors.secondColorMain,
                    textColor: AppColors.mainColor,
                    onPressed: () {
                      Get.back();
                      showAlertDelete(
                          text: 'Sure Delete History Info', onTap: () {});
                    },
                    text: 'Delete',
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}

showAlertUpdateRepair({required String id}) {
  AllOrderController controller = Get.find();
  Get.dialog(Dialog(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(35.r))),
    backgroundColor: AppColors.whiteColor,
    insetPadding: const EdgeInsets.only(),
    child: IntrinsicHeight(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(35.r)),
          color: AppColors.whiteColor,
        ),
        width: 460.w,
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15.h,
              ),
              Row(
                children: [
                  SizedBox(
                      width: 30.w,
                      height: 30.w,
                      child: const Icon(Icons.update_sharp)),
                  Padding(
                    padding: EdgeInsetsDirectional.only(start: 5.w),
                    child: CustomText(
                      textType: TextStyleType.title,
                      fontSize: 26.sp,
                      text: 'Update Order Repair',
                      fontWeight: FontWeight.bold,
                      textColor: AppColors.secondColorMain,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    buttonTypeEnum: ButtonTypeEnum.small,
                    backgroundColor: AppColors.whiteColor,
                    borderColor: AppColors.secondColorMain,
                    textColor: AppColors.mainColor,
                    onPressed: () {
                      Get.back();
                    },
                    text: 'Cancel',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomButton(
                    buttonTypeEnum: ButtonTypeEnum.small,
                    backgroundColor: AppColors.mainColor,
                    onPressed: () {
                      Get.back();
                      controller.updateOrderProblem(
                          price: 2, date: '', orderId: id);
                    },
                    text: 'Ok',
                  ),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
            ],
          ),
        ),
      ),
    ),
  ));
}
