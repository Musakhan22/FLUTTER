import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    final _mylist = Provider.of<MovieProvider>(context).mylist;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey[400],
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.assistant_navigation),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: _mylist.length,
        itemBuilder: (_, index) {
          final currentMovie = _mylist[index];
          return Card(
            key: ValueKey(currentMovie.title),
            elevation: 5,
            child: ListTile(
              title: Text(currentMovie.title),
              subtitle: Text(currentMovie.duration ?? ""),
              trailing: TextButton(
                onPressed: () {
                  context.read<MovieProvider>().removefromList(currentMovie);
                },
                child: Text(
                  'Remove',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
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
