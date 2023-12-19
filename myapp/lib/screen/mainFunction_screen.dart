// main_function_screen.dart
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class MainFunctionScreen extends StatefulWidget {
  const MainFunctionScreen({Key? key}) : super(key: key);

  @override
  _MainFunctionScreenState createState() => _MainFunctionScreenState();
}

class _MainFunctionScreenState extends State<MainFunctionScreen> {
  List<File> selectedPhotos = [];

  Future<void> _getImageFromCamera() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        selectedPhotos.add(File(pickedFile.path));
      });
    }
  }

  Future<void> _getImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedPhotos.add(File(pickedFile.path));
      });
    }
  }

  void _savePhotos() {
    Navigator.pop(context, selectedPhotos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Function'),
        actions: [
          if (selectedPhotos.isNotEmpty)
            IconButton(
              onPressed: _savePhotos,
              icon: const Icon(Icons.save),
            ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _getImageFromCamera,
            tooltip: 'Take a Picture',
            child: const Icon(Icons.camera_alt),
          ),
          const SizedBox(height: 16.0),
          FloatingActionButton(
            onPressed: _getImageFromGallery,
            tooltip: 'Pick from Gallery',
            child: const Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}
