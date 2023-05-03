import 'package:flutter/material.dart';

import '../screens/details_screen.dart';
import '../models/trip.dart';

class Lists extends StatefulWidget {
  @override
  State<Lists> createState() => _ListTileState();
}

class _ListTileState extends State<Lists> {
  List<Widget> _listItems = [];
  final GlobalKey _listKey = GlobalKey();

  @override
  void initState() {
    addTrips();
    super.initState();
  }

  void addTrips() {
    List<Trip> _trips = [
      Trip(
          title: 'Beach Paradise', price: '350', nights: '3', img: 'beach.png'),
      Trip(title: 'City Break', price: '450', nights: '5', img: 'city.png'),
      Trip(title: 'Ski Adventure', price: '550', nights: '7', img: 'ski.png'),
      Trip(title: 'Space Night', price: '650', nights: '4', img: 'space.png'),
    ];
    _trips.forEach((Trip trip) {
      _listItems.add(buildItems(trip));
    });
  }

  Widget buildItems(Trip trip) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              trip: trip,
            ),
          ),
        );
      },
      contentPadding: const EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${trip.nights} nights',
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.orange,
            ),
          ),
          Text(
            trip.title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 20,
              color: Colors.blueGrey,
            ),
          )
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Hero(
          tag: 'location-img-${trip.img}',
          child: Image.asset(
            'images/${trip.img}',
            height: 50,
          ),
        ),
      ),
      trailing: Text('\$${trip.price}',
        style: const TextStyle(
        color: Colors.red,
        fontWeight: FontWeight.bold,
      ),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: _listKey,
      itemCount: _listItems.length,
      itemBuilder: (context, index) {
        return _listItems[index];
      },
    );
  }
}
