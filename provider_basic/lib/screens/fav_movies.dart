import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class FavouriteScreen extends StatefulWidget {
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final _myList = context.watch<MovieProvider>().myList;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My List (${_myList.length})"),
      ),
      body: ListView.builder(
        itemCount: _myList.length,
        itemBuilder: (_, index) {
          final currentMovie = _myList[index];
          return Card(
            key: ValueKey(currentMovie.title),
            elevation: 4,
            child: ListTile(
              title: Text(currentMovie.title),
              subtitle: Text(currentMovie.duration ?? ''),
              trailing: TextButton(
                onPressed: () {
                  context.read<MovieProvider>().removeFromList(currentMovie);
                },
                child: const Text(
                  'Remove',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
