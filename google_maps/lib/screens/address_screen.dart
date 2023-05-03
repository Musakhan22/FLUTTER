import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddressScreen extends StatefulWidget {
  const AddressScreen({super.key});

  @override
  State<AddressScreen> createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  late String searchAddr;
  late GoogleMapController mapController;
  List<Marker> mymarker = [];

  @override
  void initState() {
    mymarker.add(
      Marker(
        markerId: MarkerId('Custom marker'),
        draggable: true,
        position: LatLng(42.3601, -71.0589)
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: onMapCreated,
            markers: Set.from(mymarker),
            initialCameraPosition: const CameraPosition(
              target: LatLng(
                42.3601,
                -71.0589,
              ),
              zoom: 13,
            ),
          ),
          Positioned(
            top: 30,
            right: 15,
            left: 10,
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Enter Address',
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.only(left: 10, top: 10),
                  suffixIcon: IconButton(
                    onPressed: () {
                      searchAndNavigate();
                    },
                    icon: const Icon(Icons.search),
                    iconSize: 20,
                  ),
                ),
                onChanged: (val) {
                  setState(() {
                    searchAddr = val;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  searchAndNavigate() {
    locationFromAddress(searchAddr).then((result) {
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(result[0].latitude, result[0].longitude),
            zoom: 13,
          ),
        ),
      );
    });
  }
}
