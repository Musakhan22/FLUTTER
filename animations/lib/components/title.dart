import 'package:flutter/material.dart';

class Titles extends StatelessWidget {
  final String text;

  const Titles(this.text);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 500),
      builder: (BuildContext context, double val, child) {
        return Opacity(
          opacity: val,
          child: Padding(padding: EdgeInsets.only(top: val * 20),
          child: child,
          ),
        );
      },
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}