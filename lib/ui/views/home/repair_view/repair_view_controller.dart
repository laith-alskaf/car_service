import 'package:car_service/core/utils/general_util.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class RepairViewController extends GetxController {
  String? selectedLocation;
  LocationData? currentLocation;
  @override
  void onInit() async {
    currentLocation =
    await locationService.getUserCurrentLocation(hideLoader: true);
    // TODO: implement onInit
    super.onInit();
  }
}
