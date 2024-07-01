import 'dart:async';
import 'package:car_service/core/data/models/api/user_info_model.dart';
import 'package:car_service/core/data/repositories/user_repositories.dart';
import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
import 'package:car_service/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController {
  RxList<bool> expandedContainer = [false, false].obs;
  UserInfo userInfo = UserInfo();

  TextEditingController name = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController carNumber = TextEditingController();
  TextEditingController carModel = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController carType = TextEditingController();

  clickToExpanded({required int index}) {
    expandedContainer[index] = !expandedContainer[index];
  }

  @override
  void onInit() {
    userInfo = storage.getUserInfo()!;
    name = TextEditingController(text: userInfo.firstName);
    lastName = TextEditingController(text: userInfo.lastName);
    email = TextEditingController(text: userInfo.email);
    carNumber = TextEditingController(text: userInfo.car!.carNumber);
    carType = TextEditingController(text: userInfo.car!.carType);
    carModel = TextEditingController(text: userInfo.car!.carModel);
    super.onInit();
  }

  Future<void> editProfile() async {
    await runFullLoadingFutureFunction(
        function: UserRepository()
            .editProfile(
            lastName: lastName.text,
            firstName: name.text,
            carNumber: carNumber.text,
            carModel: carModel.text,
            carType: carType.text)
            .then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
          }, (r) {
            CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
            userInfo.firstName = name.text;
            userInfo.username = name.text;
            userInfo.lastName = lastName.text;
            userInfo.car!.carModel = carModel.text;
            userInfo.car!.carNumber = carNumber.text;
            userInfo.car!.carType = carType.text;
            storage.setUserInfo(userInfo);
            Get.off(() => MainView());
          });
        }));
  }
}
