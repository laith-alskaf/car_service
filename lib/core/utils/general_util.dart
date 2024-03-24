import 'package:car_service/core/enums/connectivity_status.dart';
import 'package:car_service/core/services/location_services/location_services.dart';
import 'package:car_service/ui/shared/utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:car_service/core/data/repositories/hive_repositories.dart';
import 'package:car_service/core/services/connectivity_service.dart';
import 'package:car_service/app/my_app_controller.dart';
import 'package:get/get.dart';

HiveRepository get storage => Get.find<HiveRepository>();

ConnectivityService get connectivityService => Get.find<ConnectivityService>();

MyAppController get myAppController => Get.find<MyAppController>();

LocationService get locationService => Get.find<LocationService>();

// LocationService get locationService => Get.find<LocationService>();
double get sizeTextTitle => 30.sp; //30  // title home view

double get sizeTextSupHeader => 27.sp; //25   // profile name

double get sizeTextBodyBig => 22.sp; //20

double get sizeTextBody => 20.sp; //18  //menu

double get defaultSizeSmall => 18.sp; //16

double get defaultPadding => 35.w; //16
// CartServices get cartServices => Get.find<CartServices>();

bool get isOnline =>
    Get.find<MyAppController>().connectivityStatus == ConnectivityStatus.ONLINE;

bool get isOffline =>
    Get.find<MyAppController>().connectivityStatus ==
    ConnectivityStatus.OFFLINE;

void checkConnection(Function function) {
  if (isOnline)
    function();
  else
    showNoConnectionMessage();
}

class ServiceItem {
  final String? typeService;
  final String? name;
  final String? image;
  final String? servicesAvailable;
  final List<String>? services;

  ServiceItem({
    this.typeService,
    this.name,
    this.image,
    this.servicesAvailable,
    this.services,
  });
}
