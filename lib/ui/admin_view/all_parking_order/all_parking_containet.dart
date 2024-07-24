

import 'package:get/get.dart';

import '../../../core/data/models/api/parking_model.dart';
import '../../../core/services/base_controller.dart';
import '../../../core/utils/general_util.dart';

class AllParkingController extends BaseController {
  RxList<SocketPark> allorderparking = <SocketPark>[].obs;


  @override
  void onInit() async {

    connectSocket();
    super.onInit();
  }


  void connectSocket() async {
    if (!socket.connected) {
      socket.auth = {
        'user_id': storage.getUserInfo()!.sId,
        'username': storage.getUserInfo()!.username,
      };
      socket.connect();
      socket.emit('auth', {
        'username': 'hashem',
        // 'username': storage.getUserInfo()!.username,
      });
      socket.on('getall', (message) {
        for (Map<String, dynamic> s in message) {
          allorderparking.add(SocketPark.fromJson(s));
        }
        print(allorderparking[0].userId!.firstName);
      });
      socket.on('add', (message) {
        allorderparking.add(SocketPark.fromJson(message));
        print(allorderparking.last.userId!.sId);
      });
      print('connect');
    }
  }
}
