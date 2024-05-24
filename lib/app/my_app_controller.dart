import 'package:bot_toast/bot_toast.dart';
import 'package:car_service/core/enums/connectivity_status.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/shared/utils.dart';
import 'package:get/get.dart';

class MyAppController extends BaseController {
  ConnectivityStatus connectivityStatus = ConnectivityStatus.ONLINE;
  RxBool isOnline = false.obs;

  set setConnectivityStatus(ConnectivityStatus value) {
    connectivityStatus = value;
  }

  void listenForConnectivityStatus() {
    ("Connection From MyAppController First initial $connectivityStatus");
    connectivityService.connectivityStatusController.stream.listen((event) {
      setConnectivityStatus = event;
      ("Connection From MyAppController Changed To $event");
      myAppController.isOnline.value =
          connectivityStatus == ConnectivityStatus.ONLINE ? true : false;
      // if (isOffline) {
      //   BotToast.closeAllLoading();
      //   showNoConnectionMessage();
      // } else {
      //   BotToast.closeAllLoading();
      //   showConnectionMessage();
      // }
    });
  }

  @override
  void onInit() async {
    listenForConnectivityStatus();
    super.onInit();
  }
}
