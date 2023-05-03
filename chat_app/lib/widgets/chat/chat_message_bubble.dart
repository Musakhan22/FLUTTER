import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:chat_app/helper/textcontroller.dart';

class MessageBubble extends StatefulWidget {
  final Key key;
  final String message;
  final String userName;
  final String userImage;
  final bool isMe;
  final String userid;

  MessageBubble(
    this.message,
    this.userName,
    this.userImage,
    this.userid,
    this.isMe, {
    required this.key,
  });
  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  final TextControllers textControllers = Get.put(TextControllers());

  void deleteMessage() async {
    final id = widget.userid;
    FirebaseFirestore.instance.collection('chat').doc(id).delete();
  }

  void updatemessage() {
    // final id = widget.userid;
    FirebaseFirestore.instance.collection('chat').doc(widget.userid).update({
      'text': textControllers.inputController.value.text,
      // 'username': textControllers.inputController.value.text,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          mainAxisAlignment:
              widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
          children: [
            GestureDetector(
              onDoubleTap: () {
                updatemessage();
              },
              onLongPress: () {
                deleteMessage();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: widget.isMe ? Colors.orange : Colors.grey,
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(12),
                    topRight: const Radius.circular(12),
                    bottomLeft: !widget.isMe
                        ? const Radius.circular(0)
                        : const Radius.circular(12),
                    bottomRight: widget.isMe
                        ? const Radius.circular(0)
                        : const Radius.circular(12),
                  ),
                ),
                width: 130,
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 15,
                ),
                margin: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 8,
                ),
                child: Column(
                  crossAxisAlignment: widget.isMe
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.userName,
                      style: TextStyle(
                        color: widget.isMe ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      widget.message,
                      style: TextStyle(
                        color: widget.isMe ? Colors.black : Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: widget.isMe ? TextAlign.end : TextAlign.start,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 3,
          left: widget.isMe ? 0 : 120,
          right: widget.isMe ? -120 : null,
          child: CircleAvatar(
            backgroundImage: NetworkImage(widget.userImage),
          ),
        ),
      ],
    );
  }
}
