import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:chat_app/helper/textcontroller.dart';

class NewMessages extends StatefulWidget {
  
  const NewMessages({super.key});
 
  @override
  State<NewMessages> createState() => _NewMessagesState();
  
}

class _NewMessagesState extends State<NewMessages> {
  var _enteredmessage = '';
  final TextControllers textControllers = Get.put(TextControllers());
  
  void _sendMessage() async{
    FocusScope.of(context).unfocus();
    final user =  FirebaseAuth.instance.currentUser;
    final userData = await FirebaseFirestore.instance.collection('users').doc(user!.uid).get();
    FirebaseFirestore.instance.collection('chat').add({
      'text':_enteredmessage,
      'createdAt': Timestamp.now(),
      'userId': user.uid,
      'username': userData['username'],
      'userImage': userData['image_url'],
    });
    textControllers.inputController.value.clear();
    // _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              controller: textControllers.inputController.value,
              decoration: const InputDecoration(
                labelText: 'Enter message',
              ),
              onChanged: (value){
                setState(() {
                  _enteredmessage = value;
                });
              },
            ),
          ),
          IconButton(
            onPressed:_enteredmessage.trim().isEmpty ? null : _sendMessage,
            color: Theme.of(context).colorScheme.primary,
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}