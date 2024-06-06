
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ChooseParkingViewController extends GetxController {
  RxString birthDay='no date select'.obs;
  RxInt selectedContainer = 0.obs;

  RxString time='no time select'.obs;
  Future selectDate() async {
    final selectedDate = await showDatePicker(
      context: Get.context!,
      initialDate: DateTime.now(),
      firstDate:DateTime.now(),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      birthDay.value = selectedDate.toString().substring(0, 10);
    }
  }
  Future selectTime() async {
    final now = DateTime.now();
    final selectedTime = await showTimePicker(
      context: Get.context!,
      initialTime: TimeOfDay.fromDateTime(now),
      helpText: 'Select Time',
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },

    );

    if (selectedTime != null) {


      final hour = selectedTime.hourOfPeriod;
      final minute = selectedTime.minute;
      final period = selectedTime.period == DayPeriod.am ? 'AM' : 'PM';

      time.value = '$hour:$minute $period';
    }
  }