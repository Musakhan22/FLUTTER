import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_basic/providers/shop_name_notifier.dart';

import '../providers/item_add_notifier.dart';
import './screens/homes_screen.dart';

void main() => runApp(const HomeApp());
// // ChangeNotifierProvider<MovieProvider>(
//     // child: const MyApp(),
//     // create: (_) => MovieProvider(),
//   );
//   // );

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemAddNotifier>
        (create: (context) {
          return ItemAddNotifier();
        }),
        ChangeNotifierProvider<ShopNameNotifier>
        (create: (context) {
          return ShopNameNotifier();
        }),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreens(),
      ),
    );
  }
}
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp( 
//       title: 'List',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(
//           primarySwatch: Colors.deepOrange, 
//           accentColor: Colors.orange,
//         )
//       ),
//       home: HomeScreen(),
//     );
//   }
// }
