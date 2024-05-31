import 'dart:developer';

import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/views/login_view/login_view.dart';
import 'package:car_service/ui/views/main_view/main_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    log(storage.getTokenInfo);
    Future.delayed(const Duration(seconds: 5)).then((value) {
      if (storage.getTokenInfo == '') {
        Get.off(() => LoginView());
      } else {
        Get.off(() => MainView());
      }
    });
    super.onInit();
  }
}
