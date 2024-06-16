import 'package:car_service/core/data/models/api/parking_model.dart';
import 'package:car_service/core/data/models/api/problem_model.dart';
import 'package:car_service/core/data/repositories/park_repositories.dart';
import 'package:car_service/core/data/repositories/problem_repostitories.dart';
import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
import 'package:get/get.dart';

class HistoryViewController extends BaseController {
  int index = 1;
  List<ParkingHistoryModel> parkingHistory = <ParkingHistoryModel>[];
  List<ProblemHistoryModel> problemHistory = <ProblemHistoryModel>[];

  handleClickFilter({required int serviceIndex}) {
    index = serviceIndex;
    update();
  }

  RxInt currentIndexON = (-1).obs;
  RxBool showText = false.obs;

  void clickToShow(int index) {
    if (index == currentIndexON.value) {
      currentIndexON.value = -1;
      showText.value = false;
    } else {
      currentIndexON.value = index;
      showText.value = true;
    }
  }

  bool checkExpandedContainer(int index) {
    if (currentIndexON.value == index && showText.value == true) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> getHistoryParking() async {
    await runLoadingFutureFunction(
        function: ParkRepository().getHistoryParking().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        parkingHistory = r;
      });
    }));
  }

  Future<void> getHistoryProblems() async {
    await runLoadingFutureFunction(
        function: ProblemRepositories().getHistoryProblem().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        problemHistory = r;
      });
    }));
  }

  @override
  void onInit() async {
    getHistoryParking();
    getHistoryProblems();
    super.onInit();
  }
}
