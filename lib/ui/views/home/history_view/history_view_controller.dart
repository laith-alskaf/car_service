import 'package:get/get.dart';

class HistoryViewController extends GetxController {
  int index = 0;

  handleClickFilter({required int serviceIndex}) {
    index = serviceIndex;
    update();
  }
  RxInt currentIndexON = (-1).obs;
  RxBool showText = false.obs;


  void clickToShow(int index) {
    if(index==currentIndexON.value){
      currentIndexON.value=-1;
      showText.value= false;
    }
    else{
      currentIndexON.value=index;
      showText.value= true;
    }
  }
  bool checkExpandedContainer(int index){
    if(currentIndexON.value==index && showText.value == true){
      return true;
    } else{
      return false;
    }
  }
}
