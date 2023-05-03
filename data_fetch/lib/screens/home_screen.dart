import 'package:data_fetch/providers/movie_provider.dart';
import 'package:data_fetch/screens/favorites_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // final customer = Provider.of<Customer>(context);
    // final provider = Provider.of<FavoriteProvider>(context);
    // final words = nouns.take(50).toList();
    final movies = Provider.of<MovieProvider>(context).movies;
    final myList = Provider.of<MovieProvider>(context).mylist;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(13),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                  builder: (context) => const FavoritesPage(),
                )
                );
              },
              icon: const Icon(Icons.favorite),
              label: Text(
                "Go To My List (${myList.length})",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(23),
                backgroundColor: Colors.orange,
                elevation: 4,
              ),
            ),

            SizedBox(height: 15,),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (_, index) {
                  final currentMovie = movies[index];
                  return Card(
                    key: ValueKey(currentMovie.title),
                    color: Colors.blueGrey,
                    elevation: 4,
                    child: ListTile(
                      title: Text(
                        currentMovie.title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                      ),
                      subtitle: Text(
                        currentMovie.duration ?? 'No information available',
                        style: const TextStyle(
                          color: Colors.orange,
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          if(!myList.contains(currentMovie)){
                            context.read<MovieProvider>().addtoList(currentMovie);
                          }else{
                            context.read<MovieProvider>().removefromList(currentMovie);
                          }
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: myList.contains(currentMovie)
                              ? Colors.red
                              : Colors.white,
                              size: 25,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
