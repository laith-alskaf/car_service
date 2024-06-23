import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:car_service/core/data/repositories/park_repositories.dart';
import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
import '../../../../core/data/models/api/parking_model.dart';

class HomeViewController extends BaseController {
  ParkingTimer? parkingTimer;
  RxInt numberHoursPark = 1.obs;

  @override
  void onInit() {
    getParkingTimer();
    super.onInit();
  }

  changePrice({required bool dec}) {
    if (dec) {
      if (numberHoursPark < 24) {
        numberHoursPark += 1;
      }
    } else {
      if (numberHoursPark > 1) {
        numberHoursPark -= 1;
      }
    }
    update();
  }

  handleClickCar({required String title}) {}

  Future<void> getParkingTimer() async {
    await runFullLoadingFutureFunction(
        function: ParkRepository().parkingtimer().then((value) {
      value.fold((l) {
        parkingTimer = ParkingTimer(seconds: 00, hours: 00, minutes: 00);
        update();
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        parkingTimer = r;
        // CustomToast.showMessage(
        //     message: 'done', messageType: MessageType.SUCCESS);
        update();
      });
    }));
  }

  Future<void> expandTime() async {
    await runFullLoadingFutureFunction(
        function: ParkRepository()
            .expandtime(duration: numberHoursPark.value)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
        getParkingTimer();
      });
    }));
  }

  showDialogExpandTime() {
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.whiteColor,
          content:
              const Text('Are you sure you want to expand your parking time'),
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    changePrice(dec: false);
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
                      text: '-',
                    ),
                  ),
                ),
                Obx(() => Container(
                      alignment: Alignment.center,
                      width: 40.w,
                      height: 40.w,
                      child: CustomText(
                        isTextAlign: TextAlign.center,
                        textType: TextStyleType.bodyBig,
                        text: numberHoursPark.value.toString(),
                      ),
                    )),
                InkWell(
                  onTap: () {
                    changePrice(dec: true);
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
              ],
            ),
            (20.h).ph,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    expandTime();

                    Get.back();
                  },
                  child: const Text('OK'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}

class HomeAction {
  final String? image;
  final String? textBottom;
  final List<String>? listText;

  HomeAction({
    this.image,
    this.textBottom,
    this.listText,
  });
}
