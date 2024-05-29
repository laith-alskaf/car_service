import 'package:car_service/core/data/repositories/user_repositiory.dart';
import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
import 'package:flutter/material.dart';

class ForgePasswordController extends BaseController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController verifyCodeController = TextEditingController();

  Future<void> forget() async {
    await runLoadingFutureFunction(
        function: UserRepository()
            .forgetPassword(email: emailController.text)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(
            message: 'the code have been sent',
            messageType: MessageType.SUCCESS);
      });
    }));
  }
}
