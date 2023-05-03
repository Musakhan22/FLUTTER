import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/providers/movie_provider.dart';

import '../providers/appdata.dart';
import '../screens/screen1.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AppData()),
        ChangeNotifierProvider(create: (_) => MovieProvider()),
      ],
      child: const MaterialApp(
        title: 'Providers',
        debugShowCheckedModeBanner: false,
        home: Screen1()
      ),
    );
  }
}
