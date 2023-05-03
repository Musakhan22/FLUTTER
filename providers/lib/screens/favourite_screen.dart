import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/movie_provider.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var list = Provider.of<MovieProvider>(context).favlist;
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: ListTile(
              title: Text('Movies $index'),
              trailing: TextButton(
                onPressed: () {
                  context.read<MovieProvider>().removefromList(list[index]);
                },
                child: Text(
                  'Remove',
                  style: TextStyle(color: Theme.of(context).colorScheme.error),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
