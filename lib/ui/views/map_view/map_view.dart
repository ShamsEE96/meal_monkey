import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:meal_monkey/ui/views/map_view/map_controller.dart';

class MapView extends StatefulWidget {
  final LocationData currentLocation;
  const MapView({
    super.key,
    required this.currentLocation,
  });

  @override
  State<MapView> createState() => MapViewState();
}

class MapViewState extends State<MapView> {
  late MapController controller;

  @override
  void initState() {
    controller =
        Get.put(MapController(currentLocation: widget.currentLocation));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          print(controller.markers);
          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: controller.initalCameraPosition,
            onMapCreated: (GoogleMapController onCreatedController) {
              controller.googleMapController.complete(onCreatedController);

              controller.markers.add(
                Marker(
                  markerId: MarkerId('Current'),
                  position: LatLng(
                    controller.locationData.latitude ?? 37.43296265331129,
                    controller.locationData.longitude ?? -122.08832357078792,
                  ),
                ),
              );
            },
            markers: controller.markers,
            onTap: (latlong) async {
              controller.selectedLocation = latlong;
              controller.placemark.value =
                  (await controller.getCurrentLocationPlacemark(
                      latlng: controller.selectedLocation))!;
              controller.markers.add(
                Marker(
                  markerId: MarkerId('Current'),
                  position: LatLng(latlong.latitude, latlong.longitude),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: Obx(
        () {
          return FloatingActionButton.extended(
            // onPressed: controller.goToTheLake,
            onPressed: () {},
            label: Text('${controller.placemark.value.name}'),
            icon: const Icon(Icons.directions_boat),
          );
        },
      ),
    );
  }
}
