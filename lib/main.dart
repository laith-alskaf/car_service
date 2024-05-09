import 'package:car_service/app/my_app_controller.dart';
import 'package:car_service/core/services/connectivity_service.dart';
import 'package:car_service/core/services/location_services/location_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:car_service/app/my_app.dart';
import 'package:car_service/core/data/repositories/hive_repositories.dart';
import 'package:car_service/core/utils/general_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  Get.put(ConnectivityService());
  Get.put(MyAppController());
  Get.put(HiveRepository());
  Get.put(LocationService());
  await storage.init();
  runApp(const MyApp());
}
