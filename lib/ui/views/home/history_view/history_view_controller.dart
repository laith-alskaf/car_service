import 'package:get/get.dart';

class HistoryViewController extends GetxController {
  int index = 0;

  handleClickFilter({required int serviceIndex}) {
    index = serviceIndex;
    update();
  }
}
