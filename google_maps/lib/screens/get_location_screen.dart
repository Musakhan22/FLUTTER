import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/coffee_model.dart';

class GetLocationScreen extends StatefulWidget {
  const GetLocationScreen({super.key});

  @override
  State<GetLocationScreen> createState() => _GetLocationScreenState();
}

class _GetLocationScreenState extends State<GetLocationScreen> {
  final Completer<GoogleMapController> mapController = Completer();

  GoogleMapController? mapsController;

  List<Marker> myMarker = [];

  PageController? _pageController;

  int? prevPage;

  @override
  void initState() {
    super.initState();
    coffeeShops.forEach((element) {
      myMarker.add(Marker(
        markerId: MarkerId(element.shopName),
        draggable: false,
        infoWindow:
            InfoWindow(title: element.shopName, snippet: element.address),
        position: element.locationCords,
      ));
    });
    _pageController = PageController(
      initialPage: 1,
      viewportFraction: 0.8,
    )..addListener(() {
      _onScroll;
    });
  }

  void _onScroll(){
    if (_pageController!.page!.toInt() != prevPage) {
      prevPage = _pageController!.page!.toInt();
      moveCamera();
    }
  }

  _coffeeShopList(index) {
    return AnimatedBuilder(
      animation: _pageController!,
      builder: (context, widget) {
        double value = 1;
        if (_pageController!.position.haveDimensions) {
          value = _pageController!.page! - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 145.0,
            width: Curves.easeInOut.transform(value) * 350.0,
            child: widget,
          ),
        );
      },
      child: InkWell(
        onTap: () {
          // moveCamera();
        },
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                height: 155.0,
                width: 275.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black54,
                        offset: Offset(0.0, 0.4),
                        blurRadius: 10,
                      )
                    ]),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topLeft: Radius.circular(10)),
                          image: DecorationImage(
                            image: NetworkImage(coffeeShops[index].thumbNail),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Expanded(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text(
                                coffeeShops[index].shopName,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                coffeeShops[index].address,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(            
                              width: 170.0,
                              child: Text(
                                coffeeShops[index].description,
                                style: const TextStyle(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
        GoogleMap(
          markers: Set.from(myMarker),
          initialCameraPosition: initialCamPos,
          onMapCreated: _onMapCreated,
          zoomControlsEnabled: true,
          mapType: MapType.hybrid,
        ),
        Positioned(
          bottom: 20.0,
          child: Container(
            height: 210,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              controller: _pageController,
              itemCount: coffeeShops.length,
              itemBuilder: (context, index) {
                return _coffeeShopList(index);
              },
            ),
          ),
        )
      ]),
      floatingActionButton: Container(
        alignment: Alignment.bottomCenter,
        child: FloatingActionButton.extended(
          onPressed: () {
            animateCamera();
          },
          label: const Text('Animate'),
          icon: const Icon(Icons.camera_enhance_outlined),
        ),
      ),
    );
  }

  void animateCamera() async {
    GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        const CameraPosition(
          target: LatLng(40.745803, -73.988213),
          zoom: 18,
          tilt: 60.0,
          bearing: 150.0,
        ),
      ),
    );
  }

  final CameraPosition initialCamPos = const CameraPosition(
    target: LatLng(
      56.1304,
      -106.3468,
    ),
    zoom: 10,
  );
  void _onMapCreated(GoogleMapController controller) {
    setState(() {
      mapController.complete(controller);
    });
  }

  moveCamera() async {
    GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: coffeeShops[_pageController!.page!.toInt()].locationCords,
          zoom: 14.0,
          bearing: 45.0,
          tilt: 45.0,
        ),
      ),
    );
  }
}
