import 'package:car_service/ui/views/login_view/login_view.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Future.delayed(const Duration(seconds: 5)).then((value) {
      // if (storage.getFirstLunch())
      //   {
      //      Get.off(const IntroView());
      //
      //   }
      // //to off back
      // else{
      //   Get.off(storage.isLoggedIn? const ShoppingPageView() : const LandingView(),);
      // }
      // storage.setFirstLunch(false);
      Get.off(LoginView());
    });
    super.onInit();
  }
}
