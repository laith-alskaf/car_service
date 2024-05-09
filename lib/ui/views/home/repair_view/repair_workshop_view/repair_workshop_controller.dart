import 'package:car_service/core/enums/type_service.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

class RepairWorkshopController extends GetxController {
  late CarouselController buttonCarouselController = CarouselController();
  RxString selectTab = TypeServices.electric.name.obs;

  handleClickCar({required String title}) {}

  RxInt selectedTypeTab = 0.obs;
  List<List<String>> titleOrderDetails = [
    ['Delivery Location', 'assets/images/ic_location.svg'],
    ['Selected Vehicle', 'assets/images/car.svg'],
    ['Service Date', 'assets/bottom_bar/ic_history.svg'],
    ['Service Time', 'assets/images/time.svg']
  ];
  List<ServiceItem> itemService = [
    ServiceItem(
        image: 'cleaning',
        name: 'Cleaning',
        typeService: TypeServices.others,
        servicesAvailable: '3',
        services: [
          'You are sending  receiving too many words',
          'You are sending  receiving too many words',
          'You are sending  receiving too many words',
        ]),
    ServiceItem(
        image: 'full_check',
        name: 'Full Health Checkup',
        servicesAvailable: null,
        typeService: TypeServices.all,
        services: [
          'You are sending  receiving too many words',
          'You are sending  receiving too many words',
          'You are sending  receiving too many words',
        ]),
    ServiceItem(
        image: 'car_repair',
        name: 'Car Repair',
        servicesAvailable: '3',
        typeService: TypeServices.mechanic,
        services: [
          'You are sending  receiving too many words',
          'You are sending  receiving too many words',
          'You are sending  receiving too many words',
        ]),
  ];

  RxInt expandContainers = (-1).obs;

  handleClick({required int index}) {
    if (expandContainers.value == index) {
      expandContainers.value = -1;
    } else {
      expandContainers.value = index;
    }
  }
}
