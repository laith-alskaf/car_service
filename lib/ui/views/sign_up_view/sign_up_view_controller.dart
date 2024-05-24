import 'package:car_service/core/data/repositories/user_repositiory.dart';
import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/custom_widget/custom_toast.dart';
import '../main_view/main_view.dart';

class SignUpViewController extends BaseController {
  RxInt currentIndex = 0.obs;
  List<String> imageSignUp = ['verfiy', 'emailcheck', 'ic_right'];
  List<String> listCarType = [
    'Sedan',
    'SUV (Sports Utility Vehicle)',
    'Coupe',
    'Convertible',
    'Hatchback',
    'Minivan',
    'Pickup Truck',
    'Crossover',
    'Electric Vehicle (EV)',
    'Hybrid Car'
  ];
  RxString carType = ''.obs;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verifyCodeController = TextEditingController();

  TextEditingController confirmController = TextEditingController();

  TextEditingController firstNameController = TextEditingController();

  TextEditingController lastNameController = TextEditingController();

  TextEditingController carNumberController = TextEditingController();

  TextEditingController carModelController = TextEditingController();

  Future<void> register() async {
    await runLoadingFutureFunction(
        function: UserRepository()
            .register(
                email: emailController.text,
                password: passwordController.text,
                confirmPassword: confirmController.text,
                carModel: carModelController.text,
                carNumber: carNumberController.text,
                carType: carType.value,
                firstName: firstNameController.text,
                lastName: lastNameController.text)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(
            message: 'لعيون هاشم واقطع', messageType: MessageType.SUCCESS);
        // storage.setTokenInfo(r);
        currentIndex.value++;
      });
    }));
  }

  Future<void> verify() async {
    await runLoadingFutureFunction(
        function:
            UserRepository().verify(email: emailController.text).then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(
            message: 'send code done for your email',
            messageType: MessageType.SUCCESS);
        currentIndex.value++;
      });
    }));
  }

  Future<void> sendCode() async {
    print(verifyCodeController.text);
    await runLoadingFutureFunction(
        function: UserRepository()
            .sendCode(code: verifyCodeController.text,email: emailController.text)
            .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        CustomToast.showMessage(
            message: 'Verify is done', messageType: MessageType.SUCCESS);
        Get.off(() => MainView());
      });
    }));
  }
}
