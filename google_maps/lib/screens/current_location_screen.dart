import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CurrentLocationScreen extends StatefulWidget {
  const CurrentLocationScreen({super.key});

  @override
  State<CurrentLocationScreen> createState() => _CurrentLocationScreenState();
}

class _CurrentLocationScreenState extends State<CurrentLocationScreen> {
  late GoogleMapController googleMapController;

  static const CameraPosition initialCamPosition = CameraPosition(
    target:   LatLng(37.42796133580664, -122.085749655962),
    zoom: 15,
  );

  Set<Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Current Location'),
        centerTitle: true,
      ),
      body: GoogleMap(
        initialCameraPosition: initialCamPosition,
        markers: markers,
        zoomControlsEnabled: false,
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller){
          googleMapController = controller;
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          Position position = await _determinedPosition();

          googleMapController.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                target: LatLng(position.latitude, position.longitude),
                zoom: 14,
              ),
            ),
          );
          markers.clear();
          markers.add(
            Marker(
              markerId: const MarkerId('Current Location'),
              position: LatLng(
                  position.latitude,
                  position.longitude,
                )
            ),
          );
        },
        label: const Text('Current User'),
        icon: const Icon(Icons.location_history_outlined), 
      ),
    );
  }

  Future<Position> _determinedPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    } 
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location Permission Denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error('location permissions are denied permanently');
    }
    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}