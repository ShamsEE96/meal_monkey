import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:meal_monkey/core/services/base_controller.dart';
import 'package:meal_monkey/ui/shared/utils.dart';

class MapController extends BaseController {
  MapController({
    required LocationData currentLocation,
  }) {
    locationData = currentLocation;
  }
  late LocationData locationData;

  late CameraPosition initalCameraPosition;

  late CameraPosition kLake;

  final Completer<GoogleMapController> googleMapController =
      Completer<GoogleMapController>();

  RxSet<Marker> markers = <Marker>{}.obs;
  Rx<Placemark> placemark = Placemark().obs;

  late LatLng selectedLocation;

  @override
  void onInit() {
    initalCameraPosition = CameraPosition(
      target: LatLng(
        locationData.latitude ?? 37.43296265331129,
        locationData.longitude ?? -122.08832357078792,
      ),
      zoom: 14.4746,
    );

    kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414,
    );

    selectedLocation = LatLng(
      locationData.latitude ?? 37.43296265331129,
      locationData.longitude ?? -122.08832357078792,
    );
    super.onInit();
  }

  Future<void> goToTheLake() async {
    final GoogleMapController controller = await googleMapController.future;
    await controller.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  Future<Placemark?> getCurrentLocationPlacemark(
      {required LatLng latlng}) async {
    return locationService.getAddressInfo(
      LocationData.fromMap(
        {
          "latitude": latlng.latitude,
          "longitude": latlng.longitude,
        },
      ),
    );
  }
}
