import 'package:flutter/material.dart';

import '../components/title.dart';
import '../components/list_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      backgroundColor: Colors.black, 
      body: Container(
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bg.png'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.topLeft,
          )
        ),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const SizedBox(height: 30),
            const SizedBox(
              height:130,
              child: Titles('Ninja Trips'),
            ),
            Flexible(child: Lists(),)
          ]
      ),
      )
    );
  }
}