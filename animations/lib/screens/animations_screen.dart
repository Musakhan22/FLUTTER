import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
  double _opacity = 1;
  double _margin = 2;
  double _width = 200;
  Color _color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        margin: EdgeInsets.all(_margin),
        width: _width,
        color: _color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _margin = 50;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueGrey,
                elevation: 20,
              ),
              child: const Text('animate Margin'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _color = Colors.red;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                elevation: 20,
              ),
              child: const Text('animate Color'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _width = 500;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                elevation: 20,
              ),
              child: const Text('animate Width'),
            ),
             ElevatedButton(
              onPressed: () {
                setState(() {
                   _opacity = 0;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.cyan,
                elevation: 20,
              ),
              child: const Text('animate Opacity'),
            ),
            AnimatedOpacity(
              duration: const Duration(seconds: 2),
              opacity: _opacity,
              child: const Text(
                'hide it',
              style: TextStyle(
                color: Colors.white
              ),),
            )
          ],
        ),
      ),
    );
  }
}
