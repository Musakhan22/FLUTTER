import 'dart:math';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../widgets/chat/messages.dart';
import '../widgets/chat/new_message.dart';
import '../screens/settings_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

@override
void initState() {
  super.initState();
 final fbm =  FirebaseMessaging.instance.subscribeToTopic('chat');
log(fbm as num);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blueGrey,
              ),
              child: Center(
                child: Text('Home'),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title:const Text('Settings Page') ,
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const SettingsScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('Chatter'),
        actions: [
          DropdownButton(
            underline: Container(),
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.white,
            ),
            items: [
              DropdownMenuItem(
                value: 'Logout',
                child: Container(
                  child: const Row(
                    children: [
                      Icon(
                        Icons.exit_to_app_outlined,
                        color: Colors.black,
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Text('Logout'),
                    ],
                  ),
                ),
              ),
            ],
            onChanged: (item) {
              if (item == 'Logout') {
                FirebaseAuth.instance.signOut();
              }
            },
          )
        ],
      ),
      body: Container(
        child: const Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessages(),
          ],
        ),
      ),
    );
  }
}
