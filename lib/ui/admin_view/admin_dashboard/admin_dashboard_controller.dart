import 'dart:ui';

import 'package:car_service/core/data/models/api/parking_model.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/ui/admin_view/add_park/add_park_view.dart';
import 'package:car_service/ui/admin_view/all_order_detiels/all_order_view.dart';
import 'package:car_service/ui/admin_view/all_parking_order/all_parking_order_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/data/models/api/Statiscs_model.dart';
import '../../../core/data/models/api/count_all_park_model.dart';
import '../../../core/data/models/api/problem_model.dart';
import '../../../core/data/models/api/total_revenue_model.dart';
import '../../../core/data/repositories/admin_repositories.dart';
import '../../../core/enums/message_type.dart';
import '../../shared/custom_widget/custom_toast.dart';


class AdminDashboardController extends GetxController {
  String messageNoOrder = '';
  List<TotalRevenue>? totalRevenuelist;
  List<NumberofLocationbyPark> numberOfLocation= <NumberofLocationbyPark>[];
  List<TotalRevenueByPark> totalRevenueByPark=<TotalRevenueByPark>[];
  List<RepairOrdersByproblem> repairOrdersByproblem = <RepairOrdersByproblem>[];


  RxInt processingCounter = 0.obs;
  RxInt finishedCounter = 0.obs;
  List<ProblemHistoryModel> problemHistory = <ProblemHistoryModel>[];
  List<CountAllParkModel> countAllParkModel = <CountAllParkModel>[];
  List<String> titleAction = [
    'Park Status',
    'Orders',
    // 'New Park',
  ];
  List<Color> colorsBar = [
    Colors.green,
    Colors.blue,
    Colors.purple,
    Colors.pink,
    Colors.indigo,
    Colors.tealAccent,
    Colors.yellow,
    Colors.orange,
    Colors.grey
  ];

  handleClickAction({required int index}) {
    if (index == 0) {
      Get.to(() => const AllParkingOrder());
    } else if (index == 1) {
      Get.to(() => const AllOrderView());
    } else if (index == 2) {
      Get.to(() => AddParkView());
    }
  }

  Future onRefresh() async {
    await getHistoryProblems();
    await getCountALlParks();
  }

  RxList<SocketPark> allorderparking = <SocketPark>[].obs;

  @override
  void onInit() async {
    connectSocket();
    await getHistoryProblems();
    await getCountALlParks();
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

  Future<void> getHistoryProblems() async {
    await AdminRepositories().getHistoryProblem().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        problemHistory = r;
        for (int i = 0; i < problemHistory.length; i++) {
          problemHistory[i].createdAt =
              problemHistory[i].createdAt!.substring(0, 10);
        }
        update();
      });
    });
  }

  Future<void> getCountALlParks() async {
    await AdminRepositories()
        .getCountAllPark(AdminEmail: storage.getAdminInfo()!.email!)
        .then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        countAllParkModel = r;
        for (int i = 0; i < problemHistory.length; i++) {
          problemHistory[i].createdAt =
              problemHistory[i].createdAt!.substring(0, 10);
        }
        print(countAllParkModel.length);
        update();
      });
    });
  }

  Future<void> gettotalRevenue() async {
    function:
    AdminRepositories().totalRevenue().then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        totalRevenuelist = r;
        update();
      });
    });
  }

  Future<void> getNumberofLocationbyPark({required String parkingname,}) async {
    function:
    AdminRepositories().numberofLocation(parkingname: parkingname).then((
        value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        numberOfLocation = r;
        update();
      });
    });
  }

  Future<void> gettotalrevenuebypark({required String parkingname,}) async {
    function:
    AdminRepositories().totalrevenuebypark(parkingname: parkingname).then((
        value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        totalRevenueByPark = r;
        update();
      });
    });
  }
  Future<void> getrepairOrdersByproblem({required String parkingname,}) async {

    AdminRepositories().repairordersbyproblem(parkingname: parkingname).then((
        value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        repairOrdersByproblem = r;
        update();
      });
    });
  }



}
