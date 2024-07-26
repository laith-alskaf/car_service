import 'package:car_service/core/data/repositories/admin_repositories.dart';
import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:car_service/ui/admin_view/admin_profile_view/admin_profile_view.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
import 'package:car_service/ui/views/main_view/main_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/data/repositories/user_repositories.dart';

class LoginViewController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    await runFullLoadingFutureFunction(
        function: UserRepository()
            .login(
      email: emailController.text,
      password: passwordController.text,
    )
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
        Get.off(() => MainView());
      });
    }));
  }
  Future<void> Adminlogin() async {
    await runFullLoadingFutureFunction(
        function: AdminRepositories()
            .adminlogin(
      email: emailController.text,
      password: passwordController.text,
    )
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(message: r, messageType: MessageType.SUCCESS);
        Get.off(() => AdminProfileView());
      });
    }));
  }
}
