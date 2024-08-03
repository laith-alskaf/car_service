import 'package:car_service/core/data/models/api/Statiscs_model.dart';
import 'package:car_service/core/data/models/api/problem_model.dart';
import 'package:car_service/core/data/repositories/user_repositories.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/colors.dart';
import 'package:car_service/ui/shared/custom_widget/custom_text.dart';
import 'package:car_service/ui/shared/extension_sizebox.dart';
import 'package:car_service/ui/views/home/home_view/home_widget/dialog_order_qr.dart';
import 'package:car_service/ui/views/home/home_view/qr_order_detailes/qr_order_detailes_view.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:car_service/core/data/repositories/park_repositories.dart';
import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
import '../../../../core/data/models/api/parking_model.dart';
import '../../../../core/data/repositories/admin_repositories.dart';
import '../parking_view/parking_order_detiels.dart';

class HomeViewController extends BaseController {
  ParkingTimer? parkingTimer;
  late int price;
  RxString time = ''.obs;

  selectTime() async {
    final now = DateTime.now();
    final selectedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.fromDateTime(now),
      helpText: 'Select Time',
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      hour = selectedTime.hourOfPeriod;
      final minute = selectedTime.minute;
      final period = selectedTime.period == DayPeriod.am ? 'AM' : 'PM';

      time.value = '$hour:$minute $period';


    }
    update();
  }


  RxInt numberHoursPark = 1.obs;
  late String qrParkChoose;
  late List qrParkDetails;
  late int checkPrice;
  late int hour;
  List proInfo = <String>[];
  late parkingorderdetails parkorderDetails;


  @override
  void onInit() async {
    await getParkingTimer();
    await getPro();
    // connectSocket();
    super.onInit();
  }

  changePrice({required bool dec}) {
    if (dec) {
      if (numberHoursPark < 24) {
        numberHoursPark += 1;
        checkPrice += price;
      }
    } else {
      if (numberHoursPark > 1) {
        numberHoursPark -= 1;
        checkPrice -= price;
      }
    }
    update();
  }

  Future<void> getParkingTimer() async {
    await runFullLoadingFutureFunction(
        function: ParkRepository().parkingtimer().then((value) {
          value.fold((l) {
            parkingTimer = ParkingTimer(seconds: 00, hours: 00, minutes: 00);
            update();
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            parkingTimer = r;
            update();
          });
        }));
  }

  Future<void> getPro() async {
    await UserRepository().pro().then((value) {
      value.fold((l) {}, (r) {
        proInfo = r;
        print(proInfo[0]);
      });
    });
  }

  Future<void> expandTime() async {
    await runFullLoadingFutureFunction(
        function: ParkRepository()
            .expandtime(duration: numberHoursPark.value)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(
                message: r, messageType: MessageType.SUCCESS);
            getParkingTimer();
          });
        }));
  }

  Future<void> chooseQRPark() async {
    await runFullLoadingFutureFunction(
        function:
        ParkRepository().chooseQRPark(parkName: qrParkChoose).then((value) {
          value.fold((l) {
            CustomToast.showMessage(
                message: l, messageType: MessageType.REJECTED);
          }, (r) {
            qrParkDetails = r;
            checkPrice = qrParkDetails[2];
            price = qrParkDetails[2];
            numberHoursPark=1.obs;
            update();

            showDialogOrderQRPark();
          });
        }));
  }
  Future<void> GetProSub() async {
    await runFullLoadingFutureFunction(
        function: UserRepository()
            .GetPro()
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
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
                Obx(() =>
                    Container(
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

  Future<void> chooseTimeSpot({
    required int duration,
    required String date,
    required int Spot,
    required String parkingName,
  }) async {
    await runFullLoadingFutureFunction(
        function: ParkRepository()
            .chooseTimeSpot(
            parkingName: parkingName,
            date: date,
            duration: duration,
            Spot:Spot)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
          }, (r) {
            parkorderDetails = r;
            getParkingTimer();
            update();
            Get.back();
            Get.to(() => QrParkingOrderDetiels());

            CustomToast.showMessage(
                message: 'لعيون عمك هاشم واقطع', messageType: MessageType.SUCCESS);
            // Get.to(() => ParkSpotView());
          });
        }));
  }

  Future<void> ordercanseling() async {
    ParkRepository()
            .ordercansling()
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);

            getParkingTimer();
          }, (r) {
            CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
          });
        });

    Future.delayed(Duration(seconds: 3), () {
      getParkingTimer();
    });
  }




}
