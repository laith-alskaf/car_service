import 'dart:async';
import 'package:car_service/core/data/models/api/choos_parking_model.dart';
import 'package:car_service/core/data/models/api/country_model.dart';
import 'package:car_service/core/data/repositories/park_repositories.dart';
import 'package:car_service/core/enums/message_type.dart';
import 'package:car_service/core/utils/general_util.dart';
import 'package:car_service/core/utils/map_util.dart';
import 'package:car_service/ui/shared/custom_widget/custom_toast.dart';
import 'package:car_service/ui/views/home/parking_view/park_spot/park_spot_view.dart';
import 'package:car_service/ui/views/home/parking_view/parking_view.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:car_service/core/services/base_controller.dart';

class MapController extends BaseController {
  MapController(this.currentLocation, this.locationPark);

  late LocationData currentLocation;
  late List<LocationPark> locationPark;
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  late CameraPosition currentPosition;
  RxSet<Marker> markers = <Marker>{}.obs;
  late LatLng selecteLocation;
  RxString streetName = ''.obs;
  late CameraPosition initalCameraPosition;
  late LatLng selectedLocation;

  static const CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  List<LocationPark> countryList = [];

  @override
  void onInit() async {
    initalCameraPosition = CameraPosition(
      target: LatLng(currentLocation.latitude ?? 37.43296265331129,
          currentLocation.longitude ?? -122.08832357078792),
      zoom: 14.4746,
    );
    selectedLocation = LatLng(currentLocation.latitude ?? 37.43296265331129,
        currentLocation.longitude ?? -122.08832357078792);
    currentPosition = CameraPosition(
      target: LatLng(currentLocation.latitude ?? 37.42796133580664,
          currentLocation.longitude ?? -122.085749655962),
      zoom: 4,
    );
    selecteLocation = LatLng(currentLocation.latitude ?? 37.42796133580664,
        currentLocation.longitude ?? -122.08574965596);
    super.onInit();
  }

  void addMarker({
    required LatLng position,
    required String id,
    String? name,
    String? imageName,
    String? imageUrl,
  }) async {
    BitmapDescriptor markerIcon = imageName != null
        ? await MapUtil.getImageFromAsset(imageName: imageName)
        : imageUrl != null
            ? await MapUtil.getImageFromNetwork(imageUrl: imageUrl)
            : BitmapDescriptor.defaultMarker;

    markers.add(Marker(
        infoWindow: InfoWindow(title: name,onTap: (){
          choosePark(parkNumber: id);
        }),
        markerId: MarkerId(id),
        position: position,
        icon: markerIcon,
        // onTap: () {
        //
        // }
        ));
    update();
  }

  Future<void> choosePark({required String parkNumber}) async {
    await runLoadingFutureFunction(
        function:
            ParkRepository().choosePark(parkNumber: parkNumber).then((value) {
      value.fold((l) {
        CustomToast.showMessage(message: l, messageType: MessageType.REJECTED);
      }, (r) {
        Get.to(() => ParkSpotView());
      });
    }));
  }
// void getStreetName() async {
//   runLoadingFutureFunction(
//       function: locationService
//           .getAddressInfo(
//               showLoader: false,
//               LocationData.fromMap({
//                 'latitude': selecteLocation.latitude,
//                 'longitude': selecteLocation.longitude
//               }))
//           .then((value) {
//     streetName.value = value?.street ?? 'No Info Found';
//     update();
//   }));
// }
}
