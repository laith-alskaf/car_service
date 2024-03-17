import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:car_service/app/my_app.dart';
import 'package:car_service/core/data/repositories/hive_repositories.dart';
import 'package:car_service/core/utils/general_util.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Get.put(HiveRepository());
  await storage.init();
  runApp(const MyApp());
}
