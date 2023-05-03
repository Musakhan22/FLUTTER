import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/screens/screen3.dart';

import '../providers/appdata.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<AppData>(context).name;
        return Scaffold(
          appBar: AppBar(
            title: Consumer<AppData>(
              builder: (context, value, child) {
                return Text(value.name);
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Screen3()),
                  );
                },
                icon: const Icon(Icons.navigation),
              ),
            ],
          ),
          body: const Center(
            child: Text('Screen1'),
          ),
        );
  }
}
