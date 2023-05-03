import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> mymarker = [];

  @override
  void initState() {
    super.initState();
    mymarker.add(
       const Marker(
        markerId: MarkerId('myMarker'),
        draggable: true,
       infoWindow: InfoWindow(title: 'Boston',snippet: 'A new location marked'),
        position:LatLng(42.3601, -71.0589),
      ),
    );
  }

  final Completer<GoogleMapController> _controller = Completer();
  static CameraPosition initialCameraPosition = const CameraPosition(
    target: LatLng(
      37.42796133580664,
      -122.085749655962,
    ),
    zoom: 12,
  );

  static CameraPosition targetPosition = const CameraPosition(
    target: LatLng(37.43296265331129, -122.08832357078792),
    zoom: 15,
    bearing: 190,
    tilt: 60,
  );

  void _onMapcreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void moveToBoston()async{
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: LatLng(42.3601, -71.0589),
          zoom: 13,
          bearing: 45,
          tilt: 60,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('maps'),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GoogleMap(
            onMapCreated: _onMapcreated,
            mapType: MapType.normal,
            initialCameraPosition: initialCameraPosition,
            markers: Set.from(mymarker),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // goToLocation();
          moveToBoston();
        },
        label: Text('movetoBoston'),
        icon: Icon(Icons.directions),
      ),
    );
  }
  Future<void> goToLocation() async {
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(targetPosition));
  }
}
