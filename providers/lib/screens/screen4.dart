import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/appdata.dart';

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Consumer<AppData>(
          builder: (context, value, child) {
            return Text(value.name);
          },
          ),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(Provider.of<AppData>(context,listen: true).name),
            ElevatedButton(
              onPressed: (){
                Provider.of<AppData>(context,listen: false).changeData('Chuck Norris');
              },
              child: const Text('Change data'),
            )
          ],
        ),
      ) ,
    );
  }
}