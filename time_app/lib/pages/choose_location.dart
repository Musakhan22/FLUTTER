// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  void getData() async {
    // simulate network requests for user
    String username = await Future.delayed(Duration(seconds: 3), () {
      return 'youshi';
    });

    String bio = await Future.delayed(Duration(seconds: 2), () {
      return 'Egg Collector';
    });

    print('$username - $bio');
  }

  @override
  void initState() {
    super.initState();
    getData();
    print('hey there!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text('Choose Location'),
          centerTitle: true,
          elevation: 0,
        ),
        body: Row());
  }
}
