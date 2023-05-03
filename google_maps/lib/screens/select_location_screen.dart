import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SelectLocationScreen extends StatefulWidget {
  const SelectLocationScreen({super.key});

  @override
  State<SelectLocationScreen> createState() => _SelectLocationScreenState();
}

class _SelectLocationScreenState extends State<SelectLocationScreen> {
  List<Marker> mymarker = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(40.7128, -74.0060),
          zoom: 14,
        ),
        markers: Set.from(mymarker),
        onTap: _handleTap,
        mapType: MapType.hybrid,
      ),
    );
  }

  _handleTap(LatLng tappedpoints){
    setState(() {
      mymarker = [];
      mymarker.add(
        Marker(
          markerId: MarkerId(tappedpoints.toString()),
          position: tappedpoints,
          draggable: true,
          onDragEnd: (DragEndPosition){
          }
        ),
      );
    });
  }
}