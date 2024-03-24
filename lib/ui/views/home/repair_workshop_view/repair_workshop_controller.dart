import 'package:car_service/core/utils/general_util.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

enum TypeServices { electric, mechanic, others, all }

class RepairWorkshopController extends GetxController {
  late CarouselController buttonCarouselController = CarouselController();
  RxString selectTab = TypeServices.electric.name.obs;

  handleClickCar({required String title}) {}
  RxInt selectedTypeTab = 0.obs;
  List<ServiceItem> itemService = [
    ServiceItem(
        image: 'cleaning',
        name: 'Cleaning',
        typeService: TypeServices.others.name,
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
        typeService: TypeServices.all.name,
        services: [
          'You are sending  receiving too many words',
          'You are sending  receiving too many words',
          'You are sending  receiving too many words',
        ]),
    ServiceItem(
        image: 'car_repair',
        name: 'Car Repair',
        servicesAvailable: '3',
        typeService: TypeServices.mechanic.name,
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
