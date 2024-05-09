import 'dart:async';
import 'package:car_service/ui/views/home/map/map_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:car_service/core/enums/request_status.dart';

class MapView extends StatefulWidget {
  final LocationData currentLocation;

  const MapView({super.key, required this.currentLocation});

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: MapController(widget.currentLocation),
        builder: (mapController) {
          return Scaffold(
            body: GoogleMap(
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: mapController.currentPosition,
              onMapCreated: (GoogleMapController controller) async {
                mapController.controller.complete(controller);
                mapController.countryList.forEach((element) {
                  mapController.addMarker(
                      imageUrl: 'https://www.fluttercampus.com/img/car.png',
                      position: LatLng(element.latitude ?? 37.42796133580664,
                          element.longitude ?? -122.085749655962),
                      id: element.alpha2.toString());
                });
              },
              markers: mapController.markers,
              onTap: (latlong) {
                mapController.selecteLocation = latlong;
                mapController.addMarker(
                    imageUrl: 'https://www.fluttercampus.com/img/car.png',
                    position: LatLng(latlong.latitude, latlong.longitude),
                    id: 'current');
              },
            ),
            floatingActionButton: mapController.requestStatus.value ==
                    RequestStatus.LOADING
                ? const CircularProgressIndicator()
                : Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.only(start: 25.w, bottom: 25.w),
                      child: FloatingActionButton.extended(
                        onPressed: _goToTheLake,
                        label: Text(mapController.streetName.value),
                        icon: const Icon(Icons.directions_boat),
                      ),
                    ),
                  ),
          );
        });
  }

  Future<void> _goToTheLake() async {
    // final GoogleMapController controller = await _controller.future;
    // await controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
