import 'package:animations/components/heart.dart';
import 'package:flutter/material.dart';

import '../models/trip.dart';

class DetailScreen extends StatelessWidget {
  final Trip trip;
  const DetailScreen({required this.trip});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              child: Hero(
                tag: 'location-img-${trip.img}',
                child: Image.asset(
                  'images/${trip.img}',
                  height: 350,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ListTile(
              title: Text('${trip.title}',style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold, 
              ),),
              subtitle: Text(
                '${trip.nights} night stay for only \$${trip.price}',
                style: const TextStyle(
                  letterSpacing: 1,
                  color: Colors.white
                ),
              ),
              trailing: const HeartIcon(),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                'Welcome to the luxurious and serene haven of Hotel Serenity! Nestled amidst lush greenery and offering breathtaking views of the surrounding mountains, our hotel is the perfect destination for those seeking peace, tranquility, and unmatched comfort.',
                style: TextStyle(color: Colors.white, height: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
