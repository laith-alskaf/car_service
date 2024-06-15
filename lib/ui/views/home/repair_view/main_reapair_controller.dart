import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class MainRepairController extends GetxController {
  String? selectedLocation;
  int counter = 4;
  int page = 0;
  List<String> problemsType = ['Mechanical', 'Electrec', 'Other'];
  List<String> Problems = [
    'Mechanical',
    'Electrec',
    'Other',
    'Mechanical',
    'Other',
    'Electrec',
    'Mechanical',
  ];
  String chooseProblemType = '';
  String chooseProblem = '';

  LocationData? currentLocation;
  List list = [0, 1, 2, 3, 4];

  handleClickStep({required bool isIncrease}) {
    if (isIncrease) {
      if (chooseProblemType != '') {
        if (page < 4) page += 1;
      } else {
        CustomToast.showMessage(
            message: 'Please Choose before move',
            messageType: MessageType.WARNING);
      }
    } else {
      if (page >= 1) page -= 1;
    }
    update();
  }

  handleClickContainer({required String nameProblem, required bool isProblem}) {
    if (isProblem) {
      chooseProblem = nameProblem;
    } else {
      chooseProblemType = nameProblem;
    }
    update();
  }
}
