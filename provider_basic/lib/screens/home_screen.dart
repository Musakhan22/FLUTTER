// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/movie_provider.dart';
// import '../screens/fav_movies.dart';


// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   Widget build(BuildContext context) {
//     var movies = context.watch<MovieProvider>().movies;
//     var myList = context.watch<MovieProvider>().myList;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Provider'),
//         centerTitle: true,
//         elevation: 0,
        
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             ElevatedButton.icon(
//               onPressed: () {
//                 Navigator.of(context).push(
//                   MaterialPageRoute(
//                     builder: (context) => FavouriteScreen(),
//                   ),
//                 );
//               },
//               icon: const Icon(Icons.favorite),
//               label: Text(
//                 "Go to List (${myList.length})",
//                 style: const TextStyle(
//                   fontSize: 20,
//                 ),
//               ),
//               style: ElevatedButton.styleFrom(
//                 elevation: 4,
//                 alignment: Alignment.center,
//                 padding: const EdgeInsets.symmetric(vertical:22),
//                 backgroundColor: Colors.orange,
//               ),
//             ),
//             const SizedBox(height:15),
//             Expanded(
//               child: ListView.builder(
//                   itemCount: movies.length,
//                   itemBuilder: (_, index) {
//                     final currentMovie = movies[index];
//                     return Card(
//                       key: ValueKey(currentMovie.title),
//                       color: Color.fromARGB(255, 10, 44, 92),
//                       elevation: 4,
//                       child: ListTile(
//                         title: Text(
//                           currentMovie.title,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontWeight: FontWeight.w500,
//                             fontStyle: FontStyle.italic,                            
//                           ),
//                         ),
//                         subtitle: Text(currentMovie.duration ?? 'No information',
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w400,
//                         ),
//                         ),
//                         trailing: IconButton(
//                           onPressed: (){
//                             if (!myList.contains(currentMovie)) {
//                               context.read<MovieProvider>().addToList(currentMovie);
//                             }else
//                             {
//                               context.read<MovieProvider>().removeFromList(currentMovie);
//                             }
//                           },
//                           icon: const Icon(Icons.favorite),
//                           iconSize: 24.0,
//                           color: myList.contains(currentMovie)
//                               ? Colors.red
//                               : Colors.white,
//                         ),
//                       ),
//                     );
//                   }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
