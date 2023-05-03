
// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
 final VoidCallback selectHandler;
 final String answerText;

  const Answer(this.selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 4,
          backgroundColor: const Color.fromARGB(255, 11, 39, 56)),
        onPressed: selectHandler,
        child: Text(
          answerText,
        style:  const TextStyle(
          fontSize: 18.0,
        ),),
      ),
    );
  }
}