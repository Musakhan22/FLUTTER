import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) pickerFunction;

  const UserImagePicker(this.pickerFunction);

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
   File? _pickedImage;

  void _pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 120,
    );
    final pickedImageFile = File(pickedImage!.path); 
    setState(() {
      _pickedImage = pickedImageFile;
    });
    widget.pickerFunction(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) { 
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
        backgroundColor: Colors.grey[100],
          backgroundImage: _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
        OutlinedButton.icon(
          style: OutlinedButton.styleFrom(
            textStyle: TextStyle(
              color: Theme.of(context).colorScheme.background,
            ),
          ),
          onPressed: () {
            _pickImage();
          },
          icon: const Icon(Icons.image_outlined),
          label: const Text('Add image'),
        ),
      ],
    );
  }
}
