import 'package:get/get.dart';

class SignUpViewController extends GetxController {
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
  String carType = '';
}
