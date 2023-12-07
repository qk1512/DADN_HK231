import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MainFunctionScreen extends StatefulWidget {
  const MainFunctionScreen({Key? key}) : super(key: key);

  @override
  _MainFunctionScreenState createState() => _MainFunctionScreenState();
}

class _MainFunctionScreenState extends State<MainFunctionScreen> {
  File? _image;

  Future<void> _getImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Image'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_image != null)
              Image.file(
                _image!,
                width: 200.0,
                height: 200.0,
              )
            else
              const Text('No image selected.'),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.gallery),
              child: const Text('Pick Image from Gallery'),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.camera),
              child: const Text('Take Photo with Camera'),
            ),
          ],
        ),
      ),
    );
  }
}


void main() {
  runApp(const MaterialApp(
    home: MainFunctionScreen(),
  ));
}
