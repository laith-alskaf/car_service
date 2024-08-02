import 'package:car_service/core/data/models/api/parking_model.dart';
import 'package:car_service/core/services/base_controller.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/admin_view/add_park/add_park_view.dart';
import 'package:car_service/ui/admin_view/all_order_detiels/all_order_view.dart';
import 'package:car_service/ui/admin_view/all_parking_order/all_parking_order_view.dart';
import 'package:get/get.dart';

import '../../../core/data/models/api/total_revenue_model.dart';
import '../../../core/data/repositories/admin_repositories.dart';
import '../../../core/enums/message_type.dart';
import '../../shared/custom_widget/custom_toast.dart';

class AdminDashboardController extends BaseController {
  List<String> projectsList = ['sdsdsd', 'scxc', 'pwepw'];
  RxInt todoCounter = 0.obs;
  String messageNoOrder = '';
  List<TotalRevenue>? totalRevenuelist;


  RxInt processingCounter = 0.obs;
  RxInt finishedCounter = 0.obs;
  List<String> titleAction = [
    'Park Status',
    'Orders',
    'New Park',
  ];
  List<String> numberInAction = ['xs', '24', ''];

  handleClickAction({required int index}) {
    if (index == 0) {
      Get.to(() => const AllParkingOrder());
    } else if (index == 1) {
      Get.to(() => const AllOrderView());
    } else if (index == 2) {
      Get.to(() => AddParkView());
    }
  }

  Future onRefresh() async {}
  RxList<SocketPark> allorderparking = <SocketPark>[].obs;

  @override
  void onInit() async {
    connectSocket();
    super.onInit();
  }

  void connectSocket() async {
    if (!socket.connected) {
      socket.auth = {
        'user_id': storage.getAdminInfo()!.sId,
        'username': storage.getAdminInfo()!.username,
      };
      socket.connect();
      socket.emit('auth', {
        'username': storage.getAdminInfo()!.username,
      });
      socket.on('getall', (message) {
        if (message is String) {
          messageNoOrder = message;
        } else {
          print(message);
          for (Map<String, dynamic> s in message) {
            allorderparking.add(SocketPark.fromJson(s));
          }
          print(allorderparking[0].userId!.firstName);
        }
        update();
      });
      socket.on('add', (message) {
        List<SocketPark> reverst = [];
        reverst.add(SocketPark.fromJson(message));
        reverst.addAll(allorderparking);
        allorderparking.clear();
        allorderparking.addAll(reverst);
        update();
        print('add');
      });
    }
  }
  Future<void> gettotalRevenue() async {
    await runLoadingFutureFunction(
        function: AdminRepositories().totalRevenue().then((value) {
          value.fold((l) {
            CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
          }, (r) {
            totalRevenuelist = r;
            update();
          });
        }));
  }






}
