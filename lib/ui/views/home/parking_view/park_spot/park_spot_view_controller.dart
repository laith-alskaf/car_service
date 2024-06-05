import 'package:car_service/core/data/models/api/park_spot_model.dart';
import 'package:car_service/core/services/base_controller.dart';

class ParkSpotViewController extends BaseController {
  ParkSpotViewController(this.parkingSpot, this.selectedPark,this.price);
  late double price;
  late List<ParkingSpot> parkingSpot;
  late String selectedPark;
  late int indexSpot;

  @override
  void onInit() {
    initSpots();
    super.onInit();
  }

  initSpots() {
    indexSpot = parkingSpot.indexWhere((s) {
      return s.filled == false;
    });
  }

  bool handleCarExist({required int index}) {
    return parkingSpot[index].filled!;
  }

// Future<void> choosePark({required String parkNumber}) async {
//   await runFullLoadingFutureFunction(
//       function:
//       ParkRepository().choosePark(parkNumber: parkNumber).then((value) {
//         value.fold((l) {
//           CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
//         }, (r) {
//           Get.to(() => ParkSpotView());
//         });
//       }));
// }
}
