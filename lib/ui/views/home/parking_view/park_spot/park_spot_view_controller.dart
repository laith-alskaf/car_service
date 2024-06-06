import 'package:car_service/core/data/models/api/park_spot_model.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParkSpotViewController extends BaseController {
  ParkSpotViewController(this.parkingSpot, this.selectedPark, this.price);

  late double price;
  TextEditingController dateSpot = TextEditingController();
  TextEditingController timeSpot = TextEditingController();
  int numberHoursPark = 1;
  late List<ParkingSpot> parkingSpot;
  late String selectedPark;
  late int indexSpot;
  RxString birthDay = 'no date select'.obs;
  RxInt selectedContainer = 0.obs;

  RxString time = 'no time select'.obs;

  @override
  void onInit() {
    initSpots();
    super.onInit();
  }

  initSpots() {
    indexSpot = parkingSpot.indexWhere((s) {
      return s.filled == false;
    });
  }

  bool handleCarExist({required int index}) {
    return parkingSpot[index].filled!;
  }

  Future selectDate() async {
    final selectedDate = await showDatePicker(
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
    update();
  }
// Future<void> choosePark({required String parkNumber}) async {
//   await runFullLoadingFutureFunction(
//       function:
//       ParkRepository().choosePark(parkNumber: parkNumber).then((value) {
//         value.fold((l) {
//           CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
//         }, (r) {
//           Get.to(() => ParkSpotView());
//         });
//       }));
// }
}
