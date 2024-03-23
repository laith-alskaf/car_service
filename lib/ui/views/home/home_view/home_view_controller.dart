import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController {
  late CarouselController buttonCarouselController = CarouselController();
  RxList<int> selectedImageIndex = [0, 0, 0].obs;

  final List<List<String>> cash = [
    ['iDCash'],
    ['syriatel', 'mtn'],
    ['baraka', 'bemo']
  ];
  final List<HomeAction> homeAction = [
    HomeAction(image: 'pay', textBottom: 'Pay Now', listText: [
      'Payments Due',
      'Total : ',
      'Basic Package',
    ]),
    HomeAction(
      image: 'time',
      listText: ['Time Left to check up'],
    ),
    HomeAction(
      image: 'parking',
      listText: ['Wanna Park ?', 'Check out available spots near you'],
    )
  ];

  handleClickCar({required String title}) {}

  bool focusColorSlider(int index, int indexContainer) {
    if (selectedImageIndex[indexContainer] == index) {
      return true;
    } else {
      return false;
    }
  }

  onPageChanged0(int index, _) {
    selectedImageIndex[0] = index;
  }

  onPageChanged1(int index, _) {
    selectedImageIndex[1] = index;
  }

  onPageChanged2(int index, _) {
    selectedImageIndex[2] = index;
  }
}

class HomeAction {
  final String? image;
  final String? textBottom;
  final List<String>? listText;

  HomeAction({
    this.image,
    this.textBottom,
    this.listText,
  });
}
