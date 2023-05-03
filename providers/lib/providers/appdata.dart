import 'package:flutter/material.dart';

class AppData with ChangeNotifier 
{
  String get name => _name;
  
  String _name = 'John Rambo';
  void changeData(String data) {
    _name = data;
    notifyListeners();
  }

}