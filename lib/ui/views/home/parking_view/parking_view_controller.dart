import 'dart:developer';

import 'package:car_service/core/data/models/api/choos_parking_model.dart';
import 'package:car_service/core/data/repositories/park_repositories.dart';
import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
import 'package:car_service/ui/views/home/map/map_view.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class ParkingViewController extends BaseController {
  String? selectedLocation;
  LocationData? currentLocation;
  late List<ChooseParkingModel> parkingList;

  Future<void> getClosestPark() async {
    if (currentLocation != null) {
      await runFullLoadingFutureFunction(
          function: ParkRepository()
              .getClosestPark(
        long: currentLocation!.longitude.toString(),
        lat: currentLocation!.latitude.toString(),
      )
              .then((value) {
        value.fold((l) {
          CustomToast.showMessage(
              message: l, messageType: MessageType.REJECTED);
        }, (r) {
          parkingList = r;
          log(parkingList.toString());
          List<LocationPark> locationPark = [];
          parkingList.forEach((value) {
            locationPark.add(value.location!);
          });
          Get.to(() => MapView(
                currentLocation: currentLocation!,
                locationPark: locationPark,
              ));
        });
      }));
    } else {
      currentLocation =
          await locationService.getUserCurrentLocation(hideLoader: true);
      if (currentLocation != null) {
        getClosestPark();
      }
    }
  }

  @override
  void onInit() async {
    // currentLocation =
    //     await locationService.getUserCurrentLocation(hideLoader: true);
    // TODO: implement onInit
    super.onInit();
  }
}
