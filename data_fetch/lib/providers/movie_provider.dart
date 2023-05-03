import 'dart:math';

import 'package:flutter/material.dart';

import '../models/movie_model.dart';

final List<Movie> initialData = List.generate(
  50,
  (index) =>
      Movie(
    title: "Movie $index",
    duration: "${Random().nextInt(100) + 60}minutes",
  ),
);

class MovieProvider with ChangeNotifier{
  final List<Movie> _movies = initialData;
  List<Movie> get movies => _movies;

  final List<Movie> _mylist = [];
  List<Movie> get mylist => _mylist;

  void addtoList(Movie movie){
    _mylist.add(movie);
    notifyListeners();
  }
    void removefromList(Movie movie){
      _mylist.remove(movie);
      notifyListeners();
    }
}
