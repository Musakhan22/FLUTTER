import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Native code',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _batterylevel;

  Future<void> _getbatterylevel() async {
    const platform = MethodChannel('course.flutter.dev/batterySomethingFile');
    try {
     final batterylevel = await platform.invokeMethod('getbatterylevel'); 
     setState(() {
       _batterylevel = batterylevel;
     });
    } on PlatformException catch (e) {
      setState(() {
        _batterylevel = null;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getbatterylevel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native code'),
      ),
      body: Center(
        child: Text('Battery Level: $_batterylevel'),
      ),
    );
  }
}