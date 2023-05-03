import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/screens/favourite_screen.dart';

import '../providers/movie_provider.dart';
import '../providers/appdata.dart';
import '../screens/screen4.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    var fav = Provider.of<MovieProvider>(context).favlist;
    return Scaffold(
      appBar: AppBar(
        title: Text(Provider.of<AppData>(context).name),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Screen4()),
              );
            },
            icon: const Icon(Icons.navigation),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => FavoriteScreen(),
                  ),
                );
              },
              label: Text(
                'Go To Favorites ${fav.length}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              icon: Icon(
                Icons.favorite,
                color: Theme.of(context).colorScheme.error,
              ),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(19),
                backgroundColor: Color.fromARGB(255, 15, 52, 70),
                elevation: 4,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    color: Colors.blueGrey,
                    child: ListTile(
                      title: Text('Movies $index',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          if (!fav.contains(index)) {
                            context.read<MovieProvider>().addtoList(index);
                          } else {
                            context.read<MovieProvider>().removefromList(index);
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: fav.contains(index) ? Colors.red : Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
