import 'package:flutter/material.dart';
import 'package:google_maps/directions.dart';
import 'package:google_maps/models/direction_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LineMapsScreen extends StatefulWidget {
  const LineMapsScreen({super.key});

  @override
  State<LineMapsScreen> createState() => _LineMapsScreenState();
}

class _LineMapsScreenState extends State<LineMapsScreen> {
  late GoogleMapController mapController;
  Marker? _origin;
  Marker? _destination;
  Directions? _info;

  static const CameraPosition initialCamPosition = CameraPosition(
    target: LatLng(37.7749, -122.4194),
    zoom: 11,
  );

  _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController = controller;
    });
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: const Text(
          'Map',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          if (_origin != null)
            TextButton(
              onPressed: () {
                mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _origin!.position,
                      zoom: 14,
                      tilt: 50.0,
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.orange,
                  textStyle: const TextStyle(fontWeight: FontWeight.w600)),
              child: const Text('ORIGIN'),
            ),
          if (_destination != null)
            TextButton(
              onPressed: () {
                mapController.animateCamera(
                  CameraUpdate.newCameraPosition(
                    CameraPosition(
                      target: _destination!.position,
                      zoom: 14,
                      tilt: 50,
                    ),
                  ),
                );
              },
              style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w600,
                  )),
              child: const Text('DEST'),
            ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          GoogleMap(
            myLocationButtonEnabled: false,
            compassEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: _onMapCreated,
            initialCameraPosition: initialCamPosition,
            mapType: MapType.normal,
            markers: {
              if (_origin != null) _origin!,
              if (_destination != null) _destination!,
            },
            polylines: {
              if(_info != null)
                Polyline(
                  polylineId: const PolylineId('overview'),
                  color: Colors.red,
                  width: 5,
                  points: _info!.polylinePoints.map((e) => LatLng(e.latitude, e.longitude)).toList(),
                )
            },
            onLongPress: _addMarker,
          ),
          if(_info != null)
          Positioned(
            top: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0
                    )
                  ]
                ),
                child: Text(
                  '${_info?.totalDistance},${_info?.totalDuration}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
        ],
      ),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
            onPressed: () {
              mapController.animateCamera(
                _info != null
                  ? CameraUpdate.newLatLngBounds(_info!.bounds, 100)
                  : CameraUpdate.newCameraPosition(initialCamPosition));
            },
            label: const Icon(Icons.directions_outlined)),
      ),
    );
  }

  void _addMarker(LatLng pos) async {
    if (_origin == null || (_origin != null && _destination != null)) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        _destination = null;
        _info = null;
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );
      });
      final directions = await DirectionsData().getDirections(
        origin: _origin!.position,
        destination: pos,
      );
      setState(() {
        _info = directions;
      });
    }
  }
}
