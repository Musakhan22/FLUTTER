import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Edit Data',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: 'Text',
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    hoverColor: Colors.blueGrey,
                    border: OutlineInputBorder(  
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
              ),
               Container(
                margin: const EdgeInsets.all(10),
                 child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Name',
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        hoverColor: Colors.blueGrey,
                        border: OutlineInputBorder(  
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
               ),
               const SizedBox(height: 10,),
               Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                ),
                width: 250,
                height: 40,
                child: OutlinedButton(
                  onPressed: (){},
                  child: const Text('Submit'),
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    )
                  ),
                ),
               ),
               Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: const Text(''),
               )
            ],
          ),
        ),
      ),
    );
  }
}