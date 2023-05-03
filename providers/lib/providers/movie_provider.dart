import 'package:flutter/material.dart';

class MovieProvider with ChangeNotifier {
  List favlist = [];

  void addtoList(index)
  {
    favlist.add(index);
    notifyListeners();
  }
  void removefromList(index){
    favlist.remove(index);
    notifyListeners();
  }
}