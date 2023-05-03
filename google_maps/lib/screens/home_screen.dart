import 'package:flutter/material.dart';

import '../screens/maps_lines_screen.dart';
import '../screens/get_location_screen.dart';
import '../screens/address_screen.dart';
import '../screens/current_location_screen.dart';
import '../screens/map_screen.dart';
import '../screens/select_location_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const MapScreen(),
                  ),
                );
              },
              child: const Text('Simple Map'),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const CurrentLocationScreen(),
                  ),
                );
              },
              child: const Text('Current Location'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SelectLocationScreen(),
                  ),
                );
              },
              child: const Text('Select Location'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AddressScreen(),
                  ),
                );
              },
              child: const Text('Get Address'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const GetLocationScreen(),
                  ),
                );
              },
              child: const Text('Get Multiple Location'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const LineMapsScreen(),
                  ),
                );
              },
              child: const Text('Get Lines on Map'),
            ),
          ],
        ),
      ),
    );
  }
}