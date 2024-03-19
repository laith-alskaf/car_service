import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeViewController extends GetxController{
  late CarouselController buttonCarouselController = CarouselController();
  RxList<int> selectedImageIndex = [0, 0, 0].obs;

  final List<List<String>> cash = [
    ['iDCash'],
    ['syriatel', 'mtn'],
    ['baraka', 'bemo']
  ];
  handleClickCar({required String title}) {

  }
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