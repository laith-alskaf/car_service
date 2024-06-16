import 'package:car_service/core/data/repositories/park_repositories.dart';
import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../core/data/models/api/parking_model.dart';

class ParkSpotViewController extends BaseController {
  ParkSpotViewController(this.parkingSpot, this.selectedPark, this.price);

  late double price;
  late double checkPrice;

  int numberHoursPark = 1;
  late List<ParkingSpot> parkingSpot;
  late String selectedPark;
  late int indexSpot;
  RxString birthDay = ''.obs;
  RxInt selectedContainer = 0.obs;
  late int hour;
  RxString time = ''.obs;

  @override
  void onInit() {
    checkPrice = price;
    update();
    initSpots();

    super.onInit();
  }

  initSpots() {
    indexSpot = parkingSpot.indexWhere((s) {
      return s.filled == false;
    });
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

  bool handleCarExist({required int index}) {
    return parkingSpot[index].filled!;
  }

  selectDate() async {
    final selectedDate = await showDatePicker(
      onDatePickerModeChange: (DatePickerEntryMode value) {
        Navigator.of(Get.context!).pop(value);
      },
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      birthDay.value = selectedDate.toString().substring(0, 10);
    }
    update();
  }

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

  clearData() {
    time.value = '';
    birthDay.value = '';
    numberHoursPark = 1;
    checkPrice = price;
  }

  Future<void> chooseTimeSpot() async {
    await runFullLoadingFutureFunction(
        function: ParkRepository()
            .chooseTimeSpot(
                parkingName: selectedPark,
                date: time.value,
                duration: numberHoursPark,
                Spot: parkingSpot[indexSpot].parkNumber!)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        clearData();
        Get.back();
      });
    }));
  }
}
