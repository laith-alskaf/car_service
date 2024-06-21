

import 'package:car_service/core/data/repositories/hive_repositories.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:car_service/app/my_app.dart';
import 'package:get/get.dart';

import 'core/services/notification_srevice.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  Get.put(HiveRepository());
  await storage.init();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    Get.put(NotificationService());
  } catch (e) {
    print(e);
  }
  runApp(const MyApp());
}
