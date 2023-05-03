import 'package:flutter/material.dart';

class HeartIcon extends StatefulWidget {
  const HeartIcon({super.key});

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> with SingleTickerProviderStateMixin {
  bool isFav = false;
   late AnimationController _controller;
   Animation? _colorAnimation;
   Animation<double>? _sizeAnimation;

  @override
  void initState()  {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(microseconds: 300),
      vsync: this,
    );

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);

        _sizeAnimation = TweenSequence(
          <TweenSequenceItem<double>>[
            TweenSequenceItem(
              tween: Tween<double>(begin: 30, end: 50),
              weight: 50
            ),
            TweenSequenceItem(
              tween: Tween<double>(begin: 50, end: 30),
              weight: 50
            )
          ]
        ).animate(_controller);

    _controller.addListener(() {
      print(_controller.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
        if (status == AnimationStatus.dismissed) {
          setState(() {
            isFav = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return IconButton(
          onPressed: () {
           isFav ? _controller.reverse() : _controller.forward();
          },
          icon: Icon(
            Icons.favorite,
            color: _colorAnimation?.value,
            size: _sizeAnimation?.value,
          ),
        );
      },
    );
  }
}
